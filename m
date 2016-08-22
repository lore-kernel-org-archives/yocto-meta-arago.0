Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 02EEA52A96
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQf6S005543
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQfI4025054
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:41 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQatq027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:10 -0400
Message-ID: <1471897150-34179-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
References: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] matrix-gui: Update the "execute-command" patch to support category "touch"
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:44 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ..._command-workaround-for-GUI-apps-with-weston.patch | 19 ++++++++++---------
 .../recipes-core/matrix/matrix-gui_2.0.bb             |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
index 860fbcd..4dbdbab 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 1fcef8505e6cb8769e84c3bd3e0abd67579bcd68 Mon Sep 17 00:00:00 2001
+From 9169773b546cfea3c829b3c5e79c68c7979ceea4 Mon Sep 17 00:00:00 2001
 From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 2 Sep 2015 09:55:05 -0400
+Date: Sat, 13 Aug 2016 13:27:30 -0400
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
 
 * For all GUI apps, shutdown matrix before launching
@@ -10,14 +10,15 @@ Subject: [PATCH] execute_command: workaround for GUI apps with weston
   - These apps use KMS sink, which collides with weston.
 
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 34 +++++++++++++++++++++++++++++++++-
- generate.php       |  2 ++
- run_script.php     |  2 +-
+ execute_command.sh |   34 +++++++++++++++++++++++++++++++++-
+ generate.php       |    2 ++
+ run_script.php     |    2 +-
  3 files changed, 36 insertions(+), 2 deletions(-)
 
 diff --git a/execute_command.sh b/execute_command.sh
-index 018c632..86d7106 100755
+index 2be1278..b8d98a5 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -59,7 +59,17 @@ do
@@ -47,7 +48,7 @@ index 018c632..86d7106 100755
 +then
 +  /etc/init.d/matrix-gui-2.0 stop
 +
-+  if [ $category == 3d -o $category == multimedia ]
++  if [ $category == 3d -o $category == multimedia -o $category == touch ]
 +  then
 +    /etc/init.d/weston stop
 +    sleep 1
@@ -60,7 +61,7 @@ index 018c632..86d7106 100755
  
 +if [ $program_type == gui ]
 +then
-+  if [ $category == 3d -o $category == multimedia ]
++  if [ $category == 3d -o $category == multimedia -o $category == touch ]
 +  then
 +    /etc/init.d/weston start
 +    sleep 1
@@ -99,5 +100,5 @@ index 9dd7a10..1481b17 100644
  	$last_line = system($script_command." > /dev/null 2>/dev/null & ", $retval);
  }
 -- 
-1.9.1
+1.7.9.5
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 9b1ba47..9928df7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r30"
+PR = "r31"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.9.1


