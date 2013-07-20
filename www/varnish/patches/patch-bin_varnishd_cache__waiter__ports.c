$NetBSD$

Fix as per https://www.varnish-cache.org/trac/ticket/1167

--- bin/varnishd/cache_waiter_ports.c.orig	Mon Aug 20 09:20:40 2012
+++ bin/varnishd/cache_waiter_ports.c	Tue Jul 16 21:00:25 2013
@@ -225,7 +225,7 @@
 
 		if (sp) {
 			double tmo =
-			    (sp->t_end + cache_param->timeout_idle) - now;
+			    (sp->t_end + params->sess_timeout) - now;
 
 			/* we should have removed all sps whose timeout has passed */
 			assert(tmo > 0.0);
