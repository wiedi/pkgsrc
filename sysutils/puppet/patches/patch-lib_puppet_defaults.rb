$NetBSD$

--- lib/puppet/defaults.rb.orig	2012-08-01 19:52:27.034321965 +0000
+++ lib/puppet/defaults.rb
@@ -465,8 +465,8 @@ EOT
   )
 
   setdefaults(:master,
-    :user => ["puppet", "The user puppet master should run as."],
-    :group => ["puppet", "The group puppet master should run as."],
+    :user => ["@PUPPET_USER@", "The user puppet master should run as."],
+    :group => ["@PUPPET_GROUP@", "The group puppet master should run as."],
     :manifestdir => ["$confdir/manifests", "Where puppet master looks for its manifests."],
     :manifest => ["$manifestdir/site.pp", "The entry-point manifest for puppet master."],
     :code => ["", "Code to parse directly.  This is essentially only used
