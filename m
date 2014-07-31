Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6452A52972
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 19:01:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6VJ1FVk032412;
	Thu, 31 Jul 2014 14:01:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6VJ1F3M012033;
	Thu, 31 Jul 2014 14:01:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 31 Jul 2014 14:01:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2 06/11] matrix-gui: run on top of
	Wayland and	Qt5
Thread-Index: AQHPrO+aGicYNKJJLkWW+rxXCU91a5u6ia9Q
Date: Thu, 31 Jul 2014 19:01:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6EF7B0@DFLE08.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C6E9C1D@DFLE08.ent.ti.com>
	<1406832307-7965-1-git-send-email-denis@denix.org>
In-Reply-To: <1406832307-7965-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2 06/11] matrix-gui: run on top of Wayland and	Qt5
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
X-List-Received-Date: Thu, 31 Jul 2014 19:01:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Thx!

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, July 31, 2014 1:45 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2 06/11] matrix-gui: run on top of Wayland
> and Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui/init-qt5        | 66 ++++++++++++++++=
++++++
>  .../recipes-core/matrix/matrix-gui_2.0.bb          | 11 ++--
>  2 files changed, 73 insertions(+), 4 deletions(-)  create mode 100644 me=
ta-
> arago-extras/recipes-core/matrix/matrix-gui/init-qt5
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5 b/=
meta-
> arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> new file mode 100644
> index 0000000..6286028
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> @@ -0,0 +1,66 @@
> +#! /bin/sh
> +
> +matrixgui=3D"/usr/bin/matrix_browser"
> +ROTATION=3D__MATRIX_ROT__
> +GUI_OPTS=3D"http://localhost:80/"
> +PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
> +
> +test -x "$matrixgui" || exit 0
> +
> +export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> +export QWS_MOUSE_PROTO=3DAuto
> +export QT_QPA_PLATFORM=3Dwayland
> +export XDG_RUNTIME_DIR=3D/run/user/root
> +export WAYLAND_DISPLAY=3Dwayland-0
> +
> +case "$1" in
> +  start)
> +#    chvt 4
> +
> +    # ARM9 devices get a lot of alignment trap errors with the current
> +    # version of Qt (4.7.2) that we use.  The printing of these messages
> +    # is causing a severe slowdown with matrix and other Qt applications
> +    # that matrix launches.  The root cause is under investigation and a=
n
> +    # issue is being filed in the Qt JIRA tracker.  For now using the
> +    # following command will do a software fixup of the alignment trap e=
rrors
> +    # in the kernel.  This should have no impact on cortex-A8 devices.
> +    echo 2 > /proc/cpu/alignment
> +
> +    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
> +    if [ -e /dev/input/touchscreen0 ]
> +    then
> +        export QWS_MOUSE_PROTO=3DTslib:/dev/input/touchscreen0
> +    fi
> +
> +    #Clear out the the tmp and lock directory
> +    cd __MATRIX_WEB_DIR__
> +    rm -rf tmp/*
> +    rm -rf lock/*
> +    cd -
> +
> +	if [ -e $PIDFILE ]; then
> +      PIDDIR=3D/proc/$(cat $PIDFILE)
> +      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${matrix=
gui}" ]; then
> +        echo "$DESC already started; not starting."
> +      else
> +        echo "Removing stale PID file $PIDFILE."
> +        rm -f $PIDFILE
> +      fi
> +    fi
> +
> +    echo -n "Starting Matrix GUI application"
> +    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE=
 --exec
> $matrixgui -- $GUI_OPTS
> +    echo "."
> +    ;;
> +
> +  stop)
> +    echo -n "Stopping Matrix GUI application"
> +    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-
> arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 523cfe1..4cba926 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
>=20
>  SECTION =3D "multimedia"
>=20
> -PR =3D "r16"
> +PR =3D "r17"
>=20
>  INITSCRIPT_NAME =3D "matrix-gui-2.0"
>  INITSCRIPT_PARAMS =3D "defaults 97"
> @@ -20,12 +20,15 @@ SRCREV =3D
> "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-
> v2.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://init \
> +           file://init-qt5 \
>             file://php.ini"
>=20
>  require matrix-gui-paths.inc
>=20
>  S =3D "${WORKDIR}/git"
>=20
> +INITFILE =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'init-qt5', 'ini=
t', d)}"
> +
>  MATRIX_ROT =3D ""
>  MATRIX_ROT_am37x-evm =3D "-display transformed:Rot90"
>=20
> @@ -38,13 +41,13 @@ do_install(){
>  	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
>=20
>  	# Set the proper path in the init script
> -	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D
> ${WORKDIR}/init
> -	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/init
> +	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D
> ${WORKDIR}/${INITFILE}
> +	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/"
> ${WORKDIR}/${INITFILE}
>=20
>  	# Install the init script
>  	# TODO: replace init script with systemd files
>  	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
> +	install -m 0755 ${WORKDIR}/${INITFILE}
> +${D}${sysconfdir}/init.d/matrix-gui-2.0
>  }
>=20
>  GUIDEPS =3D "matrix-gui-browser refresh-screen"
> --
> 2.0.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

