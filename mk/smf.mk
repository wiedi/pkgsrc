# $NetBSD$
#

.if !defined(SMF_MK)
SMF_MK=				# defined

# Directory to hold the SMF manifest/method files
PKG_SMF_DIR?=			lib/svc

# Prefix of SMF services FMRI
SMF_PREFIX?=			pkgsrc

# Variables that can be overriden by the user on a package by package basis
SMF_NAME?=			${PKGBASE:tl}
SMF_INSTANCE?=			default
SMF_MANIFEST?=			manifest.xml
SMF_METHOD?=			method

SMF_MANIFEST_FILE_SRC?=		${FILESDIR}/smf/${SMF_MANIFEST}
SMF_METHOD_FILE_SRC?=		${FILESDIR}/smf/${SMF_METHOD}

SMF_MANIFEST_FILE?=		${PKG_SMF_DIR}/manifest/${SMF_NAME}.xml
SMF_METHOD_FILE?=		${PKG_SMF_DIR}/method/${SMF_NAME}

# A manifest file is a pre-requisite for anything to happen
.  if exists(${SMF_MANIFEST_FILE_SRC})
SMF_TARGETS+=			${DESTDIR}${PREFIX}/${SMF_MANIFEST_FILE}

INSTALLATION_DIRS+=		${PKG_SMF_DIR}/manifest ${PKG_SMF_DIR}/method
GENERATE_PLIST+=		${ECHO} "${SMF_MANIFEST_FILE}";
PRINT_PLIST_AWK+=		/^${SMF_MANIFEST_FILE:S|/|\\/|g}/ { next; }

FILES_SUBST+=			PKGMANDIR=${PKGMANDIR}
FILES_SUBST+=			SMF_PREFIX=${SMF_PREFIX}
FILES_SUBST+=			SMF_NAME=${SMF_NAME}
FILES_SUBST+=			SMF_INSTANCE=${SMF_INSTANCE}
FILES_SUBST+=			SMF_MANIFEST=${SMF_MANIFEST}
FILES_SUBST+=			SMF_METHOD=${SMF_METHOD}
FILES_SUBST+=			SMF_MANIFEST_FILE=${SMF_MANIFEST_FILE}
FILES_SUBST+=			SMF_METHOD_FILE=${SMF_METHOD_FILE}

# Target to add the INSTALL script to auto-import SMF manifest using svccfg
${WRKDIR}/.smfinstall: ${PKGSRCDIR}/mk/install/install-smf
	${CP} ${PKGSRCDIR}/mk/install/install-smf ${WRKDIR}/.smfinstall

INSTALL_TEMPLATES+=		${WRKDIR}/.smfinstall

# Target to install the SMF manifest
${DESTDIR}${PREFIX}/${SMF_MANIFEST_FILE}: ${SMF_MANIFEST_FILE_SRC}
	@${SED} ${FILES_SUBST_SED} ${SMF_MANIFEST_FILE_SRC} > ${WRKDIR}/.smf_${SMF_MANIFEST}
	${INSTALL_DATA} ${WRKDIR}/.smf_${SMF_MANIFEST} ${DESTDIR}${PREFIX}/${SMF_MANIFEST_FILE}

# A method script file is not required
.    if exists(${SMF_METHOD_FILE_SRC})
SMF_TARGETS+=			${DESTDIR}${PREFIX}/${SMF_METHOD_FILE}
GENERATE_PLIST+=		${ECHO} "${SMF_METHOD_FILE}";
PRINT_PLIST_AWK+=		/^${SMF_METHOD_FILE:S|/|\\/|g}/ { next; }

# Target to install the SMF method script
${DESTDIR}${PREFIX}/${SMF_METHOD_FILE}:
	@${SED} ${FILES_SUBST_SED} ${SMF_METHOD_FILE_SRC} > ${WRKDIR}/.smf_${SMF_METHOD}
	${INSTALL_SCRIPT} ${WRKDIR}/.smf_${SMF_METHOD} ${DESTDIR}${PREFIX}/${SMF_METHOD_FILE}
.    endif

.PHONY: smf-message
smf-message:
	@${STEP_MSG} "Generating SMF files for ${PKGNAME}"

post-install: smf-message ${SMF_TARGETS}
.  endif
.endif
