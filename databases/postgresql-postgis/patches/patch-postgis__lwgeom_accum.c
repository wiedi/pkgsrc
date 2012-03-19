$NetBSD$

--- postgis/lwgeom_accum.c.orig	2010-03-10 15:38:12.000000000 +0000
+++ postgis/lwgeom_accum.c
@@ -305,7 +305,12 @@ PGISDirectFunctionCall1(PGFunction func,
 	FunctionCallInfoData fcinfo;
 	Datum           result;
 
+#if POSTGIS_PGSQL_VERSION > 90
+  /* PgSLQ 9.1 requires five arcuments to InitFunctionCallInfoData */
+	InitFunctionCallInfoData(fcinfo, NULL, 1, InvalidOid, NULL, NULL);
+#else
 	InitFunctionCallInfoData(fcinfo, NULL, 1, NULL, NULL);
+#endif
 
 	fcinfo.arg[0] = arg1;
 	fcinfo.argnull[0] = false;
