$NetBSD$

Add missing DTrace probe definition.
--- memcached_dtrace.d.orig	2010-09-22 14:46:24.000000000 +0000
+++ memcached_dtrace.d
@@ -194,6 +194,7 @@ provider memcached {
     * @param casid the casid for the item
     */
    probe command__get(int connid, const char *key, int keylen, int size, int64_t casid);
+   probe command__touch(int connid, const char *key, int keylen, int size, int64_t casid);
 
    /**
     * Fired for an add-command.
