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
#	Possible: mysql56 mysql55 mysql51 percona55
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
# MYSQL_VERSION
#	The MySQL version that is actually used.
#
#	Possible: (see MYSQL_VERSION_DEFAULT)
#

.if !defined(MYSQL_VERSION_MK)
MYSQL_VERSION_MK=	# defined

_VARGROUPS+=		mysql
_USER_VARS.mysql=	MYSQL_VERSION_DEFAULT
_PKG_VARS.mysql=	MYSQL_VERSIONS_ACCEPTED
_SYS_VARS.mysql=	MYSQL_VERSION

.include "bsd.fast.prefs.mk"

MYSQL_VERSION_DEFAULT?=		mysql55
BUILD_DEFS+=			MYSQL_VERSION_DEFAULT
BUILD_DEFS_EFFECTS+=		MYSQL_VERSION

# Package-settable variables
MYSQL_VERSIONS_ACCEPTED?=	${_PKG_MYSQLS}

# The available MySQL packages:
_PKG_MYSQLS=			mysql56 mysql55 mysql51 percona55

_MYSQL_PKGBASE.mysql56=		mysql-client-5.6.*
_MYSQL_PKGSRCDIR.mysql56=	../../databases/mysql56-client

_MYSQL_PKGBASE.mysql55=		mysql-client-5.5.*
_MYSQL_PKGSRCDIR.mysql55=	../../databases/mysql55-client

_MYSQL_PKGBASE.mysql51=		mysql-client-5.1.*
_MYSQL_PKGSRCDIR.mysql51=	../../databases/mysql51-client

_MYSQL_PKGBASE.percona55=	percona-client-5.5.*
_MYSQL_PKGSRCDIR.percona55=	../../joyent/percona55-client

#
# Sanity checks
#
.if empty(_PKG_MYSQLS:M${MYSQL_VERSION_DEFAULT})
PKG_FAIL_REASON+=	"[mysql.buildlink3.mk] Invalid mysql package \""${MYSQL_VERSION_DEFAULT:Q}"\" in MYSQL_VERSION_DEFAULT."
MYSQL_VERSION_DEFAULT=	mysql55
.endif

.for _mv_ in ${MYSQL_VERSIONS_ACCEPTED}
.  if empty(_PKG_MYSQLS:M${_mv_})
PKG_FAIL_REASON+=		"[mysql.buildlink3.mk] Invalid mysql package \""${_mv_:Q}"\" in MYSQL_VERSIONS_ACCEPTED."
MYSQL_VERSIONS_ACCEPTED=	# none
.  endif
.endfor

#
# Mark the acceptable versions and check which packages are installed.
#
.for _mv_ in ${MYSQL_VERSIONS_ACCEPTED}
_MYSQL_OK.${_mv_}=	yes
_MYSQL_INSTALLED.${_mv_}!=					\
	if ${PKG_INFO} -qe ${_MYSQL_PKGBASE.${_mv_}:Q}; then	\
		${ECHO} yes;					\
	else							\
		${ECHO} no;					\
	fi
.endfor
.for _mv_ in ${_PKG_MYSQLS}
_MYSQL_OK.${_mv_}?=	no
.endfor

.undef MYSQL_VERSION

# Use one of the installed MySQL packages..
.for _mv_ in ${MYSQL_VERSIONS_ACCEPTED}
.  if ${_MYSQL_INSTALLED.${_mv_}} == "yes"
MYSQL_VERSION?=		${_mv_}
.  endif
.endfor

# ..otherwise prefer the default one if it is accepted..
.if ${_MYSQL_OK.${MYSQL_VERSION_DEFAULT}} == "yes"
MYSQL_VERSION?=		${MYSQL_VERSION_DEFAULT}
.endif

# ..otherwise just use the first default accepted.
.for _mv_ in ${MYSQL_VERSIONS_ACCEPTED}
MYSQL_VERSION?=		${_mv_}
.endfor

.if defined(MYSQL_VERSION)
.  include "${_MYSQL_PKGSRCDIR.${MYSQL_VERSION}}/buildlink3.mk"
.else
PKG_FAIL_REASON+=	"[mysql.buildlink3.mk] No acceptable mysql version found."
MYSQL_VERSION=		none
.endif

# Variable assignment for multi-mysql packages
MULTI+=		MYSQL_VERSION=${MYSQL_VERSION}

.endif	# MYSQL_VERSION_MK
