$NetBSD$

--- summary.c.orig	2011-10-29 14:06:22.000000000 +0000
+++ summary.c
@@ -337,7 +337,7 @@ child_table(const char *fmt, ...)
 static void
 update_col(struct Summary sum, int pkgid, char *line)
 {
-	static uint8_t	said = 0;
+	static uint8_t	said = 1;
 	int				i;
 	char			*val, *p, buf[BUFSIZ];
 
@@ -536,6 +536,22 @@ delete_remote_tbl(struct Summary sum, ch
 		"DELETE FROM REMOTE_PKG WHERE REPOSITORY = '%s';", repo);
 	pkgindb_doquery(buf, NULL, NULL);
 }
+static void
+delete_remote_tbl_each(char *ptbl, char *repo)
+{
+	char buf[BUFSIZ];
+
+	snprintf(buf, BUFSIZ, DELETE_REMOTE,
+		ptbl, ptbl, ptbl, ptbl, ptbl, repo, ptbl);
+	pkgindb_doquery(buf, NULL, NULL);
+
+	if (strstr(ptbl, "_DEPS") != NULL)
+	{
+		snprintf(buf, BUFSIZ,
+			"DELETE FROM REMOTE_PKG WHERE REPOSITORY = '%s';", repo);
+		pkgindb_doquery(buf, NULL, NULL);
+	}
+}
 
 static int
 pdb_clean_remote(void *param, int argc, char **argv, char **colname)
@@ -556,7 +572,10 @@ pdb_clean_remote(void *param, int argc, 
 	/* did not find argv[0] (db repository) in pkg_repos */
 	printf(MSG_CLEANING_DB_FROM_REPO, argv[0]);
 
-	delete_remote_tbl(sumsw[1], argv[0]);
+	delete_remote_tbl_each("REMOTE_DEPS", argv[0]);
+	delete_remote_tbl_each("REMOTE_CONFLICTS", argv[0]);
+	delete_remote_tbl_each("REMOTE_REQUIRES", argv[0]);
+	delete_remote_tbl_each("REMOTE_PROVIDES", argv[0]);
 
 	snprintf(query, BUFSIZ,
 		"DELETE FROM REPOS WHERE REPO_URL = \'%s\';", argv[0]);
@@ -668,7 +687,10 @@ update_db(int which, char **pkgkeep)
 				printf(MSG_PROCESSING_REMOTE_SUMMARY, *prepos);
 
 				/* delete remote* associated to this repository */
-				delete_remote_tbl(sumsw[i], *prepos);
+				delete_remote_tbl_each("REMOTE_DEPS", *prepos);
+				delete_remote_tbl_each("REMOTE_CONFLICTS", *prepos);
+				delete_remote_tbl_each("REMOTE_REQUIRES", *prepos);
+				delete_remote_tbl_each("REMOTE_PROVIDES", *prepos);
 				/* update remote* table for this repository */
 				insert_summary(sumsw[i], summary, *prepos);
 			}
