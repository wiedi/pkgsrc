# $NetBSD: Makefile,v 1.47 2013/09/02 19:51:23 adam Exp $

VERSION=	5.2.9
DISTNAME=	gutenprint-${VERSION}
PKGNAME=	gutenprint-lib-${VERSION}
PKGREVISION=	14
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=gimp-print/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	gdt@NetBSD.org
COMMENT=	Drivers for Canon, Epson, Lexmark, and PCL printers
HOMEPAGE=	http://gutenprint.sourceforge.net/

PREV_PKGPATH=	print/gutenprint51-lib

INSTALLVERSION=	5.2
PLIST_SUBST+=	INSTALLVERSION=${INSTALLVERSION}
PRINT_PLIST_AWK+=	{ gsub("gutenprint/${INSTALLVERSION}", \
				"gutenprint/$${INSTALLVERSION}") }
PRINT_PLIST_AWK+=	{ gsub(".${INSTALLVERSION}$$", \
				".$${INSTALLVERSION}") }

USE_TOOLS+=		gmake lex pkg-config perl:run
USE_PKGLOCALEDIR=	YES
USE_LIBTOOL=		YES

# gcc 3.3.3 either can't compile this, or needs huge amounts of RAM (0.5G+).
# Observed on NetBSD/i386 3 and confirmed with upstream.  Apparently it's
# just 3.3.3 - there are no known issues with 2.95 or 4.x.
USE_LANGUAGES+=		c99

GNU_CONFIGURE=		YES

# gutenprint has many options, and really should be split into
# multiple packages.  Splitting is difficult because of the structure
# of the upstream distribution.  For now, this package contains
# everything that gdt wants, because that seems more useful to users
# than not having gutenprint in pkgsrc.

# Adjust configure to disable components that we don't want.  Note
# components that should eventually be in split packages.  Options
# that are on by default are commented out.  Options that default to
# on or off and are not particularly interesting are not mentioned.

# gdt doesn't understand what this means.
# --enable-nls-macosx     build CUPS PPD files [(automatic)]

# cups ppds (separate from cups support, probably)
# Note that the default is to install a program which generates ppds,
# rather than large numbers of ppds.
#CONFIGURE_ARGS+=	--enable-cups-ppds
#CONFIGURE_ARGS+=	--enable-cups-1_2-enhancements
# Disable translated ppds.  Without this option, there are dozens of
# copies of each printer, differing in the CUPS UI only by a language
# code.  The awkwardness seems to outweigh the benefit.
CONFIGURE_ARGS+=	--disable-translated-cups-ppds
# --enable-globalized-cups-ppds (auto)

# Respect upstream's judgement about this issue, without understanding.
# --enable-static-genppd

# GTK2 ui (on by default)
#CONFIGURE_ARGS+=	--enable-libgutenprintui2

# Sample images are small, so let them be included.
#CONFIGURE_ARGS+=	--enable-samples

# escputil is a utility for Epson printers.  It should arguably be in
# a split package, but it's small and useful so splitting isn't worth
# the effort.
CONFIGURE_ARGS+= --enable-escputil

# test pattern generator.  Small, so let it be built
#CONFIGURE_ARGS+=	--enable-test
#CONFIGURE_ARGS+=	--enable-testpattern

# CUPS support, on by default.  This should be in a split package.
#CONFIGURE_ARGS+=	--with-cups

# 201105: Reevaluate what this means and whether we want it.
# Foomatic support.  This should be in a split package, if at all.
CONFIGURE_ARGS+=	--without-foomatic
CONFIGURE_ARGS+=	--without-foomatic3

# Ghostscript support.  This should be in a split package, if at all.
CONFIGURE_ARGS+=	--without-ghostscript

# Something in gutenprint seems to use readline, but it's not clear
# why, so just disable it to reduce dependencies.
CONFIGURE_ARGS+=	--without-readline

# gimp2 plugin, on by default, and named gutenprint
#CONFIGURE_ARGS+=	--with-gimp2
#CONFIGURE_ARGS+=	--with-gimp2-as-gutenprint

# XXX Make command.types be a CONF_FILE

TEST_TARGET=		check

# A libintl is optional in gutenprint.
.include "../../devel/gettext-lib/buildlink3.mk"

# gutenprint-gimp: gimp plugin
.include "../../graphics/gimp/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

# gutenprint-cups: cups support
.include "../../print/cups/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
