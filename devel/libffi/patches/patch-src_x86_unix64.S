$NetBSD$

Fix for ABI=64 on SunOS, taken from:
http://gcc.gnu.org/ml/java-patches/2010-q1/msg00058.html
--- src/x86/unix64.S.orig	2009-12-29 15:22:26.000000000 +0000
+++ src/x86/unix64.S
@@ -324,7 +324,11 @@ ffi_closure_unix64:
 .LUW9:
 	.size	ffi_closure_unix64,.-ffi_closure_unix64
 
+#ifdef HAVE_AS_X86_64_UNWIND_SECTION_TYPE
+	.section	.eh_frame,"a",@unwind
+#else
 	.section	.eh_frame,"a",@progbits
+#endif
 .Lframe1:
 	.long	.LECIE1-.LSCIE1		/* CIE Length */
 .LSCIE1:
