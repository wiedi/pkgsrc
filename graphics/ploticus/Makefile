# $NetBSD: Makefile,v 1.50 2013/09/04 12:31:25 obache Exp $

DISTNAME=	ploticus242_src
PKGNAME=	ploticus-2.42
PKGREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ploticus/}

MAINTAINER=	rh@NetBSD.org
HOMEPAGE=	http://ploticus.sourceforge.net/
COMMENT=	Versatile data visualization engine
LICENSE=	gnu-gpl-v2

WRKSRC=			${WRKDIR}/${DISTNAME:S/_src//}

BUILD_DIRS=	src
BUILD_TARGET=	pl

DOCSRC=		${WRKSRC}/pltestsuite
PREFABSRC=	${WRKSRC}/prefabs

DOCDST=		share/doc/ploticus
PREFABDST=	share/ploticus

MAKE_ENV+=	XLIBS="-L${X11BASE}/lib -lX11"
MAKE_ENV+=	XINCLUDEDIR="-I${X11BASE}/include"

SUBST_CLASSES+=		prefab
SUBST_STAGE.prefab=	pre-configure
SUBST_MESSAGE.prefab=	Hardcode PLOTICUS_PREFABS.
SUBST_FILES.prefab=	src/pl.h
SUBST_VARS.prefab=	PREFIX

INSTALLATION_DIRS+=	${DOCDST} ${PREFABDST}

post-install:
	${INSTALL_DATA} ${DOCSRC}/* ${DESTDIR}${PREFIX}/${DOCDST}
	${INSTALL_DATA} ${PREFABSRC}/* ${DESTDIR}${PREFIX}/${PREFABDST}

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/gd/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
