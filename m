Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 65F6F52B0E
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINe6O018715
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709420;
	bh=sz5albaXiozkUE7PhD477VCJgyiYU1teo5O8k07obZQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kNeuEDbWAz6fodfbP/7M6hi8NR9nxP7yCOrw6fT+gE1wADj7LF5VKoTuwZ8JqQhZL
	MuwZQJk6pPps05w32zmWr8zDNQGZvsO+8oBeT0IgSHeOMYnOqpuWclj5arK5wnRJ7l
	O/UZkRHSXigOkRjiU4lT8dkaQhSohotQ1KPO3ZbE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINZrN010419
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:35 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8c006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:17 -0400
Message-ID: <1506709407-16448-14-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 13/matrix-gui: add X11 support
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:53 -0000
Content-Type: text/plain

For X11:
- use the same init script as wayland build
- the execute_command patch is slightly different from the one for eglfs

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...mand-X11-Stop-matrix-when-running-a-GUI-d.patch | 83 ++++++++++++++++++++++
 recipes-core/matrix/matrix-gui_2.0.bbappend        | 12 +++-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100755 recipes-core/matrix/matrix-gui/0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch

diff --git a/recipes-core/matrix/matrix-gui/0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch b/recipes-core/matrix/matrix-gui/0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch
new file mode 100755
index 0000000..55fcfa8
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui/0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch
@@ -0,0 +1,83 @@
+From b76bc81267544fa4397bdf421e6a259514b85f75 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 19 Sep 2017 10:00:12 -0400
+Subject: [PATCH] execute_command(X11): Stop matrix when running a GUI demo.
+
+* With QT over EGLFS.X11, all running QT apps will write to the
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
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ execute_command.sh | 19 +++++++++++++++++++
+ run_script.php     |  2 +-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/execute_command.sh b/execute_command.sh
+index 325dcb9..a9fd7df 100755
+--- a/execute_command.sh
++++ b/execute_command.sh
+@@ -63,6 +63,11 @@ do
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
+@@ -72,10 +77,24 @@ do
+ 
+ done
+ 
++if [ $program_type == gui ]
++then
++    /etc/init.d/matrix-gui-2.0 stop
++
++    echo 0 > /sys/class/graphics/fbcon/cursor_blink
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
+1.9.1
+
diff --git a/recipes-core/matrix/matrix-gui_2.0.bbappend b/recipes-core/matrix/matrix-gui_2.0.bbappend
index 1cc5c0a..8f3a03a 100644
--- a/recipes-core/matrix/matrix-gui_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui_2.0.bbappend
@@ -1,5 +1,15 @@
-PR_append = ".tisdk2"
+PR_append = ".tisdk3"
 
 SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5',['init.eglfs','init'][bb.utils.contains('MACHINE_FEATURES','xsgx',True,False,d) or bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)], 'init', d)}"
+
+SRC_URI_remove = " \
+           ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', '', d)} \
+"
+
+SRC_URI_append = " \
+           ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'file://0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch', '', d)} \
+"
-- 
1.9.1


