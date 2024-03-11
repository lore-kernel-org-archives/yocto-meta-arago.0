Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2790C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:13:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.63802.1710166379274085741
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 07:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jeUdQW3n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BECwP3012601;
	Mon, 11 Mar 2024 09:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710166378;
	bh=k82+E86kEU/m+xLJfN/LralXRisbFY0zWu/8usocnT8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jeUdQW3nSvWDjsDEowxYNDZ7eJXOXXYsMzgB2OH7EKDY/wEZOjWpYWNeyu0cePODy
	 ++2KeU7wz8HmZHnYF5E0wRZKx43nJpt4GU8aFnlPRQ4XwpUCWFKTkj6SLjUzjRFXJk
	 kAmg4z1cywT8GFX8Zsx82i1jwrTnIV5cu2UBLLxw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BECwar003058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 09:12:58 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 09:12:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 09:12:57 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BECvHJ120244;
	Mon, 11 Mar 2024 09:12:57 -0500
Message-ID: <480876e6-3086-4720-8fed-85330a6baaaf@ti.com>
Date: Mon, 11 Mar 2024 09:12:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] dual-camera-demo: Remove this
 non-functioning demo
To: <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191123.67829-1-afd@ti.com>
 <8dfa9eae-496d-4306-a618-78bfe10728be@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <8dfa9eae-496d-4306-a618-78bfe10728be@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 42BECwP3012601
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Mar 2024 14:13:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15233

On 3/7/24 5:43 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 3/5/2024 1:11 PM, Andrew Davis wrote:
>> This demo has not been maintained for years and is no longer functiona=
l.
>> Remove this demo.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../dual-camera-demo/desc_dual-camera.html=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 ---
>> =C2=A0 .../dual-camera-demo/dual-camera.desktop=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 ----
>> =C2=A0 .../dual-camera-demo/dual_camera_qt4.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 ----
>> =C2=A0 .../dual-camera-demo/dual_camera_qt5.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 13 -----
>> =C2=A0 .../dual-camera-demo/dual-camera-demo_1.0.bb=C2=A0 | 47 -------=
------------
>> =C2=A0 .../packagegroup-arago-tisdk-multimedia.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 --
>> =C2=A0 6 files changed, 90 deletions(-)
>> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo/desc_dual-camera.html
>> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo/dual-camera.desktop
>> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo/dual_camera_qt4.sh
>> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo/dual_camera_qt5.sh
>> =C2=A0 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo_1.0.bb
>>
>> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo/desc_dual-camera.html b/meta-arago-demos/recipes-apps/dual-camera-=
demo/dual-camera-demo/desc_dual-camera.html
>> deleted file mode 100644
>> index e3269600..00000000
>> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/=
desc_dual-camera.html
>> +++ /dev/null
>> @@ -1,7 +0,0 @@
>> -<h1> Dual Camera Demo </h1>
>> -
>> -<p> This example demonstrates the dual camera capabilities of the VPF=
E and DSS.=C2=A0 If used on an AM437x GP EVM, two camera displays will be=
 available.=C2=A0 Otherwise, one camera feed will be displayed. </p>
>> -<p>
>> -<span style=3D"color:red">NOTE: Please make sure the camera module is=
 inserted into AM437x GP EVM header for dual camera functionality. </span=
>
>> -</p>
>> -
>> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo/dual-camera.desktop b/meta-arago-demos/recipes-apps/dual-camera-de=
mo/dual-camera-demo/dual-camera.desktop
>> deleted file mode 100644
>> index e3544883..00000000
>> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/=
dual-camera.desktop
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -#!/usr/bin/env xdg-open
>> -[Desktop Entry]
>> -Name=3DDual Camera Demo
>> -GenericName=3DDemo App
>> -Icon=3D/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
>> -Type=3DApplication
>> -Exec=3Ddual_camera.sh
>> -Categories=3Dcamera
>> -ProgramType=3Dgui
>> -X-MATRIX-Description=3D/usr/share/matrix-gui-2.0/apps/dual-camera/des=
c_dual-camera.html
>> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo/dual_camera_qt4.sh b/meta-arago-demos/recipes-apps/dual-camera-dem=
o/dual-camera-demo/dual_camera_qt4.sh
>> deleted file mode 100644
>> index 6d9675db..00000000
>> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/=
dual_camera_qt4.sh
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -#!/bin/sh
>> -
>> -/etc/init.d/matrix-gui-2.0 stop
>> -
>> -export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
>> -export QWS_MOUSE_PROTO=3DTslib:/dev/input/touchscreen0
>> -
>> -dual_camera -qws
>> -
>> -/etc/init.d/matrix-gui-2.0 start
>> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo/dual_camera_qt5.sh b/meta-arago-demos/recipes-apps/dual-camera-dem=
o/dual-camera-demo/dual_camera_qt5.sh
>> deleted file mode 100644
>> index f01bea34..00000000
>> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/=
dual_camera_qt5.sh
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -#!/bin/sh
>> -
>> -/etc/init.d/weston stop
>> -sleep 1
>> -
>> -echo 0 > /sys/class/graphics/fbcon/cursor_blink
>> -
>> -dual_camera -platform linuxfb
>> -
>> -echo 1 > /sys/class/graphics/fbcon/cursor_blink
>> -
>> -/etc/init.d/weston start
>> -sleep 1
>> diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo_1.0.bb b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camer=
a-demo_1.0.bb
>> deleted file mode 100644
>> index 157e5602..00000000
>> --- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo_=
1.0.bb
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -DESCRIPTION =3D "Qt Dual Camera Demo"
>> -HOMEPAGE =3D "https://gitorious.org/dual-camera-demo/"
>> -SECTION =3D "multimedia"
>> -LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f19=
f52eb5"
>> -
>> -DEPENDS +=3D "libdrm cmem"
>> -require recipes-core/matrix/matrix-gui-paths.inc
>> -
>> -PR =3D "r20"
>> -
>> -BRANCH =3D "master"
>> -SRCREV =3D "3188b1eacb14dda0dcf3a58877962d86687b6d20"
>> -
>> -SRC_URI =3D "git://git.ti.com/git/sitara-linux/dual-camera-demo.git;p=
rotocol=3Dhttps;branch=3D${BRANCH} \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://d=
esc_dual-camera.html \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://d=
ual_camera_qt5.sh \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://d=
ual_camera_qt4.sh \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://d=
ual-camera.desktop \
>> -"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -inherit qt5
>> -
>> -export SDK_PATH_TARGET=3D'${STAGING_DIR_HOST}'
>> -
>> -# use the make targets already created in the Makefile.build files
>> -do_install() {
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/bin
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${MATRIX_APP_DIR}/dual-camera
>> -=C2=A0=C2=A0=C2=A0 install dual_camera ${D}/usr/bin/dual_camera
>> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/dual_camera_qt5.sh ${D}/usr/bin=
/dual_camera.sh
>> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/desc_dual-camera.html ${D}/${MA=
TRIX_APP_DIR}/dual-camera
>> -=C2=A0=C2=A0=C2=A0 install ${WORKDIR}/dual-camera.desktop ${D}/${MATR=
IX_APP_DIR}/dual-camera
>> -}
>> -
>> -PACKAGES +=3D "matrix-gui-apps-dual-camera"
>> -
>> -RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
>> -
>> -RDEPENDS:matrix-gui-apps-dual-camera=C2=A0 =3D "matrix-gui-apps-image=
s matrix-gui-submenus-camera ${PN}"
>> -
>> -# Add the matrix directory to the FILES
>> -FILES:${PN} =3D "/usr/bin/*"
>> -
>> -FILES:matrix-gui-apps-dual-camera =3D "${MATRIX_APP_DIR}/*"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-multimedia.bb
>> index b4148882..ba9ac544 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-multimedia.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-multimedia.bb
>> @@ -14,16 +14,13 @@ MULTIMEDIA =3D " \
>> =C2=A0 MULTIMEDIA:omapl138 =3D ""
>> -DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl=
', 'dual-camera-demo', '', d)}"
>> =C2=A0 IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'opengl', 'image-gallery', '', d)}"
>> =C2=A0 MULTIMEDIA:append:ti43x =3D " \
>> -=C2=A0=C2=A0=C2=A0 ${DUAL_CAMERA_DEMO} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${IMAGE_GALLERY_DEMO} \
>> =C2=A0 "
>> =C2=A0 MULTIMEDIA:append:omap-a15 =3D " \
>> -=C2=A0=C2=A0=C2=A0 ${DUAL_CAMERA_DEMO} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${IMAGE_GALLERY_DEMO} \
>> =C2=A0 "
>=20
>=20
> No joy.=C2=A0 There is another reference to the recipe:
>=20
> ERROR: Nothing RPROVIDES 'matrix-gui-apps-dual-camera' (but /scratch/je=
nkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-distro/=
recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb RDEPENDS on=
 or otherwise requires it)
>=20
> Please submit a v2 and remove that from the RDEPENDS as well.
>=20

Sure, v2 sent.

Side question, "matrix gui" is starting to become a broken demo graveyard=
, do
we have plans to check on all the demos and remove/fix broken ones. Or is=
 it time
to simply remove matrix demo launcher from Arago?..

Andrew

>=20
>=20

