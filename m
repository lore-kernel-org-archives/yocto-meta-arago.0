Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D79CE52092
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2018 23:02:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA7N23n5084437
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 17:02:03 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA7N23m1082822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 17:02:03 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 7 Nov 2018 17:02:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 7 Nov 2018 17:02:03 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA7N22UG008163
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 17:02:02 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 7 Nov 2018 18:01:51 -0500
Message-ID: <1541631711-4024-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] matrix-gui: sleep 1 second prior to weston shutdown
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
X-List-Received-Date: Wed, 07 Nov 2018 23:02:13 -0000
Content-Type: text/plain

 Update execute_command.sh:
 Wait 1 second to make sure the application freeing all SGX
 resources prior to weston shutdown

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 +++++++++++-------
 recipes-core/matrix/matrix-gui_2.0.bbappend            |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
index f5399a0..2ddfed2 100644
--- a/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
+++ b/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 5104914897db7ebad07d5c82302ad176bd84f4fe Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Mon, 16 Jul 2018 15:52:45 -0400
+From c8f2849adf7e02aa55ee70103c188b9dbf9b6f80 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 7 Nov 2018 14:55:35 -0500
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
 
 * For all GUI apps, shutdown matrix before launching
@@ -8,18 +8,20 @@ Subject: [PATCH] execute_command: workaround for GUI apps with weston
     GUI app may get hidden behind matrix with no way to recover.
 * For MM and 3D and null window apps, shutdown weston before launching
   - These apps use KMS sink or DRM, which collides with weston
+  - Wait 1 second to make sure the application freeing all SGX resources
+    prior to weston shutdown
 * For qwindow window apps, use qwindow-compositor instead of weston
 
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
+ execute_command.sh | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
  generate.php       |  4 ++++
  run_script.php     | 10 +++++++++-
- 3 files changed, 63 insertions(+), 2 deletions(-)
+ 3 files changed, 65 insertions(+), 2 deletions(-)
 
 diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..9769f4f 100755
+index 325dcb9..ffc347d 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -63,7 +63,22 @@ do
@@ -46,7 +48,7 @@ index 325dcb9..9769f4f 100755
    then
      touch "lock/"$item
  
-@@ -72,10 +87,44 @@ do
+@@ -72,10 +87,46 @@ do
  
  done
  
@@ -56,10 +58,12 @@ index 325dcb9..9769f4f 100755
 +
 +  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +  elif [ $win_type == qwindow ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +    /etc/init.d/qwindow start
diff --git a/recipes-core/matrix/matrix-gui_2.0.bbappend b/recipes-core/matrix/matrix-gui_2.0.bbappend
index 8626d1f..112a4a6 100644
--- a/recipes-core/matrix/matrix-gui_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui_2.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


