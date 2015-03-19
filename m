Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1A0AD52099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 15:27:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JFRgNH002877
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:27:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JFRfRQ001928
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:27:41 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 19 Mar 2015 10:27:41 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] matrix-gui: Clear background when
	starting and stopping matrix.
Thread-Index: AQHQYlg466Fg8259gkCnoQ67k27Szp0j7ck4
Date: Thu, 19 Mar 2015 15:27:40 +0000
Message-ID: <0C47B454-B85C-4804-AA08-13088AE87936@ti.com>
References: <1426777891-22340-1-git-send-email-j-stiffler@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581410FDE0@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581410FDE0@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] matrix-gui: Clear background when starting and stopping matrix.
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
X-List-Received-Date: Thu, 19 Mar 2015 15:27:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 19, 2015, at 10:20 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Please ignore. Syntax error on nested base_conditional/base_contains call=
.
>=20
> -----Original Message-----
> From: Stiffler, Jacob=20
> Sent: Thursday, March 19, 2015 11:12 AM
> To: meta-arago@arago-project.org
> Cc: Stiffler, Jacob
> Subject: [PATCH v2] matrix-gui: Clear background when starting and stoppi=
ng matrix.
>=20
> * Clearing the background is done by calling refresh_screen with the
>  "background-black" argument.
> * Switch virtual terminals so that command prompt will be visible upon
>  exiting matrix.
> * Disable blinking cursor while matrix is running, re-enable when stoppin=
g
>  matrix.
>    - When using qt over eglfs, the blinking cursor will show through the
>      gui.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2: Create a seperate init script when using qt5 without wayland.
>=20
> .../recipes-core/matrix/matrix-gui/init.eglfs      |   60 +++++++++++++++=
+++++
> .../recipes-core/matrix/matrix-gui_2.0.bb          |   14 +++--
> 2 files changed, 68 insertions(+), 6 deletions(-)  create mode 100644 met=
a-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs =
b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> new file mode 100644
> index 0000000..9f0507f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> @@ -0,0 +1,60 @@
> +#! /bin/sh
> +
> +matrixgui=3D"/usr/bin/matrix_browser"
> +GUI_OPTS=3D"http://localhost:80/ __MATRIX_FLAGS__"
> +PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
> +
> +# Important System Environment Variables SCRIPTS=3D/etc/profile.d/*.sh
> +
> +for f in $SCRIPTS
> +do
> +    source $f
> +done
> +
> +test -x "$matrixgui" || exit 0
> +
> +case "$1" in
> +  start)
> +    chvt 4
> +
> +    #Clear out the the tmp and lock directory
> +    cd __MATRIX_WEB_DIR__
> +    rm -rf tmp/*
> +    rm -rf lock/*
> +    cd -
> +
> +    if [ -e $PIDFILE ]; then
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
> +    echo 0 > /sys/class/graphics/fbcon/cursor_blink
> +    refresh_screen "background-black"
I'm pretty sure this has no purpose. Matrix itself will update the frame bu=
ffer.
> +
> +    echo -n "Starting Matrix GUI application"
> +    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE=
 --exec $matrixgui -- $GUI_OPTS
> +    echo "."
> +    ;;
> +
> +  stop)
> +    echo -n "Stopping Matrix GUI application"
> +    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> +
> +    refresh_screen "background-black"
> +    echo 1 > /sys/class/graphics/fbcon/cursor_blink
> +    chvt 1
> +
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 8843521..1874f85 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d=
8271115d2502512e5d"
>=20
> SECTION =3D "multimedia"
>=20
> -PR =3D "r22"
> +PR =3D "r23"
>=20
> INITSCRIPT_NAME =3D "matrix-gui-2.0"
> INITSCRIPT_PARAMS =3D "defaults 97"
> @@ -18,8 +18,10 @@ inherit update-rc.d
> BRANCH ?=3D "master"
> SRCREV =3D "d65a5e1d178bb30653f16322bebf7e7ee530d613"
>=20
> +MATRIX_INITSCRIPT =3D "${@base_conditional('QT_PROVIDER','qt5', ${@base_=
contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d)}, 'init', d=
)}"
> +
> SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=
=3Dhttp;branch=3D${BRANCH} \
> -           file://init \
> +           file://${MATRIX_INITSCRIPT} \
>            file://php.ini"
>=20
> require matrix-gui-paths.inc
> @@ -37,14 +39,14 @@ do_install(){
>    install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/

You can avoid all of the below changes if you simply renamed the init scrip=
t here.

>    # Set the proper path in the init script
> -    sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D ${WORKDIR}/i=
nit
> -    sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/init
> -    sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WO=
RKDIR}/init
> +    sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D ${WORKDIR}/$=
{MATRIX_INITSCRIPT}
> +    sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MAT=
RIX_INITSCRIPT}
> +    sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"=20
> +${WORKDIR}/${MATRIX_INITSCRIPT}
>=20
>    # Install the init script
>    # TODO: replace init script with systemd files
>    install -d ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-=
2.0
> +    install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}=20
> +${D}${sysconfdir}/init.d/matrix-gui-2.0
> }
>=20
> GUIDEPS =3D "matrix-gui-browser refresh-screen"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

