# $NetBSD: Makefile,v 1.12 2012/10/28 06:30:03 asau Exp $
#

DISTNAME=	auth_script-alpha1.10
PKGNAME=	${APACHE_PKG_PREFIX}-auth-script-1.10
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=mod-auth-script/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mod-auth-script.sourceforge.net/
COMMENT=	Apache module for script-based authentication

CONFLICTS=	ap-auth-script-[0-9]*

# XXX: apache2: compilation works, installation fails
PKG_APACHE_ACCEPTED=	apache13

.include "../../mk/apache.mk"

APACHE_MODULE_NAME=	mod_auth_script.so
.if ${PKG_APACHE} == "apache13"
APACHE_MODULE_SRC=	mod_auth_script.c
.else
APACHE_MODULE_SRC=	mod_auth_script2.c
.endif

.include "../../www/apache/module.mk"
.include "../../mk/bsd.pkg.mk"
