$NetBSD$

Fix for GCC 4.7.
--- src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h.orig	2011-12-08 05:06:02.000000000 +0000
+++ src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
@@ -32,8 +32,7 @@ namespace JSC{
     
     class JSStaticScopeObject : public JSVariableObject {
     protected:
-        using JSVariableObject::JSVariableObjectData;
-        struct JSStaticScopeObjectData : public JSVariableObjectData {
+        struct JSStaticScopeObjectData : public JSVariableObject::JSVariableObjectData {
             JSStaticScopeObjectData()
                 : JSVariableObjectData(&symbolTable, &registerStore + 1)
             {
