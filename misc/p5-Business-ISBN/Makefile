# $NetBSD: Makefile,v 1.29 2013/09/05 20:25:25 wiz Exp $

DISTNAME=		Business-ISBN-2.06
PKGNAME=		p5-${DISTNAME}
SVR4_PKGNAME=		p5bui
CATEGORIES=		misc perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Business/}

MAINTAINER=		rhaen@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Business-ISBN/
COMMENT=		Perl5 module to work with International Standard Book Numbers (ISBNs)
LICENSE=		${PERL5_LICENSE}

DEPENDS+=		p5-Business-ISBN-Data>=20081020:../../misc/p5-Business-ISBN-Data
# noted as requested by Makefile.PL, but not used?
# also, p5-URI is depending on this package, so thsi introduces a cycle
#DEPENDS+=		p5-URI-[0-9]*:../../www/p5-URI

PERL5_PACKLIST=		auto/Business/ISBN/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
