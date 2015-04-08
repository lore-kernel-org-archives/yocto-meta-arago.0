Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 11C0D529CB
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:43:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38JhaO8002436
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:43:36 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JhUwq032007
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:43:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 14:43:32 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JhWYj007539;
	Wed, 8 Apr 2015 14:43:32 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yfvsp-0000YL-Ow;
	Wed, 08 Apr 2015 15:43:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Apr 2015 15:43:27 -0400
Message-ID: <1428522207-2077-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] matrix-gui: Fix QT5/eglfs conflict when matrix and gui demo run concurrently.
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
X-List-Received-Date: Wed, 08 Apr 2015 19:43:37 -0000
Content-Type: text/plain

* With QT over EGLFS, the all running QT apps will write to the
  framebuffer whenever they have updates.
* This can cause the following undesired behavior:
  - flickering when both applications try to write updates at the
    same time. For example, if a mouse is used for control, both QT
    apps will update the mouse cursor, causing flickering between both
    apps.
  - Failure for a temporary background app (e.g. matrix) to come to
    the foreground when demo exits. For example, when launching a qt
    app via remote Matrix, the demo app will persist on the target's
    display.
* To work around this, stop matrix before launching a GUI demo, and
  restart once the demo has completed.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2:
  * Fix typo with including the patch file.
  * Clear background after stopping matrix.

 ...mmand-Stop-matrix-when-running-a-GUI-demo.patch |   84 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch
new file mode 100644
index 0000000..718f6d3
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch
@@ -0,0 +1,84 @@
+From 7cbf63222897de4e9b021d8d007cca74be4ca56f Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 8 Apr 2015 07:34:22 -0400
+Subject: [PATCH] execute_command: Stop matrix when running a GUI demo.
+
+* With QT over EGLFS, all running QT apps will write to the
+  framebuffer whenever they have updates.
+* This can cause the following undesired behavior:
+  - flickering when both applications try to write updates at the
+    same time. For example, if a mouse is used for control, both QT
+    apps will update the mouse cursor, causing flickering between both
+    apps.
+  - Failure for a temporary background app (e.g. matrix) to come to
+    the foreground when demo exits. For example, when launching a qt
+    app via remote Matrix, the demo app will persist on the target's
+    display.
+* To work around this, stop matrix before launching a GUI demo, and
+  restart once the demo has completed.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ execute_command.sh |   21 +++++++++++++++++++++
+ run_script.php     |    2 +-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/execute_command.sh b/execute_command.sh
+index 018c632..c636b92 100755
+--- a/execute_command.sh
++++ b/execute_command.sh
+@@ -59,6 +59,11 @@ do
+ 	outputfilename=$item 
+   fi
+ 
++  if [ $i -eq 2 ]
++  then
++    program_type=$item
++  fi
++
+   if [ $i -gt 1 ]
+   then
+     touch "lock/"$item
+@@ -68,10 +73,26 @@ do
+ 
+ done
+ 
++if [ $program_type == gui ]
++then
++    /etc/init.d/matrix-gui-2.0 stop
++
++    chvt 4
++    echo 0 > /sys/class/graphics/fbcon/cursor_blink
++    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
++
++    refresh_screen background-black
++fi
++
+ echo "Filename:"$filename
+ echo "Output:"$outputfilename
+ eval $filename > "tmp/"$outputfilename 2>&1
+ 
++if [ $program_type == gui ]
++then
++    /etc/init.d/matrix-gui-2.0 start
++fi
++
+ #Using a more unique string to detect if the script is completed
+ echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
+ 
+diff --git a/run_script.php b/run_script.php
+index 9dd7a10..5b8351b 100644
+--- a/run_script.php
++++ b/run_script.php
+@@ -91,7 +91,7 @@ if($currently_locked==false)
+ 	$random_string = strval(rand());
+ 	$random_string .= strval(rand());
+ 
+-	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt ".$lock_list;
++	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" ".$lock_list;
+ 
+ 	$last_line = system($script_command." > /dev/null 2>/dev/null & ", $retval);
+ }
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 162340e..7cfc65e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -22,7 +22,9 @@ MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DI
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=http;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
-           file://php.ini"
+           file://php.ini \
+           ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
+"
 
 require matrix-gui-paths.inc
 
-- 
1.7.9.5


