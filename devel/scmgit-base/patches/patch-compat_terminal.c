$NetBSD$

Backport fix to make HAVE_DEV_TTY work on SunOS.

--- compat/terminal.c.orig	2012-06-17 21:20:45.000000000 +0000
+++ compat/terminal.c
@@ -59,6 +59,7 @@ char *git_terminal_prompt(const char *pr
 
 	r = strbuf_getline(&buf, fh, '\n');
 	if (!echo) {
+		fseek(fh, SEEK_CUR, 0);
 		putc('\n', fh);
 		fflush(fh);
 	}
