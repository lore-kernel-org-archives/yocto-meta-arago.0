Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 08E4552A0B
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 15:43:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HFhQRX002781
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:43:26 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HFhOT9013244
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:43:25 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 10:43:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-gui: Clear background when
	starting and	stopping matrix.
Thread-Index: AQHQYMA+PdcwhuW2fEqsLR+YCLSIFp0gzjQw
Date: Tue, 17 Mar 2015 15:43:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C848EA5@DFLE08.ent.ti.com>
References: <1426603161-11566-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1426603161-11566-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-gui: Clear background when starting and	stopping matrix.
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
X-List-Received-Date: Tue, 17 Mar 2015 15:43:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Overall by modifying this init script your making changes that are only nee=
ded for Qt 5 eglfs users. Users can use Qt 4 and Qt 5 Wayland which this pa=
tch may cause problems for.

Honestly your probably better off duplicating this init script and making a=
 Qt 5 eglfs variant since there seems to be a significant amount of tweaks.=
 Then select which init you want based on if Qt 5 is being used and if Wayl=
and is being used.


Additional comments below.
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Tuesday, March 17, 2015 9:39 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] matrix-gui: Clear background when starting
> and stopping matrix.
>=20
> * Clearing the background is done by calling refresh_screen with the
>   "background-black" argument.
> * Always switch virtual terminals so that command prompt will be visible
>   upon exiting matrix.
> * Disable blinking cursor while matrix is running, re-enable when stoppin=
g
>   matrix.
>     - When using qt over eglfs, the blinking cursor will show through the
>       gui.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui/init            |   10 +++++++++-
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta=
-
> arago-extras/recipes-core/matrix/matrix-gui/init
> index 3ec0a55..9f0507f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -16,7 +16,7 @@ test -x "$matrixgui" || exit 0
>=20
>  case "$1" in
>    start)
> -    __SWITCH_FOREGROUND_VT__
> +    chvt 4
[Franklin] I don't understand why you're getting rid of __SWITCH_FOREGROUND=
_VT__ when its sole purpose is to give you the flexibility. Your hard codin=
g rather than using the variable which can end up causing problems for Wayl=
and. Just use the variable.
>=20
>      #Clear out the the tmp and lock directory
>      cd __MATRIX_WEB_DIR__
> @@ -34,6 +34,9 @@ case "$1" in
>        fi
>      fi
>=20
> +    echo 0 > /sys/class/graphics/fbcon/cursor_blink
> +    refresh_screen "background-black"
[Franklin] This isn't needed. Matrix GUI gets displayed full screen so ther=
e is no need for refresh screen.
> +
>      echo -n "Starting Matrix GUI application"
>      start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE=
 --exec
> $matrixgui -- $GUI_OPTS
>      echo "."
> @@ -42,6 +45,11 @@ case "$1" in
>    stop)
>      echo -n "Stopping Matrix GUI application"
>      start-stop-daemon --stop --quiet --pidfile $PIDFILE
> +
> +    refresh_screen "background-black"
> +    echo 1 > /sys/class/graphics/fbcon/cursor_blink
> +    chvt 1
> +
>      echo "."
>      ;;
>    *)
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 1b61ff1..b4161ff 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
>=20
>  SECTION =3D "multimedia"
>=20
> -PR =3D "r21"
> +PR =3D "r22"
>=20
>  INITSCRIPT_NAME =3D "matrix-gui-2.0"
>  INITSCRIPT_PARAMS =3D "defaults 97"
> @@ -27,7 +27,6 @@ require matrix-gui-paths.inc  S =3D "${WORKDIR}/git"
>=20
>  MATRIX_FLAGS =3D "${@base_conditional('QT_PROVIDER','qt5','','-qws',d)}"
> -SWITCH_FOREGROUND_VT =3D
> "${@base_conditional('QT_PROVIDER','qt5','','chvt 4',d)}"
>  do_install(){
>  	install -d ${D}${MATRIX_BASE_DIR}
>  	install -d ${D}${MATRIX_WEB_DIR}
> @@ -39,7 +38,6 @@ do_install(){
>  	# Set the proper path in the init script
>  	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D
> ${WORKDIR}/init
>  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> ${WORKDIR}/init
> -	sed -i -e
> "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> ${WORKDIR}/init
>=20
>  	# Install the init script
>  	# TODO: replace init script with systemd files
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

