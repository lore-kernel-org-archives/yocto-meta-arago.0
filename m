Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A827652A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:10:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJAngT031213;
	Fri, 20 Jun 2014 14:10:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJAn4T005780;
	Fri, 20 Jun 2014 14:10:49 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:10:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
	DEFAULTTUNE settings that went to meta-ti
Thread-Index: AQHPjLJu7sQmCVBtIEqYGblmZz01b5t6XUYQ
Date: Fri, 20 Jun 2014 19:10:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D9495@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-16-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-16-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 15/19] toolchain-linaro/gcc: remove DEFAULTTUNE settings that went to meta-ti
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
X-List-Received-Date: Fri, 20 Jun 2014 19:10:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
>DEFAULTTUNE settings that went to meta-ti
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 5 --
>---
> meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 5 --
>---
> 2 files changed, 10 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/include/toolchain-
>gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>index f7c8032..530f3c3 100644
>--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>@@ -2,11 +2,6 @@
> TCMODE =3D "default"
> TCLIBC =3D "eglibc"
>
>-DEFAULTTUNE =3D "cortexa8thf-neon"
>-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
>-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
>-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
>-
> # Match some of the external vars
> TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
> TOOLCHAIN_PREFIX :=3D "${TARGET_PREFIX}"
>diff --git a/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
>linaro.inc
>index 95269a7..26e69ae 100644
>--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
>@@ -3,11 +3,6 @@ TCMODE =3D "external-linaro"
> TCLIBC =3D "external-linaro-toolchain"
>
> ELT_TARGET_SYS =3D "arm-linux-gnueabihf"
>-DEFAULTTUNE =3D "cortexa8thf-neon"
>-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
>-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
>-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
>-DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
>
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
>"external-linaro-toolchain"
>
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

