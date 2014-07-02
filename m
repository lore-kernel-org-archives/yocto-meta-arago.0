Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3E57552A80
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 14:37:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62EbHhp008481
	for <meta-arago@arago-project.org>; Wed, 2 Jul 2014 09:37:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62EbHEN010309
	for <meta-arago@arago-project.org>; Wed, 2 Jul 2014 09:37:17 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 2 Jul 2014 09:37:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] arago-prefs: Use u-boot-ti-staging instead of mainline
Thread-Index: AQHPlgL++OJZzRwsr0C0Xu+iJ6fh85uM2ifA
Date: Wed, 2 Jul 2014 14:37:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D10986D@DLEE11.ent.ti.com>
References: <1404311778-16048-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404311778-16048-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-prefs: Use u-boot-ti-staging instead of mainline
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
X-List-Received-Date: Wed, 02 Jul 2014 14:37:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I should have marked this as [for-dora]

>-----Original Message-----
>From: Maupin, Chase
>Sent: Wednesday, July 02, 2014 9:36 AM
>To: meta-arago@arago-project.org
>Cc: Maupin, Chase
>Subject: [PATCH] arago-prefs: Use u-boot-ti-staging instead of
>mainline
>
>* The migration to use mainline u-boot which supports all
>  platforms was added for the Daisy branch of meta-ti.  For Dora
>  the mainline version does not support all platforms and the
>  u-boot-ti-staging recipe should be used instead by default.
>
>Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>---
> .../conf/distro/include/arago-prefs.inc            |    7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>index 63e9e22..a2f42b1 100644
>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>@@ -59,10 +59,9 @@ PREFERRED_PROVIDER_virtual/libgles2_keystone =3D
>"mesa"
> PREFERRED_PROVIDER_virtual/libgl_keystone =3D "mesa"
> PREFERRED_PROVIDER_virtual/mesa_keystone =3D "mesa"
>
>-# Use the mainline u-boot recipe for TI devices unless overridden
>below
>-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>-PREFERRED_PROVIDER_u-boot =3D "u-boot"
>-PREFERRED_VERSION_u-boot =3D "2014.04+2014.07-rc3"
>+# Use the u-boot staging recipe for TI devices unless overridden
>below
>+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
>+PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>
> # Use latest TI staging kernel and u-boot trees
> PREFERRED_PROVIDER_virtual/bootloader_keystone =3D "u-boot-
>keystone"
>--
>1.7.9.5


