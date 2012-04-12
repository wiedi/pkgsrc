# $NetBSD: Makefile,v 1.1.1.1 2011/09/15 08:31:25 adam Exp $

PKGNAME=	${DISTNAME:C/-/91-plperl-/}
COMMENT=	PL/Perl procedural language for the PostgreSQL backend

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	postgresql91-server>=${PKGVERSION_NOREV}:../../databases/postgresql91-server

.include "../../databases/postgresql91/Makefile.common"

USE_TOOLS+=		perl
PERL5_CONFIGURE=	no
CONFIGURE_ARGS+=	--with-perl
BUILD_MAKE_FLAGS=	PGXS=1

# This is an ugly hack, but no other fix is likely
# See this URL for the discussion:
# http://postgresql.1045698.n5.nabble.com/list-head-naming-conflict-gcc-4-2-perl-solaris-td2009542.html
SUBST_CLASSES+=		list
SUBST_MESSAGE.list=	Hacking around conflicting list_* functions
SUBST_FILES.list=	../.buildlink/include/postgresql/server/nodes/pg_list.h
SUBST_STAGE.list=	post-wrapper
SUBST_SED.list=		-e 's/list_head/pg_list_head/g'
SUBST_SED.list+=	-e 's/list_tail/pg_list_tail/g'

BUILD_DIRS=		src/pl/plperl
MAKE_FILE=		GNUmakefile

.include "../../databases/postgresql91-client/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
