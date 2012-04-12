$NetBSD$

--- add/perform.c.orig	2012-02-07 07:28:41.014349208 +0000
+++ add/perform.c
@@ -901,7 +901,8 @@ check_platform(struct pkg_task *pkg)
 
 	/* If either the OS or arch are different, bomb */
 	if (strcmp(OPSYS_NAME, pkg->buildinfo[BI_OPSYS]) ||
-	    strcmp(effective_arch, pkg->buildinfo[BI_MACHINE_ARCH]) != 0)
+           (strcmp(effective_arch, pkg->buildinfo[BI_MACHINE_ARCH]) != 0 &&
+             strcmp(OPSYS_NAME, "SunOS") != 0))
 		fatal = 1;
 	else
 		fatal = 0;
