Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C3E045299E
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 20:44:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rACKi9oI019756;
	Tue, 12 Nov 2013 14:44:09 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rACKi8m9019230;
	Tue, 12 Nov 2013 14:44:08 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 12 Nov 2013 14:44:08 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-arm*: update with required
	KERNEL_IMAGETYPE and UBOOT_LOADADDR vars
Thread-Index: AQHO3970iuRVgTehrU+ybRfmuZdlUpoiEBAg
Date: Tue, 12 Nov 2013 20:44:08 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598109FC@DLEE11.ent.ti.com>
References: <1384285160-20212-1-git-send-email-denis@denix.org>
In-Reply-To: <1384285160-20212-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-arm*: update with required KERNEL_IMAGETYPE and UBOOT_LOADADDR vars
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
X-List-Received-Date: Tue, 12 Nov 2013 20:44:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, November 12, 2013 1:39 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] arago-arm*: update with required
>KERNEL_IMAGETYPE and UBOOT_LOADADDR vars
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/machine/arago-armv5.conf | 3 +++
> meta-arago-distro/conf/machine/arago-armv7.conf | 3 +++
> 2 files changed, 6 insertions(+)
>
>diff --git a/meta-arago-distro/conf/machine/arago-armv5.conf
>b/meta-arago-distro/conf/machine/arago-armv5.conf
>index 65d9993..e5eea16 100644
>--- a/meta-arago-distro/conf/machine/arago-armv5.conf
>+++ b/meta-arago-distro/conf/machine/arago-armv5.conf
>@@ -7,6 +7,9 @@ include conf/machine/include/tune-arm926ejs.inc
>
> IMAGE_FSTYPES =3D "tar.gz"
>
>+KERNEL_IMAGETYPE =3D "zImage"
>+UBOOT_LOADADDRESS =3D "0"
>+
> SERIAL_CONSOLE =3D ""
> SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1 115200;ttyS2
>115200;ttyO0 115200;ttyO1 115200;ttyO2"
> SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>diff --git a/meta-arago-distro/conf/machine/arago-armv7.conf
>b/meta-arago-distro/conf/machine/arago-armv7.conf
>index 1964dd3..4b8aa38 100644
>--- a/meta-arago-distro/conf/machine/arago-armv7.conf
>+++ b/meta-arago-distro/conf/machine/arago-armv7.conf
>@@ -7,6 +7,9 @@ include conf/machine/include/tune-cortexa8.inc
>
> IMAGE_FSTYPES =3D "tar.gz"
>
>+KERNEL_IMAGETYPE =3D "zImage"
>+UBOOT_LOADADDRESS =3D "0"
>+
> SERIAL_CONSOLE =3D ""
> SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1 115200;ttyS2
>115200;ttyO0 115200;ttyO1 115200;ttyO2"
> SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

