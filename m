Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5649852099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 15:20:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JFKHPL021509
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:20:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JFKGaP003551
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 10:20:16 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 19 Mar 2015 10:20:16 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH v2] matrix-gui: Clear background when starting and
	stopping matrix.
Thread-Index: AQHQYlb+DgIrRzAmlU2GmbYlUeGlep0j64zw
Date: Thu, 19 Mar 2015 15:20:16 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410FDE0@DFLE09.ent.ti.com>
References: <1426777891-22340-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1426777891-22340-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 19 Mar 2015 15:20:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore. Syntax error on nested base_conditional/base_contains call.

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Thursday, March 19, 2015 11:12 AM
To: meta-arago@arago-project.org
Cc: Stiffler, Jacob
Subject: [PATCH v2] matrix-gui: Clear background when starting and stopping=
 matrix.

* Clearing the background is done by calling refresh_screen with the
  "background-black" argument.
* Switch virtual terminals so that command prompt will be visible upon
  exiting matrix.
* Disable blinking cursor while matrix is running, re-enable when stopping
  matrix.
    - When using qt over eglfs, the blinking cursor will show through the
      gui.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Create a seperate init script when using qt5 without wayland.

 .../recipes-core/matrix/matrix-gui/init.eglfs      |   60 ++++++++++++++++=
++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   14 +++--
 2 files changed, 68 insertions(+), 6 deletions(-)  create mode 100644 meta=
-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/=
meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
new file mode 100644
index 0000000..9f0507f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
@@ -0,0 +1,60 @@
+#! /bin/sh
+
+matrixgui=3D"/usr/bin/matrix_browser"
+GUI_OPTS=3D"http://localhost:80/ __MATRIX_FLAGS__"
+PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
+
+# Important System Environment Variables SCRIPTS=3D/etc/profile.d/*.sh
+
+for f in $SCRIPTS
+do
+    source $f
+done
+
+test -x "$matrixgui" || exit 0
+
+case "$1" in
+  start)
+    chvt 4
+
+    #Clear out the the tmp and lock directory
+    cd __MATRIX_WEB_DIR__
+    rm -rf tmp/*
+    rm -rf lock/*
+    cd -
+
+	if [ -e $PIDFILE ]; then
+      PIDDIR=3D/proc/$(cat $PIDFILE)
+      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${matrixgu=
i}" ]; then
+        echo "$DESC already started; not starting."
+      else
+        echo "Removing stale PID file $PIDFILE."
+        rm -f $PIDFILE
+      fi
+    fi
+
+    echo 0 > /sys/class/graphics/fbcon/cursor_blink
+    refresh_screen "background-black"
+
+    echo -n "Starting Matrix GUI application"
+    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE -=
-exec $matrixgui -- $GUI_OPTS
+    echo "."
+    ;;
+
+  stop)
+    echo -n "Stopping Matrix GUI application"
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
+
+    refresh_screen "background-black"
+    echo 1 > /sys/class/graphics/fbcon/cursor_blink
+    chvt 1
+
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta=
-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 8843521..1874f85 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d82=
71115d2502512e5d"
=20
 SECTION =3D "multimedia"
=20
-PR =3D "r22"
+PR =3D "r23"
=20
 INITSCRIPT_NAME =3D "matrix-gui-2.0"
 INITSCRIPT_PARAMS =3D "defaults 97"
@@ -18,8 +18,10 @@ inherit update-rc.d
 BRANCH ?=3D "master"
 SRCREV =3D "d65a5e1d178bb30653f16322bebf7e7ee530d613"
=20
+MATRIX_INITSCRIPT =3D "${@base_conditional('QT_PROVIDER','qt5', ${@base_co=
ntains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d)}, 'init', d)}=
"
+
 SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=
=3Dhttp;branch=3D${BRANCH} \
-           file://init \
+           file://${MATRIX_INITSCRIPT} \
            file://php.ini"
=20
 require matrix-gui-paths.inc
@@ -37,14 +39,14 @@ do_install(){
 	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
=20
 	# Set the proper path in the init script
-	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D ${WORKDIR}/init
-	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/init
-	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR=
}/init
+	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D ${WORKDIR}/${MATR=
IX_INITSCRIPT}
+	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_I=
NITSCRIPT}
+	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"=20
+${WORKDIR}/${MATRIX_INITSCRIPT}
=20
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
+	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}=20
+${D}${sysconfdir}/init.d/matrix-gui-2.0
 }
=20
 GUIDEPS =3D "matrix-gui-browser refresh-screen"
--
1.7.9.5


