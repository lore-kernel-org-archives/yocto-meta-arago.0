Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46B2C001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36468.1688678591609858411
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1785D40C8F;
	Thu,  6 Jul 2023 21:23:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VO3GY5KbkjV; Thu,  6 Jul 2023 21:23:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F119A40C85;
	Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 42575163BF2;
	Thu,  6 Jul 2023 17:23:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 5/6] meta-arago: remove extra plumbing for internal toolchain
Date: Thu,  6 Jul 2023 21:23:03 +0000
Message-Id: <20230706212304.1893414-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212304.1893414-1-denis@denix.org>
References: <20230706212304.1893414-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14783

From: Denys Dmytriyenko <denys@konsulko.com>

No longer needed w/o external toolchain - use defaults from OE-Core.

Also remove extra code that was trying to unify internal and external
toolchains structures in meta-toolchain-arago.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf      | 10 ----
 .../conf/distro/include/toolchain-gcc.inc     | 41 --------------
 .../distro/include/toolchain-internal.inc     |  4 --
 .../recipes-core/meta/meta-toolchain-arago.bb | 54 +++++--------------
 4 files changed, 14 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.i=
nc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-inter=
nal.inc

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 33454068..97a05074 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -149,16 +149,6 @@ ARAGO_SYSTEST_ENABLE ?=3D "0"
 ARAGO_KERNEL_SUFFIX:append =3D "${@oe.utils.conditional("ARAGO_SYSTEST_E=
NABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES:remove =3D "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_EN=
ABLE') =3D=3D '1']}"
=20
-# Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
-# Set some sane defaults, in case someone forgets to set them in local.c=
onf
-TC_SANE_DEFAULT ?=3D "arm"
-TOOLCHAIN_TYPE ?=3D "internal"
-TOOLCHAIN_TYPE:omapl138 =3D "internal"
-TOOLCHAIN_BRAND ?=3D "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('T=
OOLCHAIN_TYPE') =3D=3D 'internal']}"
-
-require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-
 # Enable basic stack and buffer overflow protections
 #TARGET_CPPFLAGS +=3D "-fstack-protector -D_FORTIFY_SOURCE=3D1"
 #TARGET_CPPFLAGS +=3D "-fstack-protector"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-gcc.inc
deleted file mode 100644
index c2f730e0..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-# Select internal gcc toolchain to be built from sources
-TCMODE =3D "default"
-TCLIBC =3D "glibc"
-
-LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=3D=
 '']}"
-
-# Match some of the external vars
-TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
-TOOLCHAIN_PREFIX :=3D "${TARGET_PREFIX}"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "gc=
c-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?=3D "13%"
-SDKBINUVERSION ?=3D "2.40%"
-SDKGLIBCVERSION ?=3D "2.37%"
-
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?=3D "${SDKGCCVERSION}=
"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${SDKBINUVERSION}"
-
-PREFERRED_VERSION_nativesdk-gcc-runtime ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc ?=3D "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-locale ?=3D "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGLIBCVERSION}"
-
-# Set target toolchain preferences to match Cross/SDK by default
-# Can be overwritten globally, if needed
-GCCVERSION ?=3D "13%"
-BINUVERSION ?=3D "2.40%"
-GLIBCVERSION ?=3D "2.37%"
-
-PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
-PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
-PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-internal.inc=
 b/meta-arago-distro/conf/distro/include/toolchain-internal.inc
deleted file mode 100644
index cbc3b53d..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-internal.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# No special handling is required for locating the internal toolchain, j=
ust re-use existing vars
-TOOLCHAIN_PATH ?=3D "${STAGING_BINDIR_TOOLCHAIN}"
-TOOLCHAIN_SYSPATH ?=3D "${TOOLCHAIN_PATH}/${TARGET_SYS}"
-EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 5c1c3ad0..8bff9abb 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -33,8 +33,8 @@ toolchain_create_sdk_env_script () {
 	echo 'fi' >> $script
 	echo 'export SDK_SYS=3D${SDK_SYS}' >> $script
 	echo 'export REAL_MULTIMACH_TARGET_SYS=3D${REAL_MULTIMACH_TARGET_SYS}' =
>> $script
-	echo 'export TOOLCHAIN_SYS=3D${TOOLCHAIN_SYS}' >> $script
-	echo 'export TOOLCHAIN_PREFIX=3D$TOOLCHAIN_SYS-' >> $script
+	echo 'export TARGET_SYS=3D${TARGET_SYS}' >> $script
+	echo 'export TARGET_PREFIX=3D$TARGET_SYS-' >> $script
 	echo 'export SDK_PATH_NATIVE=3D$SDK_PATH/sysroots/$SDK_SYS' >> $script
 	echo 'export SDK_PATH_TARGET=3D$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGE=
T_SYS' >> $script
 	echo 'export PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIV=
E${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >=
> $script
@@ -43,18 +43,18 @@ toolchain_create_sdk_env_script () {
 	echo 'export PKG_CONFIG_PATH=3D$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK=
_PATH_TARGET${datadir}/pkgconfig' >> $script
 	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1' >> $script
 	echo 'export CONFIG_SITE=3D$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET=
_SYS' >> $script
-	printf 'export CC=3D"\x24{TOOLCHAIN_PREFIX}gcc --sysroot=3D$SDK_PATH_TA=
RGET"\n' >> $script
-	printf 'export CXX=3D"\x24{TOOLCHAIN_PREFIX}g++ --sysroot=3D$SDK_PATH_T=
ARGET"\n' >> $script
-	printf 'export GDB=3D\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
-	printf 'export CPP=3D"\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=3D$SDK_PAT=
H_TARGET"\n' >> $script
-	printf 'export LD=3D"\x24{TOOLCHAIN_PREFIX}ld --sysroot=3D$SDK_PATH_TAR=
GET"\n' >> $script
-	printf 'export NM=3D\x24{TOOLCHAIN_PREFIX}nm\n' >> $script
-	printf 'export AS=3D\x24{TOOLCHAIN_PREFIX}as\n' >> $script
-	printf 'export AR=3D\x24{TOOLCHAIN_PREFIX}ar\n' >> $script
-	printf 'export RANLIB=3D\x24{TOOLCHAIN_PREFIX}ranlib\n' >> $script
-	printf 'export OBJCOPY=3D\x24{TOOLCHAIN_PREFIX}objcopy\n' >> $script
-	printf 'export OBJDUMP=3D\x24{TOOLCHAIN_PREFIX}objdump\n' >> $script
-	printf 'export STRIP=3D\x24{TOOLCHAIN_PREFIX}strip\n' >> $script
+	printf 'export CC=3D"\x24{TARGET_PREFIX}gcc --sysroot=3D$SDK_PATH_TARGE=
T"\n' >> $script
+	printf 'export CXX=3D"\x24{TARGET_PREFIX}g++ --sysroot=3D$SDK_PATH_TARG=
ET"\n' >> $script
+	printf 'export GDB=3D\x24{TARGET_PREFIX}gdb\n' >> $script
+	printf 'export CPP=3D"\x24{TARGET_PREFIX}gcc -E --sysroot=3D$SDK_PATH_T=
ARGET"\n' >> $script
+	printf 'export LD=3D"\x24{TARGET_PREFIX}ld --sysroot=3D$SDK_PATH_TARGET=
"\n' >> $script
+	printf 'export NM=3D\x24{TARGET_PREFIX}nm\n' >> $script
+	printf 'export AS=3D\x24{TARGET_PREFIX}as\n' >> $script
+	printf 'export AR=3D\x24{TARGET_PREFIX}ar\n' >> $script
+	printf 'export RANLIB=3D\x24{TARGET_PREFIX}ranlib\n' >> $script
+	printf 'export OBJCOPY=3D\x24{TARGET_PREFIX}objcopy\n' >> $script
+	printf 'export OBJDUMP=3D\x24{TARGET_PREFIX}objdump\n' >> $script
+	printf 'export STRIP=3D\x24{TARGET_PREFIX}strip\n' >> $script
 	echo 'export CONFIGURE_FLAGS=3D"--target=3D${TARGET_SYS} --host=3D${TAR=
GET_SYS} --build=3D${SDK_ARCH}-linux --with-libtool-sysroot=3D$SDK_PATH_T=
ARGET"' >> $script
 	echo 'export CPPFLAGS=3D"${TARGET_CC_ARCH} --sysroot=3D$SDK_PATH_TARGET=
"' >> $script
 	echo 'export CFLAGS=3D"$CPPFLAGS"' >> $script
@@ -97,32 +97,6 @@ arago_sdk_fixup () {
 	done
=20
 	cleanup_toolchain_packages
-
-	# Do some extra setup work due to new structure
-	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGE=
T_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	if [ "${TOOLCHAIN_TYPE}" =3D "internal" ]; then
-		lexec=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${T=
ARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
-	else
-		lexec=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc=
/${TOOLCHAIN_SYS}"
-	fi
-	tcv=3D`ls -1 $lexec|head -1`
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTP=
UT}/${SDKTARGETSYSROOT}/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_=
OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s =
. ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln=
 -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
-	tcpath=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN=
_SYS}"
-	mkdir -p $tcpath
-	( cd $tcpath; \
-		ln -s ${SDKTARGETSYSROOT}/include include; \
-		if [ "${TOOLCHAIN_BRAND}" !=3D "arago" ]; then \
-			mkdir -p libc; \
-			cd libc; \
-		fi; \
-		mkdir -p usr; \
-		ln -s ${SDKTARGETSYSROOT}/lib lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/include usr/include; \
-	)
 }
=20
 fakeroot create_sdk_files() {
--=20
2.25.1


