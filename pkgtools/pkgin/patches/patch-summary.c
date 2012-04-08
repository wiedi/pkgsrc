$NetBSD$

--- summary.c.orig	2011-10-29 14:06:22.000000000 +0000
+++ summary.c
@@ -46,7 +46,7 @@ static const struct Summary {
 	const char	*provides;
 	const char	*end;
 } sumsw[] = {
-	{
+	[LOCAL_SUMMARY] = {
 		LOCAL_SUMMARY,
 		"LOCAL_PKG",
 		"LOCAL_DEPS",
@@ -55,7 +55,7 @@ static const struct Summary {
 		"LOCAL_PROVIDES",
 		NULL
 	},
-	{
+	[REMOTE_SUMMARY] = {
 		REMOTE_SUMMARY,
 		"REMOTE_PKG",
 		"REMOTE_DEPS",
@@ -337,7 +337,7 @@ child_table(const char *fmt, ...)
 static void
 update_col(struct Summary sum, int pkgid, char *line)
 {
-	static uint8_t	said = 0;
+	static uint8_t	said = 1;
 	int				i;
 	char			*val, *p, buf[BUFSIZ];
 
@@ -511,24 +511,18 @@ insert_summary(struct Summary sum, char 
 static void
 delete_remote_tbl(struct Summary sum, char *repo)
 {
-	char	*ptbl, buf[BUFSIZ];
-	int		i, nelms;
+	char		buf[BUFSIZ];
+	const char	**arr;
 
-	/* number of elements in sum */
-	nelms = (sizeof(sum) - sizeof(int)) / sizeof(char *) - 1;
 	/*
 	 * delete repository related tables
 	 * loop through sumsw structure to record table name
 	 * and call associated SQL query
 	 */
-	for (ptbl = __UNCONST(sum.tbl_name), i = 0;
-		 i < nelms;
-		 ptbl += ((strlen(ptbl) + 1) * sizeof(char)), i++) {
-
-		if (strstr(ptbl, "_PKG") != NULL)
-			continue;
-
-		snprintf(buf, BUFSIZ, DELETE_REMOTE, ptbl, ptbl, repo, ptbl);
+	/* (REMOTE[LOCAL)_PKG is first -> skip */
+	for (arr = &(sum.tbl_name) + 1; *arr != NULL; ++arr) {
+		snprintf(buf, BUFSIZ, DELETE_REMOTE,
+			*arr, *arr, *arr, *arr, *arr, repo, *arr);
 		pkgindb_doquery(buf, NULL, NULL);
 	}
 
@@ -556,7 +550,7 @@ pdb_clean_remote(void *param, int argc, 
 	/* did not find argv[0] (db repository) in pkg_repos */
 	printf(MSG_CLEANING_DB_FROM_REPO, argv[0]);
 
-	delete_remote_tbl(sumsw[1], argv[0]);
+	delete_remote_tbl(sumsw[REMOTE_SUMMARY], argv[0]);
 
 	snprintf(query, BUFSIZ,
 		"DELETE FROM REPOS WHERE REPO_URL = \'%s\';", argv[0]);
