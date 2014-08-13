Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6A3BD529C0
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 20:10:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DKALif004881
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 15:10:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DKALTG019876
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 15:10:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 13 Aug 2014 15:10:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/6] matrix-gui: Remove environment
	variables from init script
Thread-Index: AQHPty9CysCLrO/tkkSMtCexqua5b5vPRo4A//+vJuA=
Date: Wed, 13 Aug 2014 20:10:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FAF08@DFLE08.ent.ti.com>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
	<1407959172-16985-4-git-send-email-fcooper@ti.com>
	<20140813195538.GS23523@edge>
In-Reply-To: <20140813195538.GS23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/6] matrix-gui: Remove environment variables from init script
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
X-List-Received-Date: Wed, 13 Aug 2014 20:10:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You won't be able to do a global -qws since the -qws basically setups a Qt =
server and any other Qt application shouldn't use it since its technically =
a "client" to the server Qt application. And there can only be one server a=
t a time.

The rotation part should be doable.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 13, 2014 2:56 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/6] matrix-gui: Remove environment
> variables from init script
>=20
> Nice! I like how the environment variables are being standardized in to t=
he
> /etc/profile.d, which simplifies matrix startup script and allows support=
ing
> Qt4 and Qt5.
>=20
> Quick question - is there an environment variable for global -qws and/or
> display rotation, that we can put into /etc/profile.d?
>=20
> --
> Denys
>=20
>=20
> On Wed, Aug 13, 2014 at 02:46:10PM -0500, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * The environment variables located in this init script has been moved =
to
> >   scripts in various recipes,
> > * Therefore, remove setting the environment variables and also there is=
 no
> >   longer a need for separate init files (qt4 vs qt5).
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui/init            |   31 +++------
> >  .../recipes-core/matrix/matrix-gui/init-qt5        |   66 ------------=
--------
> >  .../recipes-core/matrix/matrix-gui_2.0.bb          |   15 ++---
> >  3 files changed, 16 insertions(+), 96 deletions(-)
> >  delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
> gui/init-qt5
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/me=
ta-
> arago-extras/recipes-core/matrix/matrix-gui/init
> > index dab7dc6..00e7a69 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > @@ -1,33 +1,22 @@
> >  #! /bin/sh
> >
> >  matrixgui=3D"/usr/bin/matrix_browser"
> > -ROTATION=3D__MATRIX_ROT__
> > -GUI_OPTS=3D"-qws $ROTATION http://localhost:80/"
> > +GUI_OPTS=3D"http://localhost:80/ __MATRIX_FLAGS__"
> >  PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
> >
> > -test -x "$matrixgui" || exit 0
> > +# Important System Environment Variables
> > +SCRIPTS=3D/etc/profile.d/*.sh
> > +
> > +for f in $SCRIPTS
> > +do
> > +    source $f
> > +done
> >
> > -export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> > -export QWS_MOUSE_PROTO=3DAuto
> > +test -x "$matrixgui" || exit 0
> >
> >  case "$1" in
> >    start)
> > -    chvt 4
> > -
> > -    # ARM9 devices get a lot of alignment trap errors with the current
> > -    # version of Qt (4.7.2) that we use.  The printing of these messag=
es
> > -    # is causing a severe slowdown with matrix and other Qt applicatio=
ns
> > -    # that matrix launches.  The root cause is under investigation and=
 an
> > -    # issue is being filed in the Qt JIRA tracker.  For now using the
> > -    # following command will do a software fixup of the alignment trap
> errors
> > -    # in the kernel.  This should have no impact on cortex-A8 devices.
> > -    echo 2 > /proc/cpu/alignment
> > -
> > -    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
> > -    if [ -e /dev/input/touchscreen0 ]
> > -    then
> > -        export QWS_MOUSE_PROTO=3DTslib:/dev/input/touchscreen0
> > -    fi
> > +#    chvt 4
> >
> >      #Clear out the the tmp and lock directory
> >      cd __MATRIX_WEB_DIR__
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> b/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> > deleted file mode 100644
> > index 6286028..0000000
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> > +++ /dev/null
> > @@ -1,66 +0,0 @@
> > -#! /bin/sh
> > -
> > -matrixgui=3D"/usr/bin/matrix_browser"
> > -ROTATION=3D__MATRIX_ROT__
> > -GUI_OPTS=3D"http://localhost:80/"
> > -PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
> > -
> > -test -x "$matrixgui" || exit 0
> > -
> > -export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> > -export QWS_MOUSE_PROTO=3DAuto
> > -export QT_QPA_PLATFORM=3Dwayland
> > -export XDG_RUNTIME_DIR=3D/run/user/root
> > -export WAYLAND_DISPLAY=3Dwayland-0
> > -
> > -case "$1" in
> > -  start)
> > -#    chvt 4
> > -
> > -    # ARM9 devices get a lot of alignment trap errors with the current
> > -    # version of Qt (4.7.2) that we use.  The printing of these messag=
es
> > -    # is causing a severe slowdown with matrix and other Qt applicatio=
ns
> > -    # that matrix launches.  The root cause is under investigation and=
 an
> > -    # issue is being filed in the Qt JIRA tracker.  For now using the
> > -    # following command will do a software fixup of the alignment trap
> errors
> > -    # in the kernel.  This should have no impact on cortex-A8 devices.
> > -    echo 2 > /proc/cpu/alignment
> > -
> > -    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
> > -    if [ -e /dev/input/touchscreen0 ]
> > -    then
> > -        export QWS_MOUSE_PROTO=3DTslib:/dev/input/touchscreen0
> > -    fi
> > -
> > -    #Clear out the the tmp and lock directory
> > -    cd __MATRIX_WEB_DIR__
> > -    rm -rf tmp/*
> > -    rm -rf lock/*
> > -    cd -
> > -
> > -	if [ -e $PIDFILE ]; then
> > -      PIDDIR=3D/proc/$(cat $PIDFILE)
> > -      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${matr=
ixgui}" ];
> then
> > -        echo "$DESC already started; not starting."
> > -      else
> > -        echo "Removing stale PID file $PIDFILE."
> > -        rm -f $PIDFILE
> > -      fi
> > -    fi
> > -
> > -    echo -n "Starting Matrix GUI application"
> > -    start-stop-daemon --start --quiet --background -m --pidfile $PIDFI=
LE --
> exec $matrixgui -- $GUI_OPTS
> > -    echo "."
> > -    ;;
> > -
> > -  stop)
> > -    echo -n "Stopping Matrix GUI application"
> > -    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> > -    echo "."
> > -    ;;
> > -  *)
> > -    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
> > -    exit 1
> > -esac
> > -
> > -exit 0
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > index 4cba926..72250b1 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> >
> >  SECTION =3D "multimedia"
> >
> > -PR =3D "r17"
> > +PR =3D "r18"
> >
> >  INITSCRIPT_NAME =3D "matrix-gui-2.0"
> >  INITSCRIPT_PARAMS =3D "defaults 97"
> > @@ -20,17 +20,14 @@ SRCREV =3D
> "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-
> v2.git;protocol=3Dgit;branch=3D${BRANCH} \
> >             file://init \
> > -           file://init-qt5 \
> >             file://php.ini"
> >
> >  require matrix-gui-paths.inc
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -INITFILE =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'init-qt5', 'i=
nit',
> d)}"
> > -
> > -MATRIX_ROT =3D ""
> > -MATRIX_ROT_am37x-evm =3D "-display transformed:Rot90"
> > +MATRIX_FLAGS =3D "${@base_conditional('QT_PROVIDER','qt5','','-qws',d)=
}"
> > +MATRIX_FLAGS_append_am37x-evm =3D "-display transformed:Rot90"
> >
> >  do_install(){
> >  	install -d ${D}${MATRIX_BASE_DIR}
> > @@ -41,13 +38,13 @@ do_install(){
> >  	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
> >
> >  	# Set the proper path in the init script
> > -	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D
> ${WORKDIR}/${INITFILE}
> > -	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/"
> ${WORKDIR}/${INITFILE}
> > +	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D
> ${WORKDIR}/init
> > +	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> ${WORKDIR}/init
> >
> >  	# Install the init script
> >  	# TODO: replace init script with systemd files
> >  	install -d ${D}${sysconfdir}/init.d
> > -	install -m 0755 ${WORKDIR}/${INITFILE}
> ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-
> 2.0
> >  }
> >
> >  GUIDEPS =3D "matrix-gui-browser refresh-screen"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

