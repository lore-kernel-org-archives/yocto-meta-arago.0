Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B583B52A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 13:03:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GD32T8023283
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:03:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GD31l3012744
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:03:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 08:03:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 5/5]
	packagegroup-arago-tisdk-matrix: Clock app doesnt work on	older boards.
Thread-Index: AQHOfnIH5w8bQUyI5Eis84Xxji+9mJlnTIdg
Date: Tue, 16 Jul 2013 13:03:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596577C0@DLEE11.ent.ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
	<1373574210-4398-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1373574210-4398-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 5/5]	packagegroup-arago-tisdk-matrix: Clock app doesnt work on	older boards.
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
X-List-Received-Date: Tue, 16 Jul 2013 13:03:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, July 11, 2013 3:24 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 5/5] packagegroup-
>arago-tisdk-matrix: Clock app doesnt work on older boards.
>
>* Don't install by default since some older boards don't support
>the Clock demo.

How do the older boards change their cpufreq settings?

>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-matrix.bb             |    5 +++--
> 1 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>matrix.bb
>index f52eb4a..287baf9 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to include Matrix v2"
> LICENSE =3D "MIT"
>-PR =3D "r19"
>+PR =3D "r20"
>
> inherit packagegroup
>
>@@ -23,7 +23,6 @@ MATRIX_COMMON_APPS =3D "              \
>     matrix-gui-settings-demos       \
>     matrix-gui-usb-demos            \
>     matrix-gui-submenus-ethernet    \
>-    matrix-gui-clocks               \
> "
>
> MATRIX_QT_APPS =3D "                  \
>@@ -61,6 +60,7 @@ MATRIX_APPS_append_ti33x =3D "        \
>                                     \
>     matrix-gui-generic-pm           \
>     matrix-gui-pm-demos-suspend     \
>+    matrix-gui-clocks               \
>                                     \
>     matrix-gui-wifi-demos           \
>     matrix-gui-bluetooth-demos      \
>@@ -97,6 +97,7 @@ MATRIX_APPS_append_am37x-evm =3D "    \
>     matrix-gui-camera-loopback      \
>     matrix-gui-v4l2-demos           \
>     matrix-gui-display-control      \
>+    matrix-gui-clocks               \
>                                     \
>     matrix-gui-wifi-demos           \
>     matrix-gui-bluetooth-demos      \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

