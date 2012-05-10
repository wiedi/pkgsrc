$NetBSD$

Fix for GCC 4.7.
--- src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h.orig	2011-12-08 05:06:02.000000000 +0000
+++ src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
@@ -57,9 +57,7 @@ namespace JSC {
     
     class JSGlobalObject : public JSVariableObject {
     protected:
-        using JSVariableObject::JSVariableObjectData;
-
-        struct JSGlobalObjectData : public JSVariableObjectData {
+        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
             // We use an explicit destructor function pointer instead of a
             // virtual destructor because we want to avoid adding a vtable
             // pointer to this struct. Adding a vtable pointer would force the
