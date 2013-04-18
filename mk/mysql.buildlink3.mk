# $NetBSD: mysql.buildlink3.mk,v 1.16 2013/03/02 20:33:03 wiz Exp $
#
# This file is included by packages that require some version of the
# MySQL database client.
#
# === User-settable variables ===
#
# MYSQL_VERSION_DEFAULT
#	The preferred MySQL version.
#
#	Possible: mysql55 mysql51 mysql50 percona55
#	Default: mysql55
#
# === Package-settable variables ===
#
# MYSQL_VERSIONS_ACCEPTED
#	The list of MySQL versions that the package accepts.
#
#	Possible: (see MYSQL_VERSION_DEFAULT)
#	Default: (all)
#
# === Variables defined by this file ===
#
# MYSQL_PKG_PREFIX
#	The package name prefix for mysql-dependent packages.
#
#	Possible: mysql55 mysql51 mysql50 percona55
#

.if !defined(MYSQL_VERSION_MK)
MYSQL_VERSION_MK=	# defined

_VARGROUPS+=		mysql
_USER_VARS.mysql=	MYSQL_VERSION_DEFAULT
_PKG_VARS.mysql=	MYSQL_VERSIONS_ACCEPTED
_SYS_VARS.mysql=	MYSQL_PKGSRCDIR MYSQL_PKG_PREFIX

.include "../../mk/bsd.prefs.mk"

MYSQL_VERSION_DEFAULT?=		mysql55
MYSQL_VERSIONS_ACCEPTED?=	mysql55 mysql51 mysql50 percona55

# transform the list into individual variables
.for mv in ${MYSQL_VERSIONS_ACCEPTED}
_MYSQL_VERSION_${mv}_OK=	yes
.endfor

# check what is installed
_MYSQL_VERSION_INSTALLED!=				\
	if ${PKG_INFO} -qe mysql-client-5.5.*; then	\
		${ECHO} mysql55;			\
	elif ${PKG_INFO} -qe mysql-client-5.1.*; then	\
		${ECHO} mysql51;			\
	elif ${PKG_INFO} -qe mysql-client-5.0.*; then	\
		${ECHO} mysql50;			\
	elif ${PKG_INFO} -qe percona-client-5.5.*; then	\
		${ECHO} percona55;			\
	fi

# if a version is explicitely required, take it
.if defined(MYSQL_VERSION_REQD)
_MYSQL_VERSION=	${MYSQL_VERSION_REQD}
.endif
# if the default is already installed, it is first choice
.if !defined(_MYSQL_VERSION)
.  if defined(_MYSQL_VERSION_${MYSQL_VERSION_DEFAULT}_OK)
.    if !empty(_MYSQL_VERSION_INSTALLED:M${MYSQL_VERSION_DEFAULT})
_MYSQL_VERSION=	${MYSQL_VERSION_DEFAULT}
.    endif
.  endif
.endif
# prefer an already installed version, in order of "accepted"
.if !defined(_MYSQL_VERSION)
.  for mv in ${MYSQL_VERSIONS_ACCEPTED}
.    if !empty(_MYSQL_VERSION_INSTALLED:M${mv})
_MYSQL_VERSION?=	${mv}
.    else
# keep information as last resort - see below
_MYSQL_VERSION_FIRSTACCEPTED?=	${mv}
.    endif
.  endfor
.endif
# if the default is OK for the addon pkg, take this
.if !defined(_MYSQL_VERSION)
.  if defined(_MYSQL_VERSION_${MYSQL_VERSION_DEFAULT}_OK)
_MYSQL_VERSION=	${MYSQL_VERSION_DEFAULT}
.  endif
.endif
# take the first one accepted by the package
.if !defined(_MYSQL_VERSION)
_MYSQL_VERSION=	${_MYSQL_VERSION_FIRSTACCEPTED}
.endif

#
# set variables for the version we decided to use:
#
.if ${_MYSQL_VERSION} == "mysql55"
MYSQL_PKGSRCDIR=	../../databases/mysql55-client
MYSQL_PKG_PREFIX=	mysql55
.elif ${_MYSQL_VERSION} == "mysql51"
MYSQL_PKGSRCDIR=	../../databases/mysql51-client
MYSQL_PKG_PREFIX=	mysql51
.elif ${_MYSQL_VERSION} == "mysql50"
MYSQL_PKGSRCDIR=	../../databases/mysql5-client
MYSQL_PKG_PREFIX=	mysql50
.elif ${_MYSQL_VERSION} == "percona55"
MYSQL_PKGSRCDIR=	../../joyent/percona55-client
MYSQL_PKG_PREFIX=	percona55
.else
# force an error
PKG_FAIL_REASON+=	"[mysql.buildlink3.mk] ${_MYSQL_VERSION} is not a valid mysql package."
.endif

#
# check installed version aginst required:
#
.if !empty(_MYSQL_VERSION_INSTALLED)
.  if ${_MYSQL_VERSION} != ${_MYSQL_VERSION_INSTALLED}
PKG_SKIP_REASON+=	"${PKGBASE} requires ${_MYSQL_VERSION}, but ${_MYSQL_VERSION_INSTALLED} is already installed."
.  endif
.endif

.include "${MYSQL_PKGSRCDIR}/buildlink3.mk"

.endif	# MYSQL_VERSION_MK
