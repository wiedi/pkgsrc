# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.bsdtar
PKG_SUPPORTED_OPTIONS=	ssl
PKG_SUGGESTED_OPTIONS=	#

.include "../../mk/bsd.options.mk"

###
### OpenSSL support
###
.if !empty(PKG_OPTIONS:Mssl)
.  include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-openssl
.endif
