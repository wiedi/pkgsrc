$NetBSD$

--- modules/proxy/mod_proxy_fdpass.c.orig	2012-04-04 20:11:57.000000000 +0000
+++ modules/proxy/mod_proxy_fdpass.c
@@ -14,6 +14,10 @@
  * limitations under the License.
  */
 
+#if defined(__sun)
+#define _XOPEN_SOURCE 600
+#endif
+
 #include "mod_proxy.h"
 
 #include <sys/types.h>
