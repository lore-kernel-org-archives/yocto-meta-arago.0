Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC3C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:37:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.67951.1710175055912276428
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 09:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=RkRgfjVn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BGbYE5046661;
	Mon, 11 Mar 2024 11:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710175054;
	bh=GZD8nRD4ycSPNbj70rDJyA25o2ztzOMP2zGhWjZOVMk=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=RkRgfjVnrd3IZ3X+vtkxAEoM9/+SEwXQk2E4QHp190cScCJi4M6H5AFRIRBA0Z8XX
	 tin5l85IMyG86zjR4jG2FhY7f9GCnxHWg3/0Hw2ESc0cy5x7/0R6sEEBilJtyKQhaP
	 TeCbRVRQI51R1i4FwxhVvOtXuZCAReAaFsPanOXU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BGbYHn004607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 11:37:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 11:37:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 11:37:33 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BGbUR6051116;
	Mon, 11 Mar 2024 11:37:31 -0500
Message-ID: <b871eac0-5bf5-40d1-a148-f64d53c03ef4@ti.com>
Date: Mon, 11 Mar 2024 22:07:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master][PATCH] dual-camera-demo:
 Remove this non-functioning demo
Content-Language: en-US
To: <afd@ti.com>, <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191123.67829-1-afd@ti.com>
 <8dfa9eae-496d-4306-a618-78bfe10728be@ti.com>
 <480876e6-3086-4720-8fed-85330a6baaaf@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, "Limaye, Aniket" <a-limaye@ti.com>,
        Khasim <khasim@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <480876e6-3086-4720-8fed-85330a6baaaf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 42BGbYE5046661
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Mar 2024 16:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15234

Hi Andrew,
On 11/03/24 19:42, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/7/24 5:=E2=80=8A43 PM, Ryan Eatmon via lists.=E2=80=8Ayoctoproject=
.=E2=80=8Aorg wrote: >=20
> > > On 3/5/2024 1:=E2=80=8A11 PM, Andrew Davis wrote: >> This demo has =
not=20
> been maintained for years and is no longer functional. >> Remove this=20
> demo. >> >>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> On 3/7/24 5:43 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >=20
> >=20
> > On 3/5/2024 1:11 PM, Andrew Davis wrote:
> >> This demo has not been maintained for years and is no longer functio=
nal.
> >> Remove this demo.
> >>
> >> Signed-off-by: Andrew Davis <afd@ti.com>
> >> ---
> >> =C2=A0 .../dual-camera-demo/desc_dual-camera.html=C2=A0=C2=A0=C2=A0 =
|=C2=A0 7 ---
> >> =C2=A0 .../dual-camera-demo/dual-camera.desktop=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 ----
> >> =C2=A0 .../dual-camera-demo/dual_camera_qt4.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 ----
> >> =C2=A0 .../dual-camera-demo/dual_camera_qt5.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 13 -----
> >> =C2=A0 .../dual-camera-demo/dual-camera-demo_1.0.bb=C2=A0 | 47 -----=
--------------
> >> =C2=A0 .../packagegroup-arago-tisdk-multimedia.bb=C2=A0=C2=A0=C2=A0 =
|=C2=A0 3 --
> >> =C2=A0 6 files changed, 90 deletions(-)
> >> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/desc_dual-camera.html
> >> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/dual-camera.desktop
> >> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/dual_camera_qt4.sh
> >> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/dual_camera_qt5.sh
> >> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo_1.0.bb
> >>
> >> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo/desc_dual-camera.html b/meta-arago-demos/recipes-apps/dual-camer=
a-demo/dual-camera-demo/desc_dual-camera.html
> >> deleted file mode 100644
> >> index e3269600..00000000
> >> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-dem=
o/desc_dual-camera.html
> >> +++ /dev/null
> >> @@ -1,7 +0,0 @@
> >> -<h1> Dual Camera Demo </h1>
> >> -
> >> -<p> This example demonstrates the dual camera capabilities of the V=
PFE and DSS.=C2=A0 If used on an AM437x GP EVM, two camera displays will =
be available.=C2=A0 Otherwise, one camera feed will be displayed. </p>
> >> -<p>
> >> -<span style=3D"color:red">NOTE: Please make sure the camera module =
is inserted into AM437x GP EVM header for dual camera functionality. </sp=
an>
> >> -</p>
> >> -
> >> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo/dual-camera.desktop b/meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/dual-camera.desktop
> >> deleted file mode 100644
> >> index e3544883..00000000
> >> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-dem=
o/dual-camera.desktop
> >> +++ /dev/null
> >> @@ -1,10 +0,0 @@
> >> -#!/usr/bin/env xdg-open
> >> -[Desktop Entry]
> >> -Name=3DDual Camera Demo
> >> -GenericName=3DDemo App
> >> -Icon=3D/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
> >> -Type=3DApplication
> >> -Exec=3Ddual_camera.sh
> >> -Categories=3Dcamera
> >> -ProgramType=3Dgui
> >> -X-MATRIX-Description=3D/usr/share/matrix-gui-2.0/apps/dual-camera/d=
esc_dual-camera.html
> >> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo/dual_camera_qt4.sh b/meta-arago-demos/recipes-apps/dual-camera-d=
emo/dual-camera-demo/dual_camera_qt4.sh
> >> deleted file mode 100644
> >> index 6d9675db..00000000
> >> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-dem=
o/dual_camera_qt4.sh
> >> +++ /dev/null
> >> @@ -1,10 +0,0 @@
> >> -#!/bin/sh
> >> -
> >> -/etc/init.d/matrix-gui-2.0 stop
> >> -
> >> -export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> >> -export QWS_MOUSE_PROTO=3DTslib:/dev/input/touchscreen0
> >> -
> >> -dual_camera -qws
> >> -
> >> -/etc/init.d/matrix-gui-2.0 start
> >> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo/dual_camera_qt5.sh b/meta-arago-demos/recipes-apps/dual-camera-d=
emo/dual-camera-demo/dual_camera_qt5.sh
> >> deleted file mode 100644
> >> index f01bea34..00000000
> >> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-dem=
o/dual_camera_qt5.sh
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -#!/bin/sh
> >> -
> >> -/etc/init.d/weston stop
> >> -sleep 1
> >> -
> >> -echo 0 > /sys/class/graphics/fbcon/cursor_blink
> >> -
> >> -dual_camera -platform linuxfb
> >> -
> >> -echo 1 > /sys/class/graphics/fbcon/cursor_blink
> >> -
> >> -/etc/init.d/weston start
> >> -sleep 1
> >> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo_1.0.bb b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-cam=
era-demo_1.0.bb
> >> deleted file mode 100644
> >> index 157e5602..00000000
> >> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-dem=
o_1.0.bb
> >> +++ /dev/null
> >> @@ -1,47 +0,0 @@
> >> -DESCRIPTION =3D "Qt Dual Camera Demo"
> >> -HOMEPAGE =3D "https://urldefense.com/v3/__https://gitorious.org/dua=
l-camera-demo/__;!!G3vK!XIwUB9AcCoLgn1SKzdjIk0gtHTi7RM93ptuS8EA8RBZ-cQpws=
CrTcMN0P1xl43SV5lb2m3bZR2fpJfFeEekGXXHOH84b$"
> >> -SECTION =3D "multimedia"
> >> -LICENSE =3D "GPL-2.0-only"
> >> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f=
19f52eb5"
> >> -
> >> -DEPENDS +=3D "libdrm cmem"
> >> -require recipes-core/matrix/matrix-gui-paths.inc
> >> -
> >> -PR =3D "r20"
> >> -
> >> -BRANCH =3D "master"
> >> -SRCREV =3D "3188b1eacb14dda0dcf3a58877962d86687b6d20"
> >> -
> >> -SRC_URI =3D "git://git.ti.com/git/sitara-linux/dual-camera-demo.git=
;protocol=3Dhttps;branch=3D${BRANCH} \
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/desc_dual-camera.html \
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/dual_camera_qt5.sh \
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/dual_camera_qt4.sh \
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/dual-camera.desktop \
> >> -"
> >> -
> >> -S =3D "${WORKDIR}/git"
> >> -
> >> -inherit qt5
> >> -
> >> -export SDK_PATH_TARGET=3D'${STAGING_DIR_HOST}'
> >> -
> >> -# use the make targets already created in the Makefile.build files
> >> -do_install() {
> >> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/bin
> >> -=C2=A0=C2=A0=C2=A0 install -d ${D}${MATRIX_APP_DIR}/dual-camera
> >> -=C2=A0=C2=A0=C2=A0 install dual_camera ${D}/usr/bin/dual_camera
> >> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/dual_camera_qt5.sh ${D}/usr/b=
in/dual_camera.sh
> >> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/desc_dual-camera.html ${D}/${=
MATRIX_APP_DIR}/dual-camera
> >> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/dual-camera.desktop ${D}/${MA=
TRIX_APP_DIR}/dual-camera
> >> -}
> >> -
> >> -PACKAGES +=3D "matrix-gui-apps-dual-camera"
> >> -
> >> -RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
> >> -
> >> -RDEPENDS:matrix-gui-apps-dual-camera=C2=A0 =3D "matrix-gui-apps-ima=
ges matrix-gui-submenus-camera ${PN}"
> >> -
> >> -# Add the matrix directory to the FILES
> >> -FILES:${PN} =3D "/usr/bin/*"
> >> -
> >> -FILES:matrix-gui-apps-dual-camera =3D "${MATRIX_APP_DIR}/*"
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-multimedia.bb
> >> index b4148882..ba9ac544 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia.bb
> >> @@ -14,16 +14,13 @@ MULTIMEDIA =3D " \
> >> =C2=A0 MULTIMEDIA:omapl138 =3D ""
> >> -DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES', 'open=
gl', 'dual-camera-demo', '', d)}"
> >> =C2=A0 IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES=
', 'opengl', 'image-gallery', '', d)}"
> >> =C2=A0 MULTIMEDIA:append:ti43x =3D " \
> >> -=C2=A0=C2=A0=C2=A0 ${DUAL_CAMERA_DEMO} \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${IMAGE_GALLERY_DEMO} \
> >> =C2=A0 "
> >> =C2=A0 MULTIMEDIA:append:omap-a15 =3D " \
> >> -=C2=A0=C2=A0=C2=A0 ${DUAL_CAMERA_DEMO} \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${IMAGE_GALLERY_DEMO} \
> >> =C2=A0 "
> >=20
> >=20
> > No joy.=C2=A0 There is another reference to the recipe:
> >=20
> > ERROR: Nothing RPROVIDES 'matrix-gui-apps-dual-camera' (but /scratch/=
jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-distr=
o/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb RDEPENDS =
on or otherwise requires it)
> >=20
> > Please submit a v2 and remove that from the RDEPENDS as well.
> >=20
>
> Sure, v2 sent.
>
> Side question, "matrix gui" is starting to become a broken demo graveya=
rd, do
> we have plans to check on all the demos and remove/fix broken ones. Or =
is it time
> to simply remove matrix demo launcher from Arago?..
>
> Andrew

There was a patch sent by Kartheek last year to remove Matrix demo for=20
all k3 platforms & maintain it only for legacy devices[1].
But that had to be reverted[2] just because we have some dependencies in=20
test farm that uses=C2=A0runLmDDRBandwidth.sh script shipped
by Matrix Demo. So, someone has to re-work on removing this test-farm=20
dependency on Matrix Demo if we are planning to remove it
entirely from Arago.


I agree that as Matrix Demo is no longer maintained by anyone it has=20
started becoming a broken demo.
If there's no one maintaining it then it's better we drop it as shipping=20
an OOB Demo without anyone maintaining &
validating it looks inappropriate!


Btw, the Processor SDK layer of both Jacinto & Sitara already removes=20
Matrix Demo in their layer[3]. So, anyone building
tisdk-default-image using Processor SDK oe-config file or using=20
tisdk-default-image from Processor SDK ti.com page
won't even have Matrix Demo in filesystem. The default OOB from=20
Processor SDK Layer in almost all k3 platforms is ti-apps-laumcher.


[1]:=20
https://git.yoctoproject.org/meta-arago/commit/?h=3Dkirkstone-next&id=3D3=
5387dd8dbc438b759d8de1ae195664272af9cd3

[2]:=20
https://git.yoctoproject.org/meta-arago/commit/?h=3Dkirkstone-next&id=3D8=
2f586255afad791d71d77bdd221b5281ed33bb6

[3]:=20
https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/tree/recipes-core/images/=
tisdk-default-image.bbappend?h=3Dkirkstone#n9


Regards,
Chirag

>
> >=20
> >=20
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15233):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15233__;!!G3vK!XIwUB9AcCoLgn1SKzdjIk0=
gtHTi7RM93ptuS8EA8RBZ-cQpwsCrTcMN0P1xl43SV5lb2m3bZR2fpJfFeEekGXecLSFI5$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104751769/7030289__;!!G3vK!XIwUB9AcCoLgn1SKzdjIk0gtHTi7RM93ptuS8EA=
8RBZ-cQpwsCrTcMN0P1xl43SV5lb2m3bZR2fpJfFeEekGXYYsW-Fr$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!XIwUB9AcCoLgn1SKzdjIk0gtHTi7RM93ptuS8EA8RBZ-c=
QpwsCrTcMN0P1xl43SV5lb2m3bZR2fpJfFeEekGXdHg2W0K$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

