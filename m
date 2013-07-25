Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F2367529D3
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2013 20:30:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6PKUhvX010940
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:30:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6PKUhYe009249
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:30:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 25 Jul 2013 15:30:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 5/5]
	packagegroup-arago-tisdk-matrix: Clock app doesnt work on	older boards.
Thread-Index: AQHOgiTNSJb05lkM2kaHT8JQ6nbhEpl14+gg
Date: Thu, 25 Jul 2013 20:30:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C50B1F3@DFLE08.ent.ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
	<1373574210-4398-5-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596577C0@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596577C0@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Thu, 25 Jul 2013 20:30:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, July 16, 2013 8:03 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [master & danny][PATCH 5/5] packagegroup-arago-
> tisdk-matrix: Clock app doesnt work on older boards.
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Thursday, July 11, 2013 3:24 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [master & danny][PATCH 5/5] packagegroup-
> >arago-tisdk-matrix: Clock app doesnt work on older boards.
> >
> >* Don't install by default since some older boards don't support the
> >Clock demo.
>=20
> How do the older boards change their cpufreq settings?
I missed this comment.=20

I do not believe we currently support changing the cpufreq setting on those=
 devices. When I looked at the "supported" frequencies returned by the kern=
el on non am335 and am37 boards I get cpu frequencies that didn't make any =
sense. When I tried those frequencies anyway the frequency didn't bother ch=
anging. Double checking old sdks we only included the ability to change fre=
quencies on am335 and am37x.


>=20
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../packagegroup-arago-tisdk-matrix.bb             |    5 +++--
> > 1 files changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
> >arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> >matrix.bb
> >index f52eb4a..287baf9 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-matrix.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-matrix.bb
> >@@ -1,6 +1,6 @@
> > DESCRIPTION =3D "Task to include Matrix v2"
> > LICENSE =3D "MIT"
> >-PR =3D "r19"
> >+PR =3D "r20"
> >
> > inherit packagegroup
> >
> >@@ -23,7 +23,6 @@ MATRIX_COMMON_APPS =3D "              \
> >     matrix-gui-settings-demos       \
> >     matrix-gui-usb-demos            \
> >     matrix-gui-submenus-ethernet    \
> >-    matrix-gui-clocks               \
> > "
> >
> > MATRIX_QT_APPS =3D "                  \
> >@@ -61,6 +60,7 @@ MATRIX_APPS_append_ti33x =3D "        \
> >                                     \
> >     matrix-gui-generic-pm           \
> >     matrix-gui-pm-demos-suspend     \
> >+    matrix-gui-clocks               \
> >                                     \
> >     matrix-gui-wifi-demos           \
> >     matrix-gui-bluetooth-demos      \
> >@@ -97,6 +97,7 @@ MATRIX_APPS_append_am37x-evm =3D "    \
> >     matrix-gui-camera-loopback      \
> >     matrix-gui-v4l2-demos           \
> >     matrix-gui-display-control      \
> >+    matrix-gui-clocks               \
> >                                     \
> >     matrix-gui-wifi-demos           \
> >     matrix-gui-bluetooth-demos      \
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

