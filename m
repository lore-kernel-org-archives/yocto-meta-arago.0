Return-Path: <hzhang@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9DF305297F
	for <meta-arago@arago-project.org>;
	Mon, 20 Apr 2015 20:30:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3KKUAQp006623
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 15:30:10 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KKU7hS031169
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 15:30:08 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 20 Apr 2015 15:30:02 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [Re-submit: V2] matrix-gui-apps: add utilities
	demo apps for Keystone devices
Thread-Index: AQHQeUlVImeEYJgh0km4v1xwZaAbsJ1WXRHwgABVWAD//6xIUA==
Date: Mon, 20 Apr 2015 20:30:01 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63F99C464@DLEE09.ent.ti.com>
References: <1429300904-28993-1-git-send-email-hzhang@ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63F99C42B@DLEE09.ent.ti.com>
	<20150420202837.GG23723@edge>
In-Reply-To: <20150420202837.GG23723@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [Re-submit: V2] matrix-gui-apps: add utilities demo apps for Keystone devices
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
X-List-Received-Date: Mon, 20 Apr 2015 20:30:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore V1, it's not a valid version for review.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, April 20, 2015 4:29 PM
To: Zhang, Hao
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [Re-submit: V2] matrix-gui-apps: add utilities de=
mo apps for Keystone devices

Is this v2 of the last week's matrix-gui-apps utilities patch? What was the=
 change between v1 and v2? Please provide a short log next time.


On Mon, Apr 20, 2015 at 08:23:38PM +0000, Zhang, Hao wrote:
> Ping.
>=20
> -----Original Message-----
> From: Zhang, Hao=20
> Sent: Friday, April 17, 2015 4:02 PM
> To: meta-arago@arago-project.org
> Cc: Zhang, Hao
> Subject: [Re-submit: V2] matrix-gui-apps: add utilities demo apps for Key=
stone devices
>=20
> From: Hao Zhang <hzhang@ti.com>
>=20
> The utilities demo includes PHP based utility apps to read/write I2C EEPR=
OM and Nand Flash, write root filesystem, and display SoC specific info and=
 statistics.
>=20
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    4 +++
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    7 ++--
>  .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    7 ++--
>  .../matrix/matrix-gui-utility-demos_2.0.bb         |   34 ++++++++++++++=
++++++
>  4 files changed, 46 insertions(+), 6 deletions(-)  create mode 100644 me=
ta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-matrix.bb
> index a006c52..6c58b6f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-matrix.bb
> @@ -125,6 +125,10 @@ MATRIX_APPS_append_am180x-evm =3D "   \
>      matrix-gui-pru-demos            \
>  "
> =20
> +MATRIX_APPS_append_keystone =3D " \
> +    matrix-gui-utility-demos	\
> +"
> +
>  RDEPENDS_${PN} =3D "        \
>      ${MATRIX_ESSENTIALS}  \
>      ${MATRIX_GUI}         \
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 0d2d8c2..73e92ac 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -5,10 +5,11 @@ LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> =20
>  DEPENDS +=3D "ca-certificates-native"
> =20
> -SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;pr=
otocol=3Dhttp;branch=3D${BRANCH}"
> -SRCREV =3D "200426006a3ae68bde9d7eb6a864da51fe07298c"
> +SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> +SRCREV =3D "7a3fb05dfb49b144cb149b31cbc9d452975ddfcd"
>  BRANCH =3D "master"
> -INC_PR =3D "r31"
> +INC_PR =3D "r32"
> +
> =20
>  # Pull in the base package for installing matrix applications  require m=
atrix-gui-apps.inc diff --git a/meta-arago-extras/recipes-core/matrix/matri=
x-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-su=
bmenus_2.0.bb
> index 787a934..250694d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> @@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc  # reset the LIC_FILES_CH=
KSUM setting from the matrix-gui-apps-git.inc file  LIC_FILES_CHKSUM =3D "f=
ile://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> =20
> -PR =3D "${INC_PR}.11"
> +PR =3D "${INC_PR}.12"
> =20
>  # These packages make submenus in matrix and are not architecture specif=
ic  inherit allarch @@ -15,7 +15,7 @@ inherit allarch  S =3D "${WORKDIR}/gi=
t"
> =20
>  # List of submenus to build packages for -SUBMENUS =3D "arm_submenu 3d_s=
ubmenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu =
power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_sub=
menu oprofile_submenu"
> +SUBMENUS =3D "arm_submenu 3d_submenu cryptos_submenu display_submenu eth=
ernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu sett=
ings_submenu usb_submenu wifi_submenu oprofile_submenu utilities_submenu"
> =20
>  do_install(){
>      install -d ${D}${MATRIX_APP_DIR}
> @@ -26,7 +26,7 @@ do_install(){
>      done
>  }
> =20
> -PACKAGES +=3D "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethe=
rnet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-setti=
ngs ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera"
> +PACKAGES +=3D "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethe=
rnet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-setti=
ngs ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera  ${PN}-utility"
> =20
>  # Make sure app images has been installed  RDEPENDS_${PN} +=3D "matrix-g=
ui-apps-images"
> @@ -47,3 +47,4 @@ FILES_${PN}-usb =3D "${MATRIX_APP_DIR}/usb_submenu/*"
>  FILES_${PN}-wifi =3D "${MATRIX_APP_DIR}/wifi_submenu/*"
>  FILES_${PN}-oprofile =3D "${MATRIX_APP_DIR}/oprofile_submenu/*"
>  FILES_${PN}-camera =3D "${MATRIX_APP_DIR}/camera_submenu/*"
> +FILES_${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-dem=
os_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_=
2.0.bb
> new file mode 100644
> index 0000000..2c4890d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0
> +++ .bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Keystone utility app demo descriptions for Matrix v2"
> +HOMEPAGE =3D "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
> +
> +require matrix-gui-apps-git.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S =3D "${WORKDIR}/git/utilities_apps"
> +
> +do_install_prepend(){
> +   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
> +   cp -rf ${S}/utility_eeprom/eeprom ${D}${MATRIX_BASE_DIR}/html-apps/
> +   cp -rf ${S}/utility_flash/flash ${D}${MATRIX_BASE_DIR}/html-apps/
> +   cp -rf ${S}/utility_filesystem/filesystem ${D}${MATRIX_BASE_DIR}/html=
-apps/
> +   cp -rf ${S}/utility_info/info ${D}${MATRIX_BASE_DIR}/html-apps/
> +   cp -rf ${S}/utility_stats/stats ${D}${MATRIX_BASE_DIR}/html-apps/ }
> +
> +do_install_append(){
> +    rm ${D}${MATRIX_APP_DIR}/utility_eeprom/eeprom-utility.php
> +    rm ${D}${MATRIX_APP_DIR}/utility_flash/flash-utility.php
> +    rm ${D}${MATRIX_APP_DIR}/utility_filesystem/filesystem-utility.php
> +    rm ${D}${MATRIX_APP_DIR}/utility_info/info-utility.php
> +    rm ${D}${MATRIX_APP_DIR}/utility_stats/stats-utility.php
> +}
> +
> +# Make sure utility submenu and app images has been installed.
> +RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-utility"
> +
> +FILES_${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
> +                ${MATRIX_BASE_DIR}/apps/ \ "
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

