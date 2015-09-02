Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C5D2252A14
	for <meta-arago@arago-project.org>;
	Wed,  2 Sep 2015 14:55:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t82EtXXW007853
	for <meta-arago@arago-project.org>; Wed, 2 Sep 2015 09:55:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t82EtXUU018274
	for <meta-arago@arago-project.org>; Wed, 2 Sep 2015 09:55:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Sep 2015 09:55:32 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t82EtWBx010884;
	Wed, 2 Sep 2015 09:55:33 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZX9Rk-00041y-8P; Wed, 02 Sep 2015 10:55:32 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Sep 2015 10:55:28 -0400
Message-ID: <1441205728-15460-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: workaround for GUI apps with weston
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
X-List-Received-Date: Wed, 02 Sep 2015 14:55:34 -0000
Content-Type: text/plain

* For all GUI apps, shutdown matrix before launching
  - This is needed since matrix is launched fullscreen, and another
    GUI app may get hidden behind matrix with no way to recover.
* For MM and 3D apps, shutdown weston before launching
  - These apps use KMS sink, which collides with weston.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...mmand-workaround-for-GUI-apps-with-weston.patch | 103 +++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   3 +-
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
new file mode 100644
index 0000000..860fbcd
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -0,0 +1,103 @@
+From 1fcef8505e6cb8769e84c3bd3e0abd67579bcd68 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 2 Sep 2015 09:55:05 -0400
+Subject: [PATCH] execute_command: workaround for GUI apps with weston
+
+* For all GUI apps, shutdown matrix before launching
+  - This is needed since matrix is launched fullscreen, and another
+    GUI app may get hidden behind matrix with no way to recover.
+* For MM and 3D apps, shutdown weston before launching
+  - These apps use KMS sink, which collides with weston.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ execute_command.sh | 34 +++++++++++++++++++++++++++++++++-
+ generate.php       |  2 ++
+ run_script.php     |  2 +-
+ 3 files changed, 36 insertions(+), 2 deletions(-)
+
+diff --git a/execute_command.sh b/execute_command.sh
+index 018c632..86d7106 100755
+--- a/execute_command.sh
++++ b/execute_command.sh
+@@ -59,7 +59,17 @@ do
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
++  if [ $i -gt 3 ]
+   then
+     touch "lock/"$item
+ 
+@@ -68,10 +78,32 @@ do
+ 
+ done
+ 
++if [ $program_type == gui ]
++then
++  /etc/init.d/matrix-gui-2.0 stop
++
++  if [ $category == 3d -o $category == multimedia ]
++  then
++    /etc/init.d/weston stop
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
++  if [ $category == 3d -o $category == multimedia ]
++  then
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
+index 10cfed4..7c08282 100644
+--- a/generate.php
++++ b/generate.php
+@@ -105,6 +105,8 @@ for($x = 0;$x<count($contents)&&strlen($contents[$x])>0;$x++)
+ 		$top["Description_Link"] = get_contents("X-MATRIX-Description",$dotdesktop);
+ 
+ 		$top["Lock"] = get_contents("X-MATRIX-LOCK",$dotdesktop);
++
++		$top["Category"] = get_contents("Categories",$dotdesktop);
+ 	} 
+ 
+ 	if($category == -1)
+diff --git a/run_script.php b/run_script.php
+index 9dd7a10..1481b17 100644
+--- a/run_script.php
++++ b/run_script.php
+@@ -91,7 +91,7 @@ if($currently_locked==false)
+ 	$random_string = strval(rand());
+ 	$random_string .= strval(rand());
+ 
+-	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt ".$lock_list;
++	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\" ".$lock_list;
+ 
+ 	$last_line = system($script_command." > /dev/null 2>/dev/null & ", $retval);
+ }
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index df17ffe..e379a8d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r27"
+PR = "r28"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -24,6 +24,7 @@ SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
            ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
 "
 
 require matrix-gui-paths.inc
-- 
1.9.1


