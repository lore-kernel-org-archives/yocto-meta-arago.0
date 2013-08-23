Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E8BE852A5F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:32:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKWqKg004203;
	Fri, 23 Aug 2013 15:32:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKWqF4029666;
	Fri, 23 Aug 2013 15:32:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:32:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 1/4] arago-prefs: set default
	preferences for	am437x-evm
Thread-Index: AQHOoD8wt6vontdRzEa3RQpNpvjhB5mjP1tQ
Date: Fri, 23 Aug 2013 20:32:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF48E@DLEE11.ent.ti.com>
References: <1377289626-23073-1-git-send-email-denis@denix.org>
In-Reply-To: <1377289626-23073-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/4] arago-prefs: set default preferences for	am437x-evm
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
X-List-Received-Date: Fri, 23 Aug 2013 20:32:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 3:27 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 1/4] arago-prefs: set default
>preferences for am437x-evm
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
>v2 - fixed u-boot version to be 2013.07+2013.10-rc1
>
> meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>index b125957..28b4caf 100644
>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_qt4-embedded =3D
>"${ARAGO_QT_PROVIDER}"
> PREFERRED_VERSION_qt4-embedded =3D "4.8.4"
> PREFERRED_VERSION_qt4-native =3D "4.8.4"
> PREFERRED_VERSION_nativesdk-qt4-tools =3D "4.8.4"
>+PREFERRED_VERSION_linux-libc-headers =3D "3.8"
>
> # Use v4.09.00.01 of the Graphics SDK
> PREFERRED_VERSION_omap3-sgx-modules =3D "4.09.00.01"
>@@ -23,6 +24,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D
>"linux-ti-staging"
> PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-
>staging"
> PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
>
>+PREFERRED_VERSION_linux-libc-headers_am437x-evm =3D "3.8"
>+PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-staging"
>+PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-
>staging"
>+PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
>+PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D
>"2013.07+2013.10-rc1"
>+
> PREFERRED_VERSION_linux-libc-headers_am180x-evm =3D "2.6.37.2"
> PREFERRED_PROVIDER_virtual/kernel_am180x-evm =3D "linux-omapl138-
>psp"
> PREFERRED_VERSION_linux-omapl138-psp =3D "2.6.37"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

