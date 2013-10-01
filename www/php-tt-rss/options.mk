# $NetBSD: options.mk,v 1.1 2013/01/03 13:59:44 ryoon Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.php-tt-rss

PKG_OPTIONS_REQUIRED_GROUPS=	db
PKG_OPTIONS_GROUP.db=		mysql pgsql

PKG_SUGGESTED_OPTIONS=	pgsql

.include "../../mk/bsd.options.mk"

###
### Use mysql or pgsql backend
###
.if !empty(PKG_OPTIONS:Mmysql)
.include "../../mk/mysql.buildlink3.mk"
DEPENDS+=	${PHP_PKG_PREFIX}-${MYSQL_PKG_PREFIX}>=5.2.0:../../databases/php-mysql
.elif !empty(PKG_OPTIONS:Mpgsql)
DEPENDS+=	${PHP_PKG_PREFIX}-pgsql>=5.2.0:../../databases/php-pgsql
.endif
