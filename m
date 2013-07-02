Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1728A52979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:46:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IkEAP008846
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:46:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62IkEdW029103
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:46:14 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:46:14 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 6/6]
	packagegroup-arago-tisdk-addons: Only include parted utility	for
	omap-a15
Thread-Index: AQHOd0YCTGcwkEmpFUKV4rK0JtdSrZlRukjA
Date: Tue, 2 Jul 2013 18:46:13 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596305D9@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
	<1372785354-1920-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-6-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 6/6]	packagegroup-arago-tisdk-addons: Only include parted utility	for omap-a15
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
X-List-Received-Date: Tue, 02 Jul 2013 18:46:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 02, 2013 12:16 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 6/6] packagegroup-
>arago-tisdk-addons: Only include parted utility for omap-a15
>
>* As of right now only omap-a15 can utilize a tool like parted.
>* Only pull in parted for omap-a15.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-addons.bb             |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>addons.bb
>index 9efcb73..4537de1 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install additional utilities/demos for
>SDKs"
> LICENSE =3D "MIT"
>-PR =3D "r8"
>+PR =3D "r9"
>
> inherit packagegroup
>
>@@ -16,7 +16,6 @@ UTILS =3D " \
>     arm-benchmarks \
>     dropbear \
>     openssh-sftp-server \
>-    parted \
> "
>
> # Add PRU examples for am180x-evm devices
>@@ -24,6 +23,7 @@ UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
>
> UTILS_append_omap3 =3D " canutils"
> UTILS_append_ti33x =3D " canutils"
>+UTILS_append_omap-a15 =3D "parted"
>
> RDEPENDS_${PN} =3D "\
>     ${UTILS} \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

