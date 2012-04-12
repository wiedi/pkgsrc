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
