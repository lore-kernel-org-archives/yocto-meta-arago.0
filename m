Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7731952A7D
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 13:26:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ADQOtH012330
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:26:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ADQOFF017259
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:26:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 10 May 2013 08:26:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] Add recipe for test images
Thread-Index: AQHOTWyCRdGv2PBKEUu8sa6L1yKpiJj+aObA
Date: Fri, 10 May 2013 13:26:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159554B95@DLEE11.ent.ti.com>
References: <1368182845-8507-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1368182845-8507-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] Add recipe for test images
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
X-List-Received-Date: Fri, 10 May 2013 13:26:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Friday, May 10, 2013 5:47 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] Add recipe for test images
>

You patch description is wrong and there is no reason given.  You are not a=
dding a recipe but modifying an existing one.

>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../recipes-core/images/arago-test-image.bb        |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-test-
>image.bb b/meta-arago-distro/recipes-core/images/arago-test-
>image.bb
>index f220127..ff4cd26 100644
>--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
>+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
>@@ -3,7 +3,7 @@
>
> require arago-image.inc
>
>-COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|keystone-evm"
>+COMPATIBLE_MACHINE =3D "(?!arago)"

What is the reason driving this change?

>
> # The size of the uncompressed ramdisk is 32MB
> ROOTFS_SIZE =3D "32768"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

