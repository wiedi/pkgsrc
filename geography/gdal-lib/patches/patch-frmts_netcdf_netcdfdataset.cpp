$NetBSD$

--- frmts/netcdf/netcdfdataset.cpp.orig	2012-01-04 07:03:37.000000000 +0000
+++ frmts/netcdf/netcdfdataset.cpp
@@ -962,7 +962,7 @@ void  netCDFRasterBand::CheckValidData (
             /* check for nodata and nan */
             if ( CPLIsEqual( (double) ((T *)pImage)[i], dfNoDataValue ) )
                 continue;
-            if( bCheckIsNan && CPLIsNan( ( (T *) pImage)[i] ) ) {
+            if( bCheckIsNan && CPLIsNan( (double) ( (T *) pImage)[i] ) ) {
                 ( (T *)pImage )[i] = (T)dfNoDataValue;
                 continue;
             }
