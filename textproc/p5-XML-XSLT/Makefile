# $NetBSD: Makefile,v 1.26 2013/05/31 12:42:22 wiz Exp $

DISTNAME=	XML-XSLT-0.48
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
SVR4_PKGNAME=	p5xxs
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=XML/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://xmlxslt.sourceforge.net/
COMMENT=	Perl5 module for processing XSLT

PKG_INSTALLATION_TYPES=	overwrite pkgviews

DEPENDS+=	p5-XML-DOM>=1.25:../../textproc/p5-XML-DOM
DEPENDS+=	p5-XML-Parser>=2.23:../../textproc/p5-XML-Parser
DEPENDS+=	p5-libwww-[0-9]*:../../www/p5-libwww

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/XML/XSLT/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
