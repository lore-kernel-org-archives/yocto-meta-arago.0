Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B2F6052AE2
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsIHD008242
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046058;
	bh=sz5albaXiozkUE7PhD477VCJgyiYU1teo5O8k07obZQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Is32yx71S0yHnJptsKetHeHD8rrIs5lsyuSNin/ioS7Izxb1aEUtthnRWOR6U9KZT
	SdJnsHscwIZBENg71VEXNzt1cJACzsGNnKZ2/Cl7O0WtMeaCiQx5zT4y1pkMkTlQVx
	vtl0qL4NTrEo2BCzH+WbmpxE8lCoxNYLlREHj1r0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsI4Z018699
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:18 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSA013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:01 -0400
Message-ID: <1507046051-57949-14-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 13/23] matrix-gui: add X11 support
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:20 -0000
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


