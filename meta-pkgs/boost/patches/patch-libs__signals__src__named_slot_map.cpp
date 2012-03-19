$NetBSD$

--- libs/signals/src/named_slot_map.cpp.orig	2011-10-19 13:05:55.843721742 +0000
+++ libs/signals/src/named_slot_map.cpp
@@ -102,7 +102,7 @@ void named_slot_map::disconnect(const st
       i->first.disconnect();
       i = next;
     }
-    groups.erase(group);
+    groups.erase((const_group_iterator) group);
   }
 }
 
@@ -125,7 +125,7 @@ void named_slot_map::remove_disconnected
     }
 
     // Clear out empty groups
-    if (empty(g)) groups.erase(g++);
+    if (empty(g)) groups.erase((const_group_iterator) g++);
     else ++g;
   }
 }
