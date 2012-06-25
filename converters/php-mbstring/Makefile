# $NetBSD: Makefile,v 1.2 2010/07/24 22:24:21 tron Exp $

MODNAME=		mbstring
CATEGORIES+=		converters
COMMENT=		PHP extension for multibyte characters support
LICENSE=		php

PKG_DESTDIR_SUPPORT=	user-destdir

CONFLICTS=		php-mbstring-[0-9]*

INSTALLATION_DIRS+=	${PREFIX}/include/php/ext/mbstring
INSTALLATION_DIRS+=	${PREFIX}/include/php/ext/mbstring/libmbfl
INSTALLATION_DIRS+=	${PREFIX}/include/php/ext/mbstring/libmbfl/filters
INSTALLATION_DIRS+=	${PREFIX}/include/php/ext/mbstring/libmbfl/mbfl
INSTALLATION_DIRS+=	${PREFIX}/include/php/ext/mbstring/libmbfl/nls

PLIST_SRC+=		${.CURDIR}/PLIST.libmbfl

CONFIGURE_ARGS+=	--enable-${MODNAME}=shared,${BUILDLINK_DIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/libmbfl/filters/*.h ${DESTDIR}${PREFIX}/include/php/ext/mbstring/libmbfl/filters
	${INSTALL_DATA} ${WRKSRC}/libmbfl/mbfl/*.h ${DESTDIR}${PREFIX}/include/php/ext/mbstring/libmbfl/mbfl
	${INSTALL_DATA} ${WRKSRC}/libmbfl/nls/*.h ${DESTDIR}${PREFIX}/include/php/ext/mbstring/libmbfl/nls

.include "../../lang/php/ext.mk"
.include "../../mk/bsd.pkg.mk"
