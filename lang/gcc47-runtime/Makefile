# $NetBSD$

GCC_RUNTIME:=	yes

.include "../../lang/gcc47/Makefile"

PKGNAME=	${GCC_PKGNAME}-runtime-${GCC_DIST_VERSION}

PATCHDIR=	${GCC_PKGPATH}/patches
DISTINFO_FILE=	${GCC_PKGPATH}/distinfo

PKG_PRESERVE=   yes

do-install:
	cd ${WRKDIR}/build && \
		${SETENV} ${MAKE_ENV} ${GMAKE} install-target DESTDIR=${DESTDIR}
		${RM} -rf ${DESTDIR}${GCC_PREFIX}/include ${DESTDIR}${GCC_PREFIX}/share \
		${DESTDIR}${GCC_PREFIX}/lib/gcc

.include "../../mk/bsd.pkg.mk"
