Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A54C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:03:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2072.1684785808777103923
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 13:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=nb1uD4DC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MK3ONE049337;
	Mon, 22 May 2023 15:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684785804;
	bh=L3MuXd+hxAwhOIAWPjiRzypC39SCM2X8ydwVQ/tqS6M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nb1uD4DC3kZFqFtJXB6pdSDMow0TBr20yemJfU5hoCwrP+mLaCdlpoz9ujCqngNah
	 04dpTqduWHr8PDoUboHAr8RjlCI8eLoURuKt7Cz1f55jfnfuQ7p/IWQGoVPSnAibId
	 ZzrSyrW7+ggA55KWrcUc7J4EWo0Id4S4A03UCjKU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MK3OWh089324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:03:24 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:03:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:03:24 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MK3OC1049443;
	Mon, 22 May 2023 15:03:24 -0500
Message-ID: <ca72de57-1cfb-c86b-323d-de77cdcbd9dd@ti.com>
Date: Mon, 22 May 2023 15:03:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH 2/3] all: remove all external
 toolchain logic
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-3-rs@ti.com>
 <4aa26b33-f76b-b10e-3182-ab2902f95d4f@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <4aa26b33-f76b-b10e-3182-ab2902f95d4f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 34MK3ONE049337
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 20:03:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14438

On 5/22/23 14:34, Andrew Davis wrote:
> On 5/22/23 1:38 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Remove all legacy external toolchain logic, packages, groups, etc. All
>> of this was required for the Arago SDK build target and is not necessa=
ry
>> moving forward. This build target can and should be replaced by the
>> Yocto Standard SDK build target:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0bitbake tisdk-default-image -c populate_sdk
>=20
> How is this patch logically different from the one before, should they
> be squashed?
>=20
> Or are you saying these are the parts that are still needed for Arago/T=
I=20
> SDK?
> If so would it make more sence to have patch 3/3 first? I'm guessing th=
ere
> are some circular dependancies given we build the SDK with the toolchai=
n=20
> then
> we package the toolchain in the SDK.. Maybe squash all three?
>=20
> Andrew
>=20

Ha, to be entirely frank, I went on an rm spree prior to assessing=20
recipe needs. This and the previous patch should probably come after=20
patch 3 to prevent bisect issues.

>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 meta-arago-distro/conf/distro/arago.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 13 -
>> =C2=A0 .../distro/include/branding-processor-sdk.inc |=C2=A0=C2=A0 2 -
>> =C2=A0 .../distro/include/toolchain-external.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 4 -
>> =C2=A0 .../conf/distro/include/toolchain-gcc.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 41 --
>> =C2=A0 .../distro/include/toolchain-internal.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 4 -
>> =C2=A0 .../meta/meta-toolchain-arago-tisdk-server.bb |=C2=A0=C2=A0 7 -
>> =C2=A0 .../meta/meta-toolchain-arago-tisdk.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 -
>> =C2=A0 .../meta/meta-toolchain-arago-tisdk.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 8 -
>> =C2=A0 .../meta/meta-toolchain-arago-qte.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 54 ---
>> =C2=A0 .../recipes-core/meta/meta-toolchain-arago.bb | 360 -----------=
-------
>> =C2=A0 .../nativesdk-buildtools-perl-dummy.bbappend=C2=A0 |=C2=A0 23 -=
-
>> =C2=A0 ...k-packagegroup-arago-qte-toolchain-host.bb |=C2=A0 11 -
>> =C2=A0 12 files changed, 533 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/conf/distro/include/toolchain-external.inc
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/conf/distro/include/toolchain-internal.inc
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.=
bb
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
>> =C2=A0 delete mode 100644=20
>> meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb=
append
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-ar=
ago-qte-toolchain-host.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf=20
>> b/meta-arago-distro/conf/distro/arago.conf
>> index 379b1d44..ed04602e 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -137,16 +137,6 @@ ARAGO_SYSTEST_ENABLE ?=3D "0"
>> =C2=A0 ARAGO_KERNEL_SUFFIX:append =3D=20
>> "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "",=20
>> d)}"
>> =C2=A0 IMAGE_FSTYPES:remove =3D "${@['','ubi=20
>> ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') =3D=3D '1']}"
>> -# Toolchain should be selected by setting TOOLCHAIN_BRAND in local.co=
nf
>> -# Set some sane defaults, in case someone forgets to set them in=20
>> local.conf
>> -TC_SANE_DEFAULT ?=3D "arm"
>> -TOOLCHAIN_TYPE ?=3D "internal"
>> -TOOLCHAIN_TYPE:omapl138 =3D "internal"
>> -TOOLCHAIN_BRAND ?=3D=20
>> "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') =3D=
=3D=20
>> 'internal']}"
>> -
>> -require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
>> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
>> -
>> =C2=A0 # Enable basic stack and buffer overflow protections
>> =C2=A0 #TARGET_CPPFLAGS +=3D "-fstack-protector -D_FORTIFY_SOURCE=3D1"
>> =C2=A0 #TARGET_CPPFLAGS +=3D "-fstack-protector"
>> @@ -179,6 +169,3 @@ ENTERPRISE_DISTRO =3D "1"
>> =C2=A0 # Arago based SDK. No need to prevent gst-ffmpeg from being use=
d=20
>> since we
>> =C2=A0 # disable troublesome software.
>> =C2=A0 LICENSE_FLAGS_ACCEPTED =3D "commercial_gst-ffmpeg=20
>> commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
>> -
>> -# Do not package own copy of perl into devkit, rely on host one
>> -ASSUME_PROVIDED +=3D "nativesdk-perl"
>> diff --git=20
>> a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc=20
>> b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>> index 25bb1b8c..f581dd93 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>> @@ -1,5 +1,3 @@
>> -ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
>> -
>> =C2=A0 # Set CMEM reserved memory region
>> =C2=A0 RESERVE_CMEM =3D=20
>> "${@bb.utils.contains('MACHINE_FEATURES','dsp','1','0',d)}"
>> =C2=A0 CMEM_BASE:omap-a15 ?=3D "a0000000"
>> diff --git=20
>> a/meta-arago-distro/conf/distro/include/toolchain-external.inc=20
>> b/meta-arago-distro/conf/distro/include/toolchain-external.inc
>> deleted file mode 100644
>> index c48b09d4..00000000
>> --- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -# Set some default toolchain location variables
>> -TOOLCHAIN_PATH ??=3D "/usr/local/sdk"
>> -TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/${TOOLCHAIN_SYS}"
>> -EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
>> diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc=20
>> b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> deleted file mode 100644
>> index 78957364..00000000
>> --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -# Select internal gcc toolchain to be built from sources
>> -TCMODE =3D "default"
>> -TCLIBC =3D "glibc"
>> -
>> -LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=
=3D=20
>> '']}"
>> -
>> -# Match some of the external vars
>> -TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
>> -TOOLCHAIN_PREFIX :=3D "${TARGET_PREFIX}"
>> -
>> -PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=20
>> "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>> -PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}=20
>> ?=3D "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>> -PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D=20
>> "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>> -
>> -# Set Cross and SDK toolchain preferences
>> -SDKGCCVERSION ?=3D "12%"
>> -SDKBINUVERSION ?=3D "2.40%"
>> -SDKGLIBCVERSION ?=3D "2.37%"
>> -
>> -PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?=3D "${SDKGCCVERSI=
ON}"
>> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${SDKBINUVERSION=
}"
>> -
>> -PREFERRED_VERSION_nativesdk-gcc-runtime ?=3D "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_nativesdk-glibc ?=3D "${SDKGLIBCVERSION}"
>> -PREFERRED_VERSION_nativesdk-glibc-locale ?=3D "${SDKGLIBCVERSION}"
>> -PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGLIBCVERSION}"
>> -
>> -# Set target toolchain preferences to match Cross/SDK by default
>> -# Can be overwritten globally, if needed
>> -GCCVERSION ?=3D "12%"
>> -BINUVERSION ?=3D "2.40%"
>> -GLIBCVERSION ?=3D "2.37%"
>> -
>> -PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>> -PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
>> -PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
>> -PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
>> -PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
>> diff --git=20
>> a/meta-arago-distro/conf/distro/include/toolchain-internal.inc=20
>> b/meta-arago-distro/conf/distro/include/toolchain-internal.inc
>> deleted file mode 100644
>> index cbc3b53d..00000000
>> --- a/meta-arago-distro/conf/distro/include/toolchain-internal.inc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -# No special handling is required for locating the internal=20
>> toolchain, just re-use existing vars
>> -TOOLCHAIN_PATH ?=3D "${STAGING_BINDIR_TOOLCHAIN}"
>> -TOOLCHAIN_SYSPATH ?=3D "${TOOLCHAIN_PATH}/${TARGET_SYS}"
>> -EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-serve=
r.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-ser=
ver.bb
>> deleted file mode 100644
>> index 3e781d06..00000000
>> ---=20
>> a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-serve=
r.bb
>> +++ /dev/null
>> @@ -1,7 +0,0 @@
>> -TOOLCHAIN_HOST_TASK ?=3D "nativesdk-packagegroup-arago-tisdk-host"
>> -TOOLCHAIN_SUFFIX ?=3D "-tisdk-server"
>> -
>> -require meta-toolchain-arago-tisdk.inc
>> -require recipes-core/meta/meta-toolchain-arago.bb
>> -
>> -PR =3D "${INC_PR}.0"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb=20
>> b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
>> deleted file mode 100644
>> index 4f272a52..00000000
>> --- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.b=
b
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -TOOLCHAIN_SUFFIX ?=3D "-tisdk"
>> -
>> -require meta-toolchain-arago-tisdk.inc
>> -require recipes-core/meta/meta-toolchain-arago-qte.bb
>> -
>> -PR =3D "${INC_PR}.0"
>> diff --git=20
>> a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc=20
>> b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
>> deleted file mode 100644
>> index e8d389c5..00000000
>> --- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.i=
nc
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -TOOLCHAIN_TARGET_TASK ?=3D "packagegroup-arago-toolchain-tisdk-target=
"
>> -TOOLCHAIN_CLEANUP_PACKAGES ?=3D "libgnutls-dev libgnutls-extra26=20
>> libgnutls-openssl27 libtasn1-dev coreutils"
>> -
>> -INC_PR =3D "r5"
>> -
>> -toolchain_create_sdk_env_script:append() {
>> -=C2=A0=C2=A0=C2=A0 echo -e 'export PS1=3D"\[\\e[32;1m\][linux-devkit]=
\[\\e[0m\]:\w> "'=20
>> >> $script
>> -}
>> diff --git=20
>> a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb=20
>> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
>> deleted file mode 100644
>> index 41dff492..00000000
>> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -# Qt Embedded toolchain
>> -TOOLCHAIN_HOST_TASK ?=3D "nativesdk-packagegroup-arago-qte-toolchain-=
host"
>> -TOOLCHAIN_TARGET_TASK ?=3D "packagegroup-arago-qte-toolchain-target"
>> -TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
>> -
>> -require meta-toolchain-arago.bb
>> -
>> -PR =3D "r20"
>> -
>> -QT_MKSPECS_LOCATION =3D "${libdir}"
>> -QT_MKSPECS_DIR =3D "linux-oe-g++"
>> -
>> -toolchain_create_sdk_env_script:append() {
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $s=
cript
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $scri=
pt
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $=
script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $sc=
ript
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_CC=3D"$CC"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_CXX=3D"$CXX"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_LINK=3D"$CXX"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_AR=3D"$AR"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_PREFIX_QT=3D${prefix}' >> $s=
cript
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_LIBDIR_QT=3D${libdir}' >> $s=
cript
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_INCDIR_QT=3D${includedir}/${=
QT_DIR_NAME}' >>=20
>> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_HOST_BINDIR_QT=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN=
_PREFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_MOC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc=
${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_UIC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic=
${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_UIC3=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}ui=
c3${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_RCC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}rcc=
${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_QDBUSCPP2XML=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_P=
REFIX}qdbuscpp2xml${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_QDBUSXML2CPP=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_P=
REFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> OE_QMAKE_QT_CONFIG=3D$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_N=
AME}/mkspecs/qconfig.pri' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OE_QMAKE_STRIP=3D"echo"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> QMAKESPEC=3D$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mksp=
ecs/${QT_MKSPECS_DIR}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export QMAKE_DEFAULT_LIBDIRS=3D${QT_QMAKE_LI=
BDIR_QT}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export QMAKE_DEFAULT_INCDIRS=3D${QT_QMAKE_IN=
CDIR_QT}' >> $script
>> -
>> -=C2=A0=C2=A0=C2=A0 #Adds qt.conf file that points qmake to properly l=
ocate Qt=20
>> library and header files.
>> -=C2=A0=C2=A0=C2=A0 #This enables Qt Creator to work properly
>> -
>> -   =20
>> qt_conf=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_=
PREFIX}qt.conf"
>> -=C2=A0=C2=A0=C2=A0 touch $qt_conf
>> -=C2=A0=C2=A0=C2=A0 echo '[Paths]' >> $qt_conf
>> -=C2=A0=C2=A0=C2=A0 echo 'Prefix =3D $(OE_QMAKE_PREFIX_QT)' >> $qt_con=
f
>> -=C2=A0=C2=A0=C2=A0 echo 'Libraries =3D $(OE_QMAKE_LIBDIR_QT)' >> $qt_=
conf
>> -=C2=A0=C2=A0=C2=A0 echo 'Headers =3D $(OE_QMAKE_INCDIR_QT)' >> $qt_co=
nf
>> -=C2=A0=C2=A0=C2=A0 echo 'HostPrefix =3D $(SDK_PATH_NATIVE)' >> $qt_co=
nf
>> -=C2=A0=C2=A0=C2=A0 echo 'HostBinaries =3D $(OE_QMAKE_HOST_BINDIR_QT)'=
 >> $qt_conf
>> -=C2=A0=C2=A0=C2=A0 echo 'Sysroot =3D $(SDK_PATH_TARGET)' >> $qt_conf
>> -
>> -=C2=A0=C2=A0=C2=A0 # make a symbolic link to mkspecs for compatibilit=
y with Qt SDK=20
>> and QTCreator
>> -=C2=A0=C2=A0=C2=A0 (cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf=20
>> .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
>> -=C2=A0=C2=A0=C2=A0 (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; ln -sf=20
>> ../${REAL_MULTIMACH_TARGET_SYS}${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/m=
kspecs mkspecs;)
>> -}
>> diff --git=20
>> a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb=20
>> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
>> deleted file mode 100644
>> index 5c1c3ad0..00000000
>> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
>> +++ /dev/null
>> @@ -1,360 +0,0 @@
>> -TOOLCHAIN_HOST_TASK ?=3D "nativesdk-packagegroup-sdk-host"
>> -TOOLCHAIN_HOST_TASK:append =3D " nativesdk-buildtools-perl-dummy"
>> -TOOLCHAIN_HOST_TASK:append =3D " packagegroup-cross-canadian-${MACHIN=
E}"
>> -TOOLCHAIN_TARGET_TASK ?=3D "packagegroup-arago-standalone-sdk-target"
>> -TOOLCHAIN_SUFFIX ?=3D "-sdk"
>> -TOOLCHAIN_OUTPUTNAME ?=3D=20
>> "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
>> -TOOLCHAIN_CLEANUP_PACKAGES ?=3D ""
>> -SDKIMAGE_FEATURES =3D "package-management"
>> -SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
>> -
>> -inherit toolchain-scripts
>> -
>> -require recipes-core/meta/meta-toolchain.bb
>> -
>> -PR =3D "r35"
>> -
>> -# This function creates an environment-setup-script for use in a=20
>> deployable SDK
>> -toolchain_create_sdk_env_script () {
>> -=C2=A0=C2=A0=C2=A0 # Create environment setup script
>> -=C2=A0=C2=A0=C2=A0 script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setu=
p
>> -=C2=A0=C2=A0=C2=A0 rm -f $script
>> -=C2=A0=C2=A0=C2=A0 touch $script
>> -=C2=A0=C2=A0=C2=A0 echo 'SDK_PATH=3D"${SDKPATH}"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" =3D "x./env=
ironment-setup"=20
>> ]; then' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 echo "Error: This script =
needs to be sourced. Please=20
>> run as \". ./environment-setup\""' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 exit 1' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'else' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 if [ -n "$BASH_SOURCE" ];=
 then' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 S=
DK_PATH=3D"`dirname $BASH_SOURCE`"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 fi' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 SDK_PATH=3D`readlink -f "=
$SDK_PATH"`' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo '=C2=A0=C2=A0=C2=A0 export SDK_PATH' >> $scri=
pt
>> -=C2=A0=C2=A0=C2=A0 echo 'fi' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export SDK_SYS=3D${SDK_SYS}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> REAL_MULTIMACH_TARGET_SYS=3D${REAL_MULTIMACH_TARGET_SYS}' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export TOOLCHAIN_SYS=3D${TOOLCHAIN_SYS}' >> =
$script
>> -=C2=A0=C2=A0=C2=A0 echo 'export TOOLCHAIN_PREFIX=3D$TOOLCHAIN_SYS-' >=
> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export SDK_PATH_NATIVE=3D$SDK_PATH/sysroots/=
$SDK_SYS' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> SDK_PATH_TARGET=3D$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $s=
cript
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_na=
tivesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export CPATH=3D$SDK_PATH_TARGET/usr/include:=
$CPATH' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH_TA=
RGET' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> PKG_CONFIG_PATH=3D$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK_PATH_TARGET=
${datadir}/pkgconfig' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1' >> =
$script
>> -=C2=A0=C2=A0=C2=A0 echo 'export=20
>> CONFIG_SITE=3D$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $sc=
ript
>> -=C2=A0=C2=A0=C2=A0 printf 'export CC=3D"\x24{TOOLCHAIN_PREFIX}gcc=20
>> --sysroot=3D$SDK_PATH_TARGET"\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export CXX=3D"\x24{TOOLCHAIN_PREFIX}g++=20
>> --sysroot=3D$SDK_PATH_TARGET"\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export GDB=3D\x24{TOOLCHAIN_PREFIX}gdb\n' =
>> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export CPP=3D"\x24{TOOLCHAIN_PREFIX}gcc -E=
=20
>> --sysroot=3D$SDK_PATH_TARGET"\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export LD=3D"\x24{TOOLCHAIN_PREFIX}ld=20
>> --sysroot=3D$SDK_PATH_TARGET"\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export NM=3D\x24{TOOLCHAIN_PREFIX}nm\n' >>=
 $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export AS=3D\x24{TOOLCHAIN_PREFIX}as\n' >>=
 $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export AR=3D\x24{TOOLCHAIN_PREFIX}ar\n' >>=
 $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export RANLIB=3D\x24{TOOLCHAIN_PREFIX}ranl=
ib\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export OBJCOPY=3D\x24{TOOLCHAIN_PREFIX}obj=
copy\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export OBJDUMP=3D\x24{TOOLCHAIN_PREFIX}obj=
dump\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 printf 'export STRIP=3D\x24{TOOLCHAIN_PREFIX}strip=
\n' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export CONFIGURE_FLAGS=3D"--target=3D${TARGE=
T_SYS}=20
>> --host=3D${TARGET_SYS} --build=3D${SDK_ARCH}-linux=20
>> --with-libtool-sysroot=3D$SDK_PATH_TARGET"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export CPPFLAGS=3D"${TARGET_CC_ARCH}=20
>> --sysroot=3D$SDK_PATH_TARGET"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export CFLAGS=3D"$CPPFLAGS"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export CXXFLAGS=3D"$CPPFLAGS"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export LDFLAGS=3D"${TARGET_LD_ARCH}=20
>> --sysroot=3D$SDK_PATH_TARGET"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_NATIVE_SYSROOT=3D$SDK_PATH_NAT=
IVE' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_TARGET_SYSROOT=3D$SDK_PATH_TAR=
GET' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export SDKTARGETSYSROOT=3D$SDK_PATH_TARGET' =
>> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_ACLOCAL_OPTS=3D"-I=20
>> $SDK_PATH_NATIVE/usr/share/aclocal"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VER=
SION}"' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"=
' >> $script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_BASELIB=3D"${baselib}"' >> $sc=
ript
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"=
' >>$script
>> -=C2=A0=C2=A0=C2=A0 echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>=
$script
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Borrowed from oe-core/me=
ta/classes/toolchain-scripts.bbclass
>> -=C2=A0=C2=A0=C2=A0 cat >> $script <<EOF
>> -
>> -# Append environment subscripts
>> -if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
>> -=C2=A0=C2=A0=C2=A0 for envfile in \$OECORE_TARGET_SYSROOT/environment=
-setup.d/*.sh; do
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . \$envfile
>> -=C2=A0=C2=A0=C2=A0 done
>> -fi
>> -if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
>> -=C2=A0=C2=A0=C2=A0 for envfile in \$OECORE_NATIVE_SYSROOT/environment=
-setup.d/*.sh; do
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . \$envfile
>> -=C2=A0=C2=A0=C2=A0 done
>> -fi
>> -EOF
>> -
>> -}
>> -
>> -SDK_POSTPROCESS_COMMAND:prepend =3D "arago_sdk_fixup; "
>> -
>> -arago_sdk_fixup () {
>> -=C2=A0=C2=A0=C2=A0 # Remove broken .la files
>> -=C2=A0=C2=A0=C2=A0 for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.l=
a`; do
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f $i
>> -=C2=A0=C2=A0=C2=A0 done
>> -
>> -=C2=A0=C2=A0=C2=A0 cleanup_toolchain_packages
>> -
>> -=C2=A0=C2=A0=C2=A0 # Do some extra setup work due to new structure
>> -=C2=A0=C2=A0=C2=A0 mkdir -p=20
>> "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}$=
{TARGET_VENDOR}-${TARGET_OS}"
>> -=C2=A0=C2=A0=C2=A0 if [ "${TOOLCHAIN_TYPE}" =3D "internal" ]; then
>> -       =20
>> lexec=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${T=
ARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
>> -=C2=A0=C2=A0=C2=A0 else
>> -       =20
>> lexec=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc=
/${TOOLCHAIN_SYS}"
>> -=C2=A0=C2=A0=C2=A0 fi
>> -=C2=A0=C2=A0=C2=A0 tcv=3D`ls -1 $lexec|head -1`
>> -=C2=A0=C2=A0=C2=A0 [ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] =
|| ln -s .=20
>> ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
>> -=C2=A0=C2=A0=C2=A0 [ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tc=
v ] || ln -s .=20
>> ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
>> -=C2=A0=C2=A0=C2=A0 [ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLC=
HAIN_SYS} ] ||=20
>> ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
>> -=C2=A0=C2=A0=C2=A0 [ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${T=
OOLCHAIN_SYS} ]=20
>> || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
>> -   =20
>> tcpath=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAI=
N_SYS}"
>> -=C2=A0=C2=A0=C2=A0 mkdir -p $tcpath
>> -=C2=A0=C2=A0=C2=A0 ( cd $tcpath; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ${SDKTARGETSYSROOT}/=
include include; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${TOOLCHAIN_BRAND}" =
!=3D "arago" ]; then \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mk=
dir -p libc; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd=
 libc; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p usr; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ${SDKTARGETSYSROOT}/=
lib lib; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ${SDKTARGETSYSROOT}/=
usr/lib usr/lib; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ${SDKTARGETSYSROOT}/=
usr/include usr/include; \
>> -=C2=A0=C2=A0=C2=A0 )
>> -}
>> -
>> -fakeroot create_sdk_files() {
>> -=C2=A0=C2=A0=C2=A0 toolchain_create_sdk_env_script=20
>> ${SDK_OUTPUT}/${SDKPATH}/environment-setup
>> -
>> -=C2=A0=C2=A0=C2=A0 cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPU=
T}/${SDKPATH}/
>> -
>> -=C2=A0=C2=A0=C2=A0 # Replace the ##DEFAULT_INSTALL_DIR## with the cor=
rect pattern.
>> -=C2=A0=C2=A0=C2=A0 # Escape special characters like '+' and '.' in th=
e SDKPATH
>> -=C2=A0=C2=A0=C2=A0 escaped_sdkpath=3D$(echo ${SDKPATH} |sed -e "s:[\+=
\.]:\\\\\\\\\0:g")
>> -=C2=A0=C2=A0=C2=A0 sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkp=
ath:"=20
>> ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
>> -}
>> -
>> -# Remove undesired packages that may be pulled into the toolchain by=20
>> -dev
>> -# package dependencies.=C2=A0 This is usually GPLv3 components.
>> -cleanup_toolchain_packages() {
>> -=C2=A0=C2=A0=C2=A0 if [ "${TOOLCHAIN_CLEANUP_PACKAGES}" !=3D "" ]
>> -=C2=A0=C2=A0=C2=A0 then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Clean up the native side=
 of the toolchain
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_dir=3D"${SDK_OUTPUT}/=
${SDKPATHNATIVE}"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_conf=3D"${SDK_OUTPUT}=
/etc/opkg-sdk.conf"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg -o $opkg_dir -f $opkg=
_conf --force-depends remove=20
>> ${TOOLCHAIN_CLEANUP_PACKAGES}
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Clean up the target side=
 of the toolchain
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_dir=3D"${SDK_OUTPUT}/=
${SDKTARGETSYSROOT}"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_conf=3D"${opkg_dir}/e=
tc/opkg/opkg.conf"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg -o $opkg_dir -f $opkg=
_conf --force-depends remove=20
>> ${TOOLCHAIN_CLEANUP_PACKAGES}
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Clean up empty directori=
es from cleaned up packages
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find ${SDK_OUTPUT} -depth =
-type d -empty -print0 | xargs -r0=20
>> /bin/rmdir
>> -=C2=A0=C2=A0=C2=A0 fi
>> -}
>> -
>> -fakeroot archive_sdk() {
>> -=C2=A0=C2=A0=C2=A0 # Package it up
>> -=C2=A0=C2=A0=C2=A0 mkdir -p ${SDKDEPLOYDIR}
>> -=C2=A0=C2=A0=C2=A0 cd ${SDK_OUTPUT}/${SDKPATH}
>> -=C2=A0=C2=A0=C2=A0 tar --owner=3Droot --group=3Droot -c . | xz ${SDK_=
XZ_OPTIONS} >=20
>> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
>> -}
>> -
>> -fakeroot create_shar() {
>> -=C2=A0=C2=A0=C2=A0 cat << "EOF" > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTN=
AME}.sh
>> -#!/bin/bash
>> -
>> -INST_ARCH=3D$(uname -m | sed -e "s/i[3-6]86/ix86/" -e=20
>> "s/x86[-_]64/x86_64/")
>> -SDK_ARCH=3D$(echo ${SDK_ARCH} | sed -e "s/i[3-6]86/ix86/" -e=20
>> "s/x86[-_]64/x86_64/")
>> -
>> -if [ "$INST_ARCH" !=3D "$SDK_ARCH" ]; then
>> -=C2=A0=C2=A0=C2=A0 # Allow for installation of ix86 SDK on x86_64 hos=
t
>> -=C2=A0=C2=A0=C2=A0 if [ "$INST_ARCH" !=3D x86_64 -o "$SDK_ARCH" !=3D =
ix86 ]; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Error: Installation =
machine not supported!"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>> -=C2=A0=C2=A0=C2=A0 fi
>> -fi
>> -
>> -DEFAULT_INSTALL_DIR=3D"${SDKPATHINSTALL}"
>> -TMPSDKPATH=3D"${SDKPATH}"
>> -SUDO_EXEC=3D""
>> -target_sdk_dir=3D""
>> -answer=3D""
>> -relocate=3D1
>> -savescripts=3D0
>> -verbose=3D0
>> -while getopts ":yd:DRS" OPT; do
>> -=C2=A0=C2=A0=C2=A0 case $OPT in
>> -=C2=A0=C2=A0=C2=A0 y)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 answer=3D"Y"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ "$target_sdk_dir" =3D ""=
 ] &&=20
>> target_sdk_dir=3D$DEFAULT_INSTALL_DIR
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 d)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_sdk_dir=3D$OPTARG
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 D)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 verbose=3D1
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 R)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 relocate=3D0
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 savescripts=3D1
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 S)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 savescripts=3D1
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 *)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Usage: $(basename $0=
) [-y] [-d <dir>]"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=C2=A0 -y=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Automatic yes to all prompts"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=C2=A0 -d <dir>=C2=A0=
=C2=A0 Install the SDK to <dir>"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=3D=3D=3D=3D=3D=3D=3D=
=3D Advanced DEBUGGING ONLY OPTIONS =3D=3D=3D=3D=3D=3D=3D=3D"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=C2=A0 -S=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Save relocation scripts"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=C2=A0 -R=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do not relocate executables"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "=C2=A0 -D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use set -x to see what is going on"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> -=C2=A0=C2=A0=C2=A0 esac
>> -done
>> -
>> -if [ $verbose =3D 1 ] ; then
>> -=C2=A0=C2=A0=C2=A0 set -x
>> -fi
>> -
>> -printf "Enter target directory for SDK (default:=20
>> $DEFAULT_INSTALL_DIR): "
>> -if [ "$target_sdk_dir" =3D "" ]; then
>> -=C2=A0=C2=A0=C2=A0 read target_sdk_dir
>> -=C2=A0=C2=A0=C2=A0 [ "$target_sdk_dir" =3D "" ] && target_sdk_dir=3D$=
DEFAULT_INSTALL_DIR
>> -else
>> -=C2=A0=C2=A0=C2=A0 echo "$target_sdk_dir"
>> -fi
>> -
>> -eval target_sdk_dir=3D$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
>> -if [ -d "$target_sdk_dir" ]; then
>> -=C2=A0=C2=A0=C2=A0 target_sdk_dir=3D$(cd "$target_sdk_dir"; pwd)
>> -else
>> -=C2=A0=C2=A0=C2=A0 target_sdk_dir=3D$(readlink -m "$target_sdk_dir")
>> -fi
>> -
>> -if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
>> -=C2=A0=C2=A0=C2=A0 echo "The target directory path ($target_sdk_dir) =
contains=20
>> spaces. Abort!"
>> -=C2=A0=C2=A0=C2=A0 exit 1
>> -fi
>> -
>> -if [ -e "$target_sdk_dir/environment-setup*" ]; then
>> -=C2=A0=C2=A0=C2=A0 echo "The directory \"$target_sdk_dir\" already co=
ntains a SDK=20
>> for this architecture."
>> -=C2=A0=C2=A0=C2=A0 printf "If you continue, existing files will be ov=
erwritten!=20
>> Proceed[y/N]?"
>> -
>> -=C2=A0=C2=A0=C2=A0 default_answer=3D"n"
>> -else
>> -=C2=A0=C2=A0=C2=A0 printf "You are about to install the SDK to \"$tar=
get_sdk_dir\".=20
>> Proceed[Y/n]?"
>> -
>> -=C2=A0=C2=A0=C2=A0 default_answer=3D"y"
>> -fi
>> -
>> -if [ "$answer" =3D "" ]; then
>> -=C2=A0=C2=A0=C2=A0 read answer
>> -=C2=A0=C2=A0=C2=A0 [ "$answer" =3D "" ] && answer=3D"$default_answer"
>> -else
>> -=C2=A0=C2=A0=C2=A0 echo $answer
>> -fi
>> -
>> -if [ "$answer" !=3D "Y" -a "$answer" !=3D "y" ]; then
>> -=C2=A0=C2=A0=C2=A0 echo "Installation aborted!"
>> -=C2=A0=C2=A0=C2=A0 exit 1
>> -fi
>> -
>> -# Try to create the directory (this will not succeed if user doesn't=20
>> have rights)
>> -mkdir -p $target_sdk_dir >/dev/null 2>&1
>> -
>> -# if don't have the right to access dir, gain by sudo
>> -if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r=20
>> $target_sdk_dir ]; then
>> -=C2=A0=C2=A0=C2=A0 SUDO_EXEC=3D$(which "sudo")
>> -=C2=A0=C2=A0=C2=A0 if [ -z $SUDO_EXEC ]; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "No command 'sudo' fo=
und, please install sudo first.=20
>> Abort!"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>> -=C2=A0=C2=A0=C2=A0 fi
>> -
>> -=C2=A0=C2=A0=C2=A0 # test sudo could gain root right
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC pwd >/dev/null 2>&1
>> -=C2=A0=C2=A0=C2=A0 [ $? -ne 0 ] && echo "Sorry, you are not allowed t=
o execute as=20
>> root." && exit 1
>> -
>> -=C2=A0=C2=A0=C2=A0 # now that we have sudo rights, create the directo=
ry
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&=
1
>> -fi
>> -
>> -payload_offset=3D$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1)=
)
>> -
>> -printf "Extracting SDK..."
>> -tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir
>> -echo "done"
>> -
>> -printf "Setting it up..."
>> -# fix environment paths
>> -for env_setup_script in `ls $target_sdk_dir/environment-setup*`; do
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g=
" -i=20
>> $env_setup_script
>> -done
>> -
>> -# fix dynamic loader paths in all ELF SDK binaries
>> -native_sysroot=3D$target_sdk_dir/sysroots/${SDK_SYS}
>> -dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
>> -if [ "$dl_path" =3D "" ] ; then
>> -=C2=A0=C2=A0=C2=A0 echo "SDK could not be set up. Relocate script una=
ble to find=20
>> ld-linux.so. Abort!"
>> -=C2=A0=C2=A0=C2=A0 exit 1
>> -fi
>> -executable_files=3D$($SUDO_EXEC find $native_sysroot -type f -perm /1=
11=20
>> -exec file '{}' \;| grep "\(executable\|dynamically linked\|static-pie=
=20
>> linked\)" | cut -f 1 -d ':')
>> -
>> -tdir=3D`mktemp -d`
>> -if [ x$tdir =3D x ] ; then
>> -=C2=A0=C2=A0=C2=A0 echo "SDK relocate failed, could not create a temp=
orary directory"
>> -=C2=A0=C2=A0=C2=A0 exit 1
>> -fi
>> -echo "#!/bin/bash" > $tdir/relocate_sdk.sh
>> -echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir=20
>> $dl_path $executable_files >> $tdir/relocate_sdk.sh
>> -$SUDO_EXEC mv $tdir/relocate_sdk.sh=20
>> ${env_setup_script%/*}/relocate_sdk.sh
>> -$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
>> -rm -rf $tdir
>> -if [ $relocate =3D 1 ] ; then
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
>> -=C2=A0=C2=A0=C2=A0 if [ $? -ne 0 ]; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "SDK could not be set=
 up. Relocate script failed. Abort!"
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>> -=C2=A0=C2=A0=C2=A0 fi
>> -fi
>> -
>> -# replace ${SDKPATH} with the new prefix in all text files:=20
>> configs/scripts/etc
>> -$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep=20
>> ":.*\(ASCII\|script\|source\).*text"|awk -F":" '{print=20
>> "\""$1"\""}'|$SUDO_EXEC xargs sed -i -e "s:$TMPSDKPATH:$target_sdk_dir=
:g"
>> -
>> -# change all symlinks pointing to ${SDKPATH}
>> -for l in $($SUDO_EXEC find $native_sysroot -type l); do
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e=
=20
>> "s:$TMPSDKPATH:$target_sdk_dir:") $l
>> -done
>> -
>> -# find out all perl scripts in $native_sysroot and modify them=20
>> replacing the
>> -# host perl with SDK perl.
>> -for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec=20
>> grep "^#!.*perl" -l '{}' \;); do
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /u=
sr/bin/env=20
>> perl:g" -e \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "s: /usr/bin/perl: /usr/bi=
n/env perl:g" $perl_script
>> -done
>> -
>> -echo done
>> -
>> -# delete the relocating script, so that user is forced to re-run the=20
>> installer
>> -# if he/she wants another location for the sdk
>> -if [ $savescripts =3D 0 ] ; then
>> -=C2=A0=C2=A0=C2=A0 $SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.=
py=20
>> ${env_setup_script%/*}/relocate_sdk.sh
>> -fi
>> -
>> -echo "SDK has been successfully set up and is ready to be used."
>> -
>> -exit 0
>> -
>> -MARKER:
>> -EOF
>> -=C2=A0=C2=A0=C2=A0 # append the SDK tarball
>> -=C2=A0=C2=A0=C2=A0 cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_=
ARCHIVE_TYPE}=20
>> >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
>> -
>> -=C2=A0=C2=A0=C2=A0 # delete the old tarball, we don't need it anymore
>> -=C2=A0=C2=A0=C2=A0 rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_A=
RCHIVE_TYPE}
>> -}
>> diff --git=20
>> a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.=
bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-=
dummy.bbappend
>> deleted file mode 100644
>> index b83e4e35..00000000
>> ---=20
>> a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.=
bbappend
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -DUMMYPROVIDES +=3D "\
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-bytes \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-carp \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-constant \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-data-dumper \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-errno \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-exporter \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-basename \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-compare \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-copy \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-find \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-glob \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-spec \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-spec-unix \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-file-stat \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-getopt-long \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-io-file \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-overloading \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-posix \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-symbol \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-thread-queue \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-threads \
>> -"
>> diff --git=20
>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-=
arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-qte-toolchain-host.bb
>> deleted file mode 100644
>> index 4d2a98ad..00000000
>> ---=20
>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-=
arago-qte-toolchain-host.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -DESCRIPTION =3D "Host packages for Qt Embedded SDK"
>> -PR =3D "r10"
>> -LICENSE =3D "MIT"
>> -
>> -inherit packagegroup nativesdk
>> -
>> -RDEPENDS:${PN} =3D "\
>> -=C2=A0=C2=A0=C2=A0 nativesdk-packagegroup-arago-tisdk-host \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-qtbase \
>> -=C2=A0=C2=A0=C2=A0 nativesdk-qttools \
>> -=C2=A0=C2=A0=C2=A0 "


