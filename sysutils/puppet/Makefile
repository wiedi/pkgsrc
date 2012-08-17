# $NetBSD: Makefile,v 1.12 2010/09/13 14:39:30 taca Exp $

DISTNAME=		puppet-2.7.18
CATEGORIES=		sysutils
#MASTER_SITES=		http://puppetlabs.com/downloads/puppet/

MAINTAINER=		tonnerre@NetBSD.org
HOMEPAGE=		http://www.puppetlabs.com/
COMMENT=		Configuration management framework written in Ruby
LICENSE=		gnu-gpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

RUBY_VERSION_SUPPORTED=	192 18

DEPENDS+=		${RUBY_PKGPREFIX}-facter>=1.3.8:../../sysutils/ruby-facter

CONFLICTS+=		ruby[1-9][0-9]-puppet-[0-9]* puppet-[0-9]*

PKG_SYSCONFSUBDIR=	puppet
RCD_SCRIPTS=		puppetd puppetmasterd

SUBST_CLASSES+=		prefix
SUBST_STAGE.prefix=	post-patch
SUBST_FILES.prefix=	lib/puppet/reference/configuration.rb
SUBST_FILES.prefix+=	conf/solaris/smf/puppetd.xml
SUBST_FILES.prefix+=	conf/solaris/smf/puppetmasterd.xml
SUBST_SED.prefix=	-e "s|/etc/puppet|${PKG_SYSCONFDIR}|g"
SUBST_SED.prefix+=	-e "s|network/puppet|pkgsrc/puppet|g"
SUBST_VARS.prefix+=	PREFIX PKG_SYSCONFDIR

EGDIR=			share/examples/${PKGBASE}
CONF_FILES=		${EGDIR}/puppet.conf ${PKG_SYSCONFDIR}/puppet.conf

# Since these users are needed only for puppet server,
# puppet-server package should be created.
SUBST_CLASSES+=		user
SUBST_STAGE.user=	post-patch
SUBST_FILES.user=	lib/puppet/defaults.rb
SUBST_VARS.user=	PUPPET_GROUP PUPPET_USER

PKG_GROUPS_VARS=		PUPPET_GROUP
PKG_USERS_VARS=			PUPPET_USER

PKG_GROUPS=			${PUPPET_GROUP}
PKG_USERS=			${PUPPET_USER}:${PUPPET_GROUP}
PKG_GECOS.${PUPPET_USER}=	Puppet configuration management pseudo-user

PLIST_SUBST+=		EGDIR=${EGDIR}
PLIST_VARS+=		sunos

BUILD_DEFS+=		VARBASE
INSTALLATION_DIRS+=	${EGDIR}

.include "../../mk/bsd.prefs.mk"

PUPPET_GROUP?=		puppet
PUPPET_USER?=		puppet

PUPPET_LOGDIR?=		${VARBASE}/log/puppet
PUPPET_RUNDIR?=		${VARBASE}/run/puppet
PUPPET_VARDIR?=		${VARBASE}/lib/puppet

OWN_DIRS_PERMS+=	${PUPPET_LOGDIR} ${PUPPET_USER} ${PUPPET_GROUP} 0750
OWN_DIRS_PERMS+=	${PUPPET_RUNDIR} ${PUPPET_USER} ${PUPPET_GROUP} 0750
OWN_DIRS_PERMS+=	${PUPPET_VARDIR} ${PUPPET_USER} ${PUPPET_GROUP} 0750

.if ${OPSYS} == "SunOS"
INSTALLATION_DIRS+=	share/smf/${PKGBASE}
PLIST.sunos=		yes
.endif

pre-build:
	cd ${WRKSRC} && ${FIND} . -type f -exec ${CHMOD} g-w {} \;
	cd ${WRKSRC} && \
		${FIND} lib/puppet spec test -type f -exec ${CHMOD} -x {} \;

post-install:
	${INSTALL_DATA} ${FILESDIR}/puppet.conf				\
		${DESTDIR}${PREFIX}/${EGDIR}
.if ${OPSYS} == "SunOS"
	${INSTALL_DATA} ${WRKSRC}/conf/solaris/smf/puppetd.xml		\
		${DESTDIR}${PREFIX}/share/smf/${PKGBASE}
	${INSTALL_DATA} ${WRKSRC}/conf/solaris/smf/puppetmasterd.xml	\
		${DESTDIR}${PREFIX}/share/smf/${PKGBASE}
.endif

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
