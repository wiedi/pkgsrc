# $NetBSD: Makefile,v 1.88 2012/09/22 13:48:17 ryoon Exp $

# XXX This is release 0.7.13 but we had date-based pkgnames before.
PKGNAME=	ffmpeg-20120609.${DISTVERSION}
PKGREVISION=	1

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://ffmpeg.mplayerhq.hu/
COMMENT=	Decoding, encoding and streaming software

PKG_DESTDIR_SUPPORT=	user-destdir

CONFIGURE_ARGS+=	--enable-avfilter
#CONFIGURE_ARGS+=	--enable-avfilter-lavf
CONFIGURE_ARGS+=	--enable-postproc

INSTALLATION_DIRS=	lib share/examples/ffmpeg share/doc/ffmpeg

CONF_FILES+=	${PREFIX}/share/examples/ffmpeg/ffserver.conf \
		${PKG_SYSCONFDIR}/ffserver.conf

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--disable-asm
.endif

TEST_TARGET=	check

FFTOOLS=	cws2fws graph2dot lavfi-showfiltfmts pktdumper
FFTOOLS+=	probetest qt-faststart trasher

.include "options.mk"

post-install:
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/doc/TODO \
		${DESTDIR}${PREFIX}/share/doc/ffmpeg
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt \
		${DESTDIR}${PREFIX}/share/doc/ffmpeg
	${INSTALL_DATA} ${WRKSRC}/doc/ffserver.conf \
		${DESTDIR}${PREFIX}/share/examples/ffmpeg
.if !empty(PKG_OPTIONS:Mtools)
.  for tool in ${FFTOOLS}
	${INSTALL_PROGRAM} ${WRKSRC}/tools/${tool} ${DESTDIR}${PREFIX}/bin
.  endfor
.endif

.include "../../mk/compiler.mk"

.if !empty(PKGSRC_COMPILER:Mclang)
CFLAGS+=	-no-integrated-as
.endif

.include "../../multimedia/ffmpeg/Makefile.common"
