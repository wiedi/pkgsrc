# $NetBSD: Makefile,v 1.69 2013/02/16 11:24:54 wiz Exp $
#

PKGNAME=	${DISTNAME:S/links/&-gui/}
PKGREVISION=	1
COMMENT=	Lynx-like text and graphics WWW browser

CONFLICTS+=	links-[0-9]* elinks-0.3*

USE_TOOLS+=	pkg-config
CONFIGURE_ARGS+=	--enable-graphics
CONFIGURE_ARGS+=	--without-sdl

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../www/links/Makefile.common"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
