Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8B9F5529C6
	for <meta-arago@arago-project.org>;
	Tue,  7 Apr 2015 19:27:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t37JRBFl030257
	for <meta-arago@arago-project.org>; Tue, 7 Apr 2015 14:27:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t37JRAB4024632
	for <meta-arago@arago-project.org>; Tue, 7 Apr 2015 14:27:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 14:27:10 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t37JRAOX027597;	Tue, 7 Apr 2015 14:27:10 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YfZ9S-0003HI-0C;
	Tue, 07 Apr 2015 15:27:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Apr 2015 15:27:07 -0400
Message-ID: <1428434827-12570-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: Fix QT5/eglfs conflict when matrix and gui demo run concurrently.
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
X-List-Received-Date: Tue, 07 Apr 2015 19:27:12 -0000
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
 ...mmand-Stop-matrix-when-running-a-GUI-demo.patch |   81 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch
new file mode 100644
index 0000000..6357b2c
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch
@@ -0,0 +1,81 @@
+From e3e82c122184f3411bb442f1fa86dffc3a692bc1 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Tue, 7 Apr 2015 15:03:48 -0400
+Subject: [PATCH] execute_command: Stop matrix when running a GUI demo.
+
+* With QT over EGLFS, the all running QT apps will write to the
+  framebuffer whenever they have updates.
+* This can cause the following undesired behavior:
+  - flickering when boths applications try to write updates at the
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
+ execute_command.sh |   18 ++++++++++++++++++
+ run_script.php     |    2 +-
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/execute_command.sh b/execute_command.sh
+index 018c632..4b69600 100755
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
+@@ -68,10 +73,23 @@ do
+ 
+ done
+ 
++if [ $program_type == gui ]
++then
++    /etc/init.d/matrix-gui-2.0 stop
++
++    echo 0 > /sys/class/graphics/fbcon/cursor_blink
++    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
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
index 162340e..e643f88 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -22,7 +22,9 @@ MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DI
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=http;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
-           file://php.ini"
+           file://php.ini \
+           ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', "file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
+"
 
 require matrix-gui-paths.inc
 
-- 
1.7.9.5


