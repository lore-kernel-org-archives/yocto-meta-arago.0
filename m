Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 94D4B52981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:55:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJtdn2013028
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:55:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJtdMi008103
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:55:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:55:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJtdPd012575;
	Wed, 13 Aug 2014 14:55:39 -0500
Date: Wed, 13 Aug 2014 15:55:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140813195538.GS23523@edge>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
	<1407959172-16985-4-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407959172-16985-4-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Wed, 13 Aug 2014 19:55:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nice! I like how the environment variables are being standardized in to the 
/etc/profile.d, which simplifies matrix startup script and allows supporting 
Qt4 and Qt5.

Quick question - is there an environment variable for global -qws and/or 
display rotation, that we can put into /etc/profile.d?

-- 
Denys


On Wed, Aug 13, 2014 at 02:46:10PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * The environment variables located in this init script has been moved to
>   scripts in various recipes,
> * Therefore, remove setting the environment variables and also there is no
>   longer a need for separate init files (qt4 vs qt5).
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui/init            |   31 +++------
>  .../recipes-core/matrix/matrix-gui/init-qt5        |   66 --------------------
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |   15 ++---
>  3 files changed, 16 insertions(+), 96 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> index dab7dc6..00e7a69 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -1,33 +1,22 @@
>  #! /bin/sh
>  
>  matrixgui="/usr/bin/matrix_browser"
> -ROTATION=__MATRIX_ROT__
> -GUI_OPTS="-qws $ROTATION http://localhost:80/"
> +GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
> -test -x "$matrixgui" || exit 0
> +# Important System Environment Variables
> +SCRIPTS=/etc/profile.d/*.sh
> +
> +for f in $SCRIPTS
> +do
> +    source $f
> +done
>  
> -export TSLIB_TSDEVICE=/dev/input/touchscreen0
> -export QWS_MOUSE_PROTO=Auto
> +test -x "$matrixgui" || exit 0
>  
>  case "$1" in
>    start)
> -    chvt 4
> -
> -    # ARM9 devices get a lot of alignment trap errors with the current
> -    # version of Qt (4.7.2) that we use.  The printing of these messages
> -    # is causing a severe slowdown with matrix and other Qt applications
> -    # that matrix launches.  The root cause is under investigation and an
> -    # issue is being filed in the Qt JIRA tracker.  For now using the
> -    # following command will do a software fixup of the alignment trap errors
> -    # in the kernel.  This should have no impact on cortex-A8 devices.
> -    echo 2 > /proc/cpu/alignment
> -
> -    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
> -    if [ -e /dev/input/touchscreen0 ]
> -    then
> -        export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> -    fi
> +#    chvt 4
>  
>      #Clear out the the tmp and lock directory
>      cd __MATRIX_WEB_DIR__
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5 b/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> deleted file mode 100644
> index 6286028..0000000
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init-qt5
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -#! /bin/sh
> -
> -matrixgui="/usr/bin/matrix_browser"
> -ROTATION=__MATRIX_ROT__
> -GUI_OPTS="http://localhost:80/"
> -PIDFILE="/var/run/matrix-gui-2.0.pid"
> -
> -test -x "$matrixgui" || exit 0
> -
> -export TSLIB_TSDEVICE=/dev/input/touchscreen0
> -export QWS_MOUSE_PROTO=Auto
> -export QT_QPA_PLATFORM=wayland
> -export XDG_RUNTIME_DIR=/run/user/root
> -export WAYLAND_DISPLAY=wayland-0
> -
> -case "$1" in
> -  start)
> -#    chvt 4
> -
> -    # ARM9 devices get a lot of alignment trap errors with the current
> -    # version of Qt (4.7.2) that we use.  The printing of these messages
> -    # is causing a severe slowdown with matrix and other Qt applications
> -    # that matrix launches.  The root cause is under investigation and an
> -    # issue is being filed in the Qt JIRA tracker.  For now using the
> -    # following command will do a software fixup of the alignment trap errors
> -    # in the kernel.  This should have no impact on cortex-A8 devices.
> -    echo 2 > /proc/cpu/alignment
> -
> -    # Set the QWS_MOUSE_PROTO for touchscreen if it exists
> -    if [ -e /dev/input/touchscreen0 ]
> -    then
> -        export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> -    fi
> -
> -    #Clear out the the tmp and lock directory
> -    cd __MATRIX_WEB_DIR__
> -    rm -rf tmp/*
> -    rm -rf lock/*
> -    cd -
> -
> -	if [ -e $PIDFILE ]; then
> -      PIDDIR=/proc/$(cat $PIDFILE)
> -      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${matrixgui}" ]; then
> -        echo "$DESC already started; not starting."
> -      else
> -        echo "Removing stale PID file $PIDFILE."
> -        rm -f $PIDFILE
> -      fi
> -    fi
> -
> -    echo -n "Starting Matrix GUI application"
> -    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
> -    echo "."
> -    ;;
> -
> -  stop)
> -    echo -n "Stopping Matrix GUI application"
> -    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 4cba926..72250b1 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r17"
> +PR = "r18"
>  
>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> @@ -20,17 +20,14 @@ SRCREV = "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
>  
>  SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
>             file://init \
> -           file://init-qt5 \
>             file://php.ini"
>  
>  require matrix-gui-paths.inc
>  
>  S = "${WORKDIR}/git"
>  
> -INITFILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'init-qt5', 'init', d)}"
> -
> -MATRIX_ROT = ""
> -MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
> +MATRIX_FLAGS = "${@base_conditional('QT_PROVIDER','qt5','','-qws',d)}"
> +MATRIX_FLAGS_append_am37x-evm = "-display transformed:Rot90"
>  
>  do_install(){
>  	install -d ${D}${MATRIX_BASE_DIR}
> @@ -41,13 +38,13 @@ do_install(){
>  	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
>  
>  	# Set the proper path in the init script
> -	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/${INITFILE}
> -	sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/${INITFILE}
> +	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
> +	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/init
>  
>  	# Install the init script
>  	# TODO: replace init script with systemd files
>  	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/${INITFILE} ${D}${sysconfdir}/init.d/matrix-gui-2.0
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
>  }
>  
>  GUIDEPS = "matrix-gui-browser refresh-screen"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

