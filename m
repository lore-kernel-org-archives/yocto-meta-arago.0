Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9C37C529F7
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:53:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FrTNM010803
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:53:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61FrTX9020420
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:53:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 10:53:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] branding-glsdk: update perferences
Thread-Index: AQHOdnGyOuI+rU1jdk6TnrR/rLzQ9ZlP+Ufg
Date: Mon, 1 Jul 2013 15:53:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962BFBC@DLEE11.ent.ti.com>
References: <20130701154259.GA1207@ti.com>
In-Reply-To: <20130701154259.GA1207@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-glsdk: update perferences
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
X-List-Received-Date: Mon, 01 Jul 2013 15:53:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Monday, July 01, 2013 10:43 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] branding-glsdk: update perferences
>
>* Set Preferred Provider for Bootloader to use the GLSDK
>  U-Boot Staging tree.
>* Set Preferred Provider for libgbm to use the GLSDK libgbm
>  and set corresponding version to 9.0.0.
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> .../conf/distro/include/branding-glsdk.inc         |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc b/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc
>index d1c30f3..2111d81 100644
>--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
>+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
>@@ -2,3 +2,6 @@
>
> # Use the SDK supported kernel and kernel version
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"
>+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-glsdk-staging"
>+PREFERRED_PROVIDER_libgbm =3D "libgbm-glsdk"
>+PREFERRED_VERSION_libgbm =3D "9.0.0"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

