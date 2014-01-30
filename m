Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 81382529B2
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:54:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMsSq0020038
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:54:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMsSw3006225
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:54:28 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 30 Jan 2014 16:54:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ts-calibrate: Always export
	TSLIB_CALIBFILE	env variable
Thread-Index: AQHPHg0cSXiUbazbAEWjG69VTkbnz5qd4CVw
Date: Thu, 30 Jan 2014 22:54:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015993A8B6@DLEE11.ent.ti.com>
References: <1391127157-6874-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1391127157-6874-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE	env variable
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
X-List-Received-Date: Thu, 30 Jan 2014 22:54:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, January 30, 2014 6:13 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH] ts-calibrate: Always export
>TSLIB_CALIBFILE env variable
>
>* Previously TSLIB_CALIBFILE env variable was only being exported
>if the mmc
>  partition was mounted.
>* Move the export statement outside of the if statement to insure
>that this
>  important variable is always exported.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-graphics/tslib/ts-calibrate-init/init  |    3 ++-
> .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init/init
>index 5d5c0aa..ab19da3 100644
>--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init/init
>+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init/init
>@@ -31,9 +31,10 @@ mount | grep /media/mmcblk0p1 | grep vfat >
>/dev/null 2>&1
> if [ "$?" =3D "0" ]
> then
>     tsfile=3D/media/mmcblk0p1/pointercal
>-    export TSLIB_CALIBFILE=3D$tsfile
> fi
>
>+export TSLIB_CALIBFILE=3D$tsfile

This is a nice to have but not strictly required right?  Because the defaul=
t is /etc/pointercal and you only need to reset this if you are pointing to=
 the SD card.  Or am I missing something?

>+
> if [ ! -f $tsfile ] ; then
>     echo -n "Calibrating touchscreen (first time only)"
>     ts_calibrate
>diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init_1.0.bb b/meta-arago-extras/recipes-
>graphics/tslib/ts-calibrate-init_1.0.bb
>index dde5c42..0915941 100644
>--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init_1.0.bb
>+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init_1.0.bb
>@@ -6,7 +6,7 @@ RDEPENDS_${PN} +=3D "tslib"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afd
>cc6c60"
>
>-PR =3D "r2"
>+PR =3D "r3"
>
> S =3D "${WORKDIR}"
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

