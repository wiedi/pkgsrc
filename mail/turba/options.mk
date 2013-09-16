# $NetBSD: options.mk,v 1.3 2006/06/02 18:27:56 joerg Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.turba
PKG_SUPPORTED_OPTIONS=	ldap mysql
PKG_SUGGESTED_OPTIONS=	ldap

.include "../../mk/bsd.options.mk"

###
### Use OpenLDAP for storing data
###
.if !empty(PKG_OPTIONS:Mldap)
DEPENDS+=	${PHP_PKG_PREFIX}-ldap>=4.3.3:../../databases/php-ldap
.endif

###
### Use MySQL for storing data
###
.if !empty(PKG_OPTIONS:Mmysql)
.include "../../mk/mysql.buildlink3.mk"
DEPENDS+=	${PHP_PKG_PREFIX}-${MYSQL_PKG_PREFIX}>=4.3.3:../../databases/php-mysql
.endif
