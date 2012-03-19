$NetBSD$

Fix fd leak on SunOS (https://bugs.php.net/bug.php?id=47675).
--- main/main.c.orig	2011-06-16 01:31:10.000000000 +0000
+++ main/main.c
@@ -2199,7 +2200,7 @@ PHPAPI int php_execute_script(zend_file_
 	zend_file_handle *prepend_file_p, *append_file_p;
 	zend_file_handle prepend_file = {0}, append_file = {0};
 #if HAVE_BROKEN_GETCWD 
-	int old_cwd_fd = -1;
+	volatile int old_cwd_fd = -1;
 #else
 	char *old_cwd;
 	ALLOCA_FLAG(use_heap)
