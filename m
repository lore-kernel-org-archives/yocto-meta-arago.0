Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A256C27C6E
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 01:11:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1828.1718413881222245183
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 18:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IUXEGOg4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45F1BHlJ128940;
	Fri, 14 Jun 2024 20:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718413877;
	bh=JYUDwHRovW72O0JfkYRGHEAAqoXXDSAU0TK/Nz9EYXk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=IUXEGOg4Bc2DAg3IJGxqzVVFyKxWTTmz7D3PO/9GkhEzvLPy10BovU/p0iZiGtYri
	 F/7ODPbEbbpx9eUoqN2oWB3X9tC0zxugpd8imUCsHkA0pYB0e3y4m2VdbnOYygBhep
	 jp+fccEUqRkZWs40ZlK5ODrIqmoJN3hSEtXeCCDk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45F1BHMi001904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 20:11:17 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 20:11:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 20:11:17 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45F1BHcW052469;
	Fri, 14 Jun 2024 20:11:17 -0500
Message-ID: <422271f2-4d22-4a6f-aec4-4231682ee2f1@ti.com>
Date: Fri, 14 Jun 2024 20:11:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] icu: Backport version 74-2 from
 oe-core
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <17D8F8D0F1841FD1.26643@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17D8F8D0F1841FD1.26643@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 15 Jun 2024 01:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15391


This patch was a bust.  I thought my initial testing was working, but 
the same problem was masked behing another error.  This patch did not 
fix the qtwebkit issue.  So I'm not taking the patch.


On 6/14/2024 3:27 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> To address a compilation issue with qtwebkit, we are backporting the
> 74-2 version from oe-core [1] and preferring this version of ICU for
> Arago.
> 
> [1] https://git.openembedded.org/openembedded-core/plain/meta/recipes-support/icu/icu_74-2.bb?id=eeed9f6a8e83eb29da8cb69a25dd690712e3ac1b
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../conf/distro/include/arago-prefs.inc       |   3 +
>   .../0001-Disable-LDFLAGSICUDT-for-Linux.patch |  25 +++
>   .../icu/0001-icu-Added-armeb-support.patch    |  27 ++++
>   .../recipes-support/icu/icu/filter.json       |   2 +
>   .../icu/icu/fix-install-manx.patch            |  55 +++++++
>   .../recipes-support/icu/icu_74-2.bb           | 149 ++++++++++++++++++
>   6 files changed, 261 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
>   create mode 100644 meta-arago-distro/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
>   create mode 100644 meta-arago-distro/recipes-support/icu/icu/filter.json
>   create mode 100644 meta-arago-distro/recipes-support/icu/icu/fix-install-manx.patch
>   create mode 100644 meta-arago-distro/recipes-support/icu/icu_74-2.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 34c3c539..beb3575e 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -19,3 +19,6 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>   #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
>   #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
>   #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
> +
> +# Temporarily carry icu patch and prefer this version to fix qtwebkit compile issue.
> +PREFERRED_VERSION_icu = "74-2"
> diff --git a/meta-arago-distro/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta-arago-distro/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
> new file mode 100644
> index 00000000..c0e9e280
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
> @@ -0,0 +1,25 @@
> +From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 15 Feb 2014 21:06:42 +0000
> +Subject: [PATCH] Disable LDFLAGSICUDT for Linux
> +
> +Upstream-Status: Inappropriate [ OE Configuration ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + config/mh-linux | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/mh-linux b/config/mh-linux
> +index 53d6780..b622513 100644
> +--- a/config/mh-linux
> ++++ b/config/mh-linux
> +@@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
> + LD_RPATH_PRE = -Wl,-rpath,
> +
> + ## These are the library specific LDFLAGS
> +-LDFLAGSICUDT=-nodefaultlibs -nostdlib
> ++# LDFLAGSICUDT=-nodefaultlibs -nostdlib
> +
> + ## Compiler switch to embed a library name
> + # The initial tab in the next line is to prevent icu-config from reading it.
> diff --git a/meta-arago-distro/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta-arago-distro/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> new file mode 100644
> index 00000000..a25285fb
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> @@ -0,0 +1,27 @@
> +From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Wed, 8 May 2019 14:42:30 +0900
> +Subject: [PATCH] icu: Added armeb support.
> +
> +Make icu support arm32 BE.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + i18n/double-conversion-utils.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
> +index 303668f..7d859dc 100644
> +--- a/i18n/double-conversion-utils.h
> ++++ b/i18n/double-conversion-utils.h
> +@@ -146,7 +146,7 @@ int main(int argc, char** argv) {
> + //
> + // If it prints "correct" then the architecture should be here, in the "correct" section.
> + #if defined(_M_X64) || defined(__x86_64__) || \
> +-    defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
> ++    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
> +     defined(__hppa__) || defined(__ia64__) || \
> +     defined(__mips__) || \
> +     defined(__loongarch__) || \
> diff --git a/meta-arago-distro/recipes-support/icu/icu/filter.json b/meta-arago-distro/recipes-support/icu/icu/filter.json
> new file mode 100644
> index 00000000..2c63c085
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu/filter.json
> @@ -0,0 +1,2 @@
> +{
> +}
> diff --git a/meta-arago-distro/recipes-support/icu/icu/fix-install-manx.patch b/meta-arago-distro/recipes-support/icu/icu/fix-install-manx.patch
> new file mode 100644
> index 00000000..16cabc82
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu/fix-install-manx.patch
> @@ -0,0 +1,55 @@
> +From 2d544cac238eccbfc32cafc9502ddf6e00994211 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Fri, 9 Oct 2015 17:50:41 +0100
> +Subject: [PATCH] icu: fix install race
> +
> +The generic recursive target calls target-local so also adding it to the
> +dependency list results in races due to install-local being executed twice in
> +parallel.  For example, install-manx can fail if the two install processes race
> +and one process tries to chown a file that the other process has just deleted.
> +
> +Also install-manx should be a phony target, and for clarity use $^ instead of $?
> +in the install command.
> +
> +Upstream ticket: https://unicode-org.atlassian.net/jira/software/c/projects/ICU/issues/ICU-21172
> +
> +Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/2966]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + Makefile.in | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 8366f01..79b91c9 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -77,7 +77,7 @@ EXTRA_DATA =
> +
> + ## List of phony targets
> + .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
> +-install-recursive clean clean-local clean-recursive distclean		\
> ++install-recursive install-manx clean clean-local clean-recursive distclean		\
> + distclean-local distclean-recursive doc dist dist-local dist-recursive	\
> + check check-local check-recursive clean-recursive-with-twist install-icu \
> + doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
> +@@ -88,9 +88,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
> +
> + ## List of standard targets
> + all: all-local all-recursive
> +-install: install-recursive install-local
> ++install: install-recursive
> + clean: clean-recursive-with-twist clean-local
> +-distclean : distclean-recursive distclean-local
> ++distclean : distclean-recursive
> + dist: dist-recursive
> + check: all check-recursive
> + check-recursive: all
> +@@ -357,7 +357,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
> + install-manx: $(MANX_FILES)
> + 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
> + ifneq ($(MANX_FILES),)
> +-	$(INSTALL_DATA) $? $(DESTDIR)$(mandir)/man$(SECTION)
> ++	$(INSTALL_DATA) $^ $(DESTDIR)$(mandir)/man$(SECTION)
> + endif
> +
> + config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
> diff --git a/meta-arago-distro/recipes-support/icu/icu_74-2.bb b/meta-arago-distro/recipes-support/icu/icu_74-2.bb
> new file mode 100644
> index 00000000..8352bf2a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu_74-2.bb
> @@ -0,0 +1,149 @@
> +SUMMARY = "International Component for Unicode libraries"
> +DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> +portable set of C/C++ and Java libraries for Unicode support, software \
> +internationalization (I18N) and globalization (G11N), giving applications the \
> +same results on all platforms."
> +HOMEPAGE = "http://site.icu-project.org/"
> +
> +LICENSE = "ICU"
> +DEPENDS = "icu-native autoconf-archive-native"
> +
> +CVE_PRODUCT = "international_components_for_unicode"
> +
> +S = "${WORKDIR}/icu/source"
> +SPDX_S = "${WORKDIR}/icu"
> +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> +
> +ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
> +
> +inherit autotools pkgconfig github-releases
> +
> +# ICU needs the native build directory as an argument to its --with-cross-build option when
> +# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> +# into consideration, the native build directory needs to be staged.
> +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
> +EXTRA_OECONF:class-native = "--disable-icu-config"
> +EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
> +
> +EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> +TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> +
> +ASNEEDED = ""
> +
> +do_compile:prepend:class-target () {
> +	# Make sure certain build host references do not end up being compiled
> +	# in the image. This only affects libicutu and icu-dbg
> +	sed  \
> +	    -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> +	    -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> +	    -i ${B}/tools/toolutil/Makefile
> +}
> +
> +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> +do_install:append:class-native() {
> +	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +	cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> +	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> +	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> +}
> +
> +do_install:append:class-target() {
> +    # The native pkgdata can not generate the correct data file.
> +    # Use icupkg to re-generate it.
> +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> +        rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
> +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
> +    fi
> +	
> +	# Remove build host references...
> +	sed -i  \
> +	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +	    -e 's|${DEBUG_PREFIX_MAP}||g' \
> +	    -e 's:${HOSTTOOLS_DIR}/::g' \
> +	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
> +	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
> +}
> +
> +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> +
> +FILES:${PN}-dev += "${libdir}/${BPN}/"
> +
> +FILES:libicudata = "${libdir}/libicudata.so.*"
> +FILES:libicuuc = "${libdir}/libicuuc.so.*"
> +FILES:libicui18n = "${libdir}/libicui18n.so.*"
> +FILES:libicutu = "${libdir}/libicutu.so.*"
> +FILES:libicuio = "${libdir}/libicuio.so.*"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=08dc3852df8fffa807301902ad899ff8"
> +
> +def icu_download_version(d):
> +    pvsplit = d.getVar('PV').split('-')
> +    return pvsplit[0] + "_" + pvsplit[1]
> +
> +def icu_download_folder(d):
> +    pvsplit = d.getVar('PV').split('-')
> +    return pvsplit[0] + "-" + pvsplit[1]
> +
> +def icu_install_folder(d):
> +    pvsplit = d.getVar('PV').split('-')
> +    return pvsplit[0] + "." + pvsplit[1]
> +
> +ICU_PV = "${@icu_download_version(d)}"
> +ICU_FOLDER = "${@icu_download_folder(d)}"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20486/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +
> +BASE_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
> +DATA_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
> +SRC_URI = "${BASE_SRC_URI};name=code \
> +           ${DATA_SRC_URI};name=data \
> +           file://filter.json \
> +           file://fix-install-manx.patch \
> +           file://0001-icu-Added-armeb-support.patch \
> +           "
> +
> +SRC_URI:append:class-target = "\
> +           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> +          "
> +SRC_URI[code.sha256sum] = "68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
> +SRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"
> +
> +UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
> +GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
> +
> +EXTRA_OECONF:append:libc-musl = " ac_cv_func_strtod_l=no"
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[make-icudata] = ",,,"
> +
> +do_make_icudata:class-target () {
> +    ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
> +    cd ${S}
> +    rm -rf data
> +    cp -a ${WORKDIR}/data .
> +    AR='${BUILD_AR}' \
> +    CC='${BUILD_CC}' \
> +    CPP='${BUILD_CPP}' \
> +    CXX='${BUILD_CXX}' \
> +    RANLIB='${BUILD_RANLIB}' \
> +    CFLAGS='${BUILD_CFLAGS}' \
> +    CPPFLAGS='${BUILD_CPPFLAGS}' \
> +    CXXFLAGS='${BUILD_CXXFLAGS}' \
> +    LDFLAGS='${BUILD_LDFLAGS}' \
> +    ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
> +    ./runConfigureICU Linux --with-data-packaging=archive
> +    oe_runmake
> +    install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> +}
> +
> +do_make_icudata() {
> +    :
> +}
> +
> +addtask make_icudata before do_configure after do_patch do_prepare_recipe_sysroot

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

