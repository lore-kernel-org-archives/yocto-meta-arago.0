Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 71646529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:32:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EWbL7004934
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:32:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EWbww007954
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:32:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:32:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 05/11] matrix-gui: Add camera submenu
Thread-Index: AQHPe2004bkB0ETqs0+0ZZPRHSOqVJthDKDA
Date: Wed, 4 Jun 2014 14:32:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C1E8@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 05/11] matrix-gui: Add camera submenu
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
X-List-Received-Date: Wed, 04 Jun 2014 14:32:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, May 29, 2014 1:38 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 05/11] matrix-gui: Add camera submenu
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    5 +++--
> 2 files changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-git.inc
>index fe4b3f0..c985859 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>git.inc
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>git.inc
>@@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
>"LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>
> SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
>apps.git;protocol=3Dgit;branch=3D${BRANCH}"
>-SRCREV =3D "ea1592722e9b00a6324d031af1fa23a3683ff7a6"
>+SRCREV =3D "6ba41c4070cbc723d758f5d493859ae6470cdceb"
> BRANCH =3D "master"
>-INC_PR =3D "r22"
>+INC_PR =3D "r23"
>
> # Pull in the base package for installing matrix applications
> require matrix-gui-apps.inc
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-
>gui-submenus_2.0.bb
>index d108500..d794277 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>submenus_2.0.bb
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>submenus_2.0.bb
>@@ -8,7 +8,7 @@ require matrix-gui-apps-git.inc
> # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-
>git.inc file
> LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>
>-PR =3D "${INC_PR}.9"
>+PR =3D "${INC_PR}.10"

Just a nit, but if you bumped the INC_PR already then do you really need to=
 bump this PR?  I don't think this is worth submitting a v2 for though.

>
> # These packages make submenus in matrix and are not architecture
>specific
> inherit allarch
>@@ -27,7 +27,7 @@ do_install(){
>     done
> }
>
>-PACKAGES +=3D "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
>${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
>${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
>+PACKAGES +=3D "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display
>${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4
>${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera"
>
> # Make sure app images has been installed
> RDEPENDS_${PN} +=3D "matrix-gui-apps-images"
>@@ -46,3 +46,4 @@ FILES_${PN}-settings =3D
>"${MATRIX_APP_DIR}/settings_submenu/*"
> FILES_${PN}-usb =3D "${MATRIX_APP_DIR}/usb_submenu/*"
> FILES_${PN}-wifi =3D "${MATRIX_APP_DIR}/wifi_submenu/*"
> FILES_${PN}-oprofile =3D "${MATRIX_APP_DIR}/oprofile_submenu/*"
>+FILES_${PN}-camera =3D "${MATRIX_APP_DIR}/camera_submenu/*"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

