Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3297D529CE
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 14:37:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HEbonq003129
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531838270;
	bh=FMvIqEAwFz4UkZ3w1Xs3QFvbi34gZB6wb1bWucuAeTI=;
	h=From:To:Subject:Date;
	b=p8/klcIKQh4eVS7VPl5Zk7WAKHXTSDgZChCDA+dJBg74izwRZ0xKJioIGberd78xm
	oFYZ6HEMJ7/1U4K8iQeMButYq032Fv6qc88PqFqBZgL0BXJO4yWbHpCOyvz2gwaqeB
	jAM2Gknemj/aM6hm/FpLzjWnY3i7iJ8sWfJMyEGI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HEbo3d032085
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 09:37:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 17 Jul 2018 09:37:49 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HEbnJH019493
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 09:37:49 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Jul 2018 10:37:33 -0400
Message-ID: <1531838254-3725-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/2] matrix_gui: enhance to support win_type qwindow
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
X-List-Received-Date: Tue, 17 Jul 2018 14:37:57 -0000
Content-Type: text/plain

This is just a tentative workaround for the Weston 2.0 display issue.
Weston should be used instead of qwindow-compositor after the Weston 2.0
display problem is fixed.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...mmand-workaround-for-GUI-apps-with-weston.patch | 139 +++++++++++++++++++++
 recipes-core/matrix/matrix-gui/qwindow             |  36 ++++++
 recipes-core/matrix/matrix-gui_2.0.bbappend        |  13 ++
 3 files changed, 188 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
 create mode 100755 recipes-core/matrix/matrix-gui/qwindow
 create mode 100644 recipes-core/matrix/matrix-gui_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
new file mode 100644
index 0000000..f5399a0
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -0,0 +1,139 @@
+From 5104914897db7ebad07d5c82302ad176bd84f4fe Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Mon, 16 Jul 2018 15:52:45 -0400
+Subject: [PATCH] execute_command: workaround for GUI apps with weston
+
+* For all GUI apps, shutdown matrix before launching
+  - This is needed since matrix is launched fullscreen, and another
+    GUI app may get hidden behind matrix with no way to recover.
+* For MM and 3D and null window apps, shutdown weston before launching
+  - These apps use KMS sink or DRM, which collides with weston
+* For qwindow window apps, use qwindow-compositor instead of weston
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ execute_command.sh | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
+ generate.php       |  4 ++++
+ run_script.php     | 10 +++++++++-
+ 3 files changed, 63 insertions(+), 2 deletions(-)
+
+diff --git a/execute_command.sh b/execute_command.sh
+index 325dcb9..9769f4f 100755
+--- a/execute_command.sh
++++ b/execute_command.sh
+@@ -63,7 +63,22 @@ do
+ 	outputfilename=$item 
+   fi
+ 
+-  if [ $i -gt 1 ]
++  if [ $i -eq 2 ]
++  then
++    program_type=$item
++  fi
++
++  if [ $i -eq 3 ]
++  then
++    category=$item
++  fi
++
++  if [ $i -eq 4 ]
++  then
++    win_type=$item
++  fi
++
++  if [ $i -gt 4 ]
+   then
+     touch "lock/"$item
+ 
+@@ -72,10 +87,44 @@ do
+ 
+ done
+ 
++if [ $program_type == gui ]
++then
++  /etc/init.d/matrix-gui-2.0 stop
++
++  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
++  then
++    /etc/init.d/weston stop
++    sleep 1
++  elif [ $win_type == qwindow ]
++  then
++    /etc/init.d/weston stop
++    sleep 1
++    /etc/init.d/qwindow start
++    sleep 1
++  fi
++fi
++
+ echo "Filename:"$filename
+ echo "Output:"$outputfilename
+ eval $filename > "tmp/"$outputfilename 2>&1
+ 
++if [ $program_type == gui ]
++then
++  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
++  then
++    /etc/init.d/weston start
++    sleep 1
++  elif [ $win_type == qwindow ]
++  then
++    /etc/init.d/qwindow stop
++    sleep 1
++    /etc/init.d/weston start
++    sleep 1
++  fi
++
++  /etc/init.d/matrix-gui-2.0 start
++fi
++
+ #Using a more unique string to detect if the script is completed
+ echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
+ 
+diff --git a/generate.php b/generate.php
+index 10cfed4..cd88dd3 100644
+--- a/generate.php
++++ b/generate.php
+@@ -105,6 +105,10 @@ for($x = 0;$x<count($contents)&&strlen($contents[$x])>0;$x++)
+ 		$top["Description_Link"] = get_contents("X-MATRIX-Description",$dotdesktop);
+ 
+ 		$top["Lock"] = get_contents("X-MATRIX-LOCK",$dotdesktop);
++
++		$top["Category"] = get_contents("Categories",$dotdesktop);
++
++		$top["WinType"] = get_contents("WinType",$dotdesktop);
+ 	} 
+ 
+ 	if($category == -1)
+diff --git a/run_script.php b/run_script.php
+index 9dd7a10..d34a286 100644
+--- a/run_script.php
++++ b/run_script.php
+@@ -55,6 +55,7 @@ $submenu = isset($_GET["submenu"]) == true ? $_GET["submenu"] : "main_menu" ;
+ $found_app = get_application($var,$submenu,$_GET["app"]);
+ 
+ $lock_list = $found_app["Lock"];
++$win_type = $found_app["WinType"];
+ 
+ //Verify that there is a lock specified for this application
+ if($lock_list != -1 )
+@@ -91,7 +92,14 @@ if($currently_locked==false)
+ 	$random_string = strval(rand());
+ 	$random_string .= strval(rand());
+ 
+-	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt ".$lock_list;
++        if($win_type != -1 )
++	{
++		$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\" \"".$found_app["WinType"]."\"  ".$lock_list;
++	}
++	else
++	{
++		$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\"  \"wayland\" ".$lock_list;
++	}
+ 
+ 	$last_line = system($script_command." > /dev/null 2>/dev/null & ", $retval);
+ }
+-- 
+1.9.1
+
diff --git a/recipes-core/matrix/matrix-gui/qwindow b/recipes-core/matrix/matrix-gui/qwindow
new file mode 100755
index 0000000..00d1d88
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/qwindow
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+
+killproc() {
+        pid=`/bin/pidof $1`
+        [ "$pid" != "" ] && kill $pid
+}
+
+read CMDLINE < /proc/cmdline
+for x in $CMDLINE; do
+        case $x in
+        qwindow=false)
+		echo "qwindow disabled"
+		exit 0;
+                ;;
+        esac
+done
+
+case "$1" in
+  start)
+	export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
+        /usr/share/qt5/examples/wayland/qwindow-compositor/qwindow-compositor -platform eglfs &
+  ;;
+
+  stop)
+        echo "Stopping qwindow"
+	export QT_QPA_EGLFS_INTEGRATION=none
+        killproc qwindow-compositor
+  ;;
+
+  *)
+        echo "usage: $0 { start | stop }"
+  ;;
+esac
+
+exit 0
diff --git a/recipes-core/matrix/matrix-gui_2.0.bbappend b/recipes-core/matrix/matrix-gui_2.0.bbappend
new file mode 100644
index 0000000..8626d1f
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui_2.0.bbappend
@@ -0,0 +1,13 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	file://qwindow \
+"
+do_install_append(){
+
+	# Install qwindow script
+	install -m 0755 ${WORKDIR}/qwindow ${D}${sysconfdir}/init.d/qwindow
+}
+
-- 
1.9.1


