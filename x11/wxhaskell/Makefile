# $NetBSD: Makefile,v 1.47 2013/09/02 19:51:32 adam Exp $

DISTNAME=	wxhaskell-src-0.9.4
PKGNAME=	${DISTNAME:S/-src//}
PKGREVISION=	30
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=wxhaskell/}
EXTRACT_SUFX=	.zip

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://haskell.org/haskellwiki/WxHaskell
COMMENT=	Haskell wxGTK bindings

PKG_DESTDIR_SUPPORT=	none

USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake

WRKSRC=			${WRKDIR}/${PKGNAME_NOREV}

MAKE_FILE=		makefile
MAKE_FLAGS+=		X11BASE=${X11BASE:Q}

# I don't know where that number comes from, but it changes sometimes.
PLIST_SUBST+=		GTKVERSION=2.6.3
CHECK_FILES_SKIP+=	lib/ghc-6.4.1/package.conf.old

pre-configure:
	cd ${WRKSRC} && ./configure --prefix=${PREFIX} --with-opengl

.include "../../lang/ghc/buildlink3.mk"
.include "../../x11/wxGTK26/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
