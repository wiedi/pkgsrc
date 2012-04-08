# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.libarchive
PKG_SUPPORTED_OPTIONS=	ssl lzma
PKG_SUGGESTED_OPTIONS=	ssl lzma

.include "../../mk/bsd.options.mk"

###
### OpenSSL support
###
.if !empty(PKG_OPTIONS:Mssl)
.  include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-openssl
.endif

###
### LZMA support
###
.if !empty(PKG_OPTIONS:Mlzma)
.  include "../../archivers/xz/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-lzma
.endif
