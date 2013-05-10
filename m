Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C4EBB52972
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 13:43:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ADhkLs022596
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:43:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ADhkDG006515
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:43:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 10 May 2013 08:43:45 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] Add pciutils to the console package
Thread-Index: AQHOTWumEMUqFIl6HUSMaOgEgbLUL5j+vLGA//+umwA=
Date: Fri, 10 May 2013 13:43:44 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905491D894@DLEE11.ent.ti.com>
References: <1368182794-8463-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159554B57@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159554B57@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] Add pciutils to the console package
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
X-List-Received-Date: Fri, 10 May 2013 13:43:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the response.
Pciutils provides very basic utilities for pci, when you have pci interface=
 supported in the platform. ( I guess this is common).  There was customer =
request to have it in a minimal file system.

If it does not belong in here. Please suggest any alternate recipes where t=
his will naturally belong.

There is only 1 patch, I wanted to send.  The other patches are not relevan=
t, please ignore.

With regards,
sam


-----Original Message-----
From: Maupin, Chase=20
Sent: Friday, May 10, 2013 9:26 AM
To: Nelson, Sam; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 1/3] Add pciutils to the console package

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Friday, May 10, 2013 5:47 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/3] Add pciutils to the console package

Why are you adding this to the console package?  That is supposed to be a s=
mall package so what is the use case for adding this here instead of somewh=
ere else?

Also, I didn't see patches 2 and 3 of this set.  Did I miss them?

>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../packagegroups/packagegroup-arago-console.bb    |    1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/meta-arago-distro/recipes-=20
>core/packagegroups/packagegroup-arago-console.bb b/meta-arago-=20
>distro/recipes-core/packagegroups/packagegroup-arago-console.bb
>index 5a80064..930049a 100755
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-console.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-console.bb
>@@ -25,6 +25,7 @@ ARAGO_UTILS =3D "\
>     i2c-tools \
>     iproute2 \
>     strace \
>+    pciutils \

You would need to bump the PR

>     "
>
> ARAGO_SDK_PREREQ =3D "\
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

