Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2905652A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:11:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJB6O4022057;
	Fri, 20 Jun 2014 14:11:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJB6Od019430;
	Fri, 20 Jun 2014 14:11:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:11:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 16/19] arago-prefs,	toolchain-linaro:
	update system versions
Thread-Index: AQHPjLEcRo/FP8GR8U+M4kkDQf7JT5t6XV5A
Date: Fri, 20 Jun 2014 19:11:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D94FB@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-17-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-17-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 16/19] arago-prefs, toolchain-linaro: update system versions
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 19:11:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 16/19] arago-prefs, toolchain-linaro:
>update system versions
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/arago-prefs.inc      | 12
>+++++-------
> meta-arago-distro/conf/distro/include/toolchain-linaro.inc |  8
>++++----
> 2 files changed, 9 insertions(+), 11 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>index 63e9e22..437bb61 100644
>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>@@ -1,9 +1,9 @@
> # Set *target* toolchain preferences at global distro level.
> # Cross and SDK toolchain preferences are set in toolchain-*.inc
>files
>-GCCVERSION ?=3D "4.7%"
>-BINUVERSION ?=3D "2.23%"
>-EGLIBCVERSION ?=3D "2.17%"
>-LINUXLIBCVERSION ?=3D "3.10"
>+GCCVERSION ?=3D "4.8%"
>+BINUVERSION ?=3D "2.24%"
>+EGLIBCVERSION ?=3D "2.19%"
>+LINUXLIBCVERSION ?=3D "3.14"
>
> PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> PREFERRED_VERSION_gcc-runtime ?=3D "${GCCVERSION}"
>@@ -21,7 +21,7 @@ include conf/distro/include/qt5-versions.inc
> PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
>
> # Use the latest version of libdrm
>-PREFERRED_VERSION_libdrm =3D "2.4.46"
>+PREFERRED_VERSION_libdrm =3D "2.4.52"
>
> PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>
>@@ -68,10 +68,8 @@ PREFERRED_VERSION_u-boot =3D "2014.04+2014.07-
>rc3"
> PREFERRED_PROVIDER_virtual/bootloader_keystone =3D "u-boot-
>keystone"
> PREFERRED_PROVIDER_u-boot_keystone =3D "u-boot-keystone"
>
>-PREFERRED_VERSION_linux-libc-headers_am335x-evm =3D "3.10"
> PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-ti-staging"
>
>-PREFERRED_VERSION_linux-libc-headers_am437x-evm =3D "3.10"
> PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-staging"
>
> PREFERRED_VERSION_linux-libc-headers_am180x-evm =3D "2.6.37.2"
>diff --git a/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc
>index 26e69ae..a4160d4 100644
>--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>@@ -23,10 +23,10 @@ PREFERRED_PROVIDER_binutils-cross-canadian-
>${TRANSLATED_TARGET_ARCH} ?=3D "externa
> bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D
>"${exec_prefix}/bin"
> PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D
>"gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
>-SDKGCCVERSION ?=3D "4.7%"
>-SDKBINUVERSION ?=3D "2.23%"
>-SDKEGLIBCVERSION ?=3D "2.17%"
>-SDKLINUXLIBCVERSION ?=3D "3.10%"
>+SDKGCCVERSION ?=3D "4.8%"
>+SDKBINUVERSION ?=3D "2.24%"
>+SDKEGLIBCVERSION ?=3D "2.19%"
>+SDKLINUXLIBCVERSION ?=3D "3.14%"
>
> PREFERRED_VERSION_gcc-crosssdk ?=3D "${SDKGCCVERSION}"
> PREFERRED_VERSION_gcc-crosssdk-initial ?=3D "${SDKGCCVERSION}"
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

