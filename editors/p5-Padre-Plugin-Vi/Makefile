# $NetBSD: Makefile,v 1.7 2013/05/31 12:41:00 wiz Exp $
#

DISTNAME=	Padre-Plugin-Vi-0.23.0
PKGNAME=	p5-${DISTNAME:S/.0//}
PKGREVISION=	3
CATEGORIES=	editors perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Padre/}
WRKSRC=		${WRKDIR}/${DISTNAME:S/.0//}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Padre-Plugin-Vi/
COMMENT=	Padre plugin proving a vi keyboard
LICENSE=	${PERL5_LICENSE}

MAKE_JOBS_SAFE=	NO

BUILD_DEPENDS+=	p5-Locale-Msgfmt>=0.14:../../devel/p5-Locale-Msgfmt

DEPENDS+=	p5-Padre>=0.37:../../editors/p5-Padre

PERL5_PACKLIST=		auto/Padre/Plugin/Vi/.packlist
PERL5_MODULE_TYPE=	Module::Install::Bundled

pre-configure:
	cd ${WRKSRC} && find `pwd` -name "*.orig" -type f -exec ${RM} {} \;

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
