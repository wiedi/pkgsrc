# $NetBSD$

BUILDLINK_TREE+=	gcc47-runtime

.if !defined(GCC47_RUNTIME_BUILDLINK3_MK)
GCC47_RUNTIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gcc47-runtime+=	gcc47-runtime>=${_GCC_REQD}
BUILDLINK_ABI_DEPENDS.gcc47-runtime?=	gcc47-runtime>=4.7.0
BUILDLINK_PKGSRCDIR.gcc47-runtime?=	../../lang/gcc47-runtime

FIND_PREFIX:=	BUILDLINK_PREFIX.gcc47-runtime=gcc47-runtime
.include "../../mk/find-prefix.mk"
BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_PREFIX.gcc47-runtime}/gcc47-runtime

BUILDLINK_FILES.gcc47-runtime=		#empty
BUILDLINK_AUTO_VARS.gcc47-runtime=	no

# When not using the GNU linker, gcc will always link shared libraries
# against the shared version of libgcc. Always enable _USE_GCC_SHILB on
# platforms that don't use the GNU linker, such as SunOS.
.include "../../mk/bsd.fast.prefs.mk"
.if ${OPSYS} == "SunOS"
_USE_GCC_SHLIB= yes
.endif

# Packages that link against shared libraries need a full dependency.
.if defined(_USE_GCC_SHLIB)
BUILDLINK_DEPMETHOD.gcc47-runtime+=	full
.else
BUILDLINK_DEPMETHOD.gcc47-runtime?=	build
.endif

pkgbase := gcc47-runtime
.include "../../mk/pkg-build-options.mk"
.if !empty(PKG_BUILD_OPTIONS.gcc47:Mgcc-java) || \
    !empty(PKG_BUILD_OPTIONS.gcc47:Mgcc-go)
.include "../../mk/pthread.buildlink3.mk"
.endif
.if !empty(PKG_BUILD_OPTIONS.gcc47:Mgcc-java)
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.endif

.endif # GCC47_RUNTIME_BUILDLINK3_MK
BUILDLINK_TREE+=	-gcc47-runtime
