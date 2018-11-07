Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 063EF5298A
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2018 21:05:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA7L5Eig052390
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 15:05:14 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA7L5EWZ018065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 15:05:14 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 7 Nov 2018 15:05:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 7 Nov 2018 15:05:13 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA7L5D90012072
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2018 15:05:13 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 7 Nov 2018 16:05:10 -0500
Message-ID: <1541624710-59127-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] matrix-gui: sleep 1 second prior to weston shutdown
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
X-List-Received-Date: Wed, 07 Nov 2018 21:05:24 -0000
Content-Type: text/plain

Update execute_command.sh:
Wait 1 second to make sure the application freeing all SGX
resources prior to weston shutdown


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 ++++++++++--------
 .../recipes-core/matrix/matrix-gui_2.0.bb              |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
index 5a85935..90a604e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 28 Feb 2018 12:20:32 -0500
+From 156ce8d8d9ee1b614b0079e1e9506af1835bdab7 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 7 Nov 2018 15:48:47 -0500
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
 
 * For all GUI apps, shutdown matrix before launching
@@ -8,17 +8,18 @@ Subject: [PATCH] execute_command: workaround for GUI apps with weston
     GUI app may get hidden behind matrix with no way to recover.
 * For MM and 3D and null window apps, shutdown weston before launching
   - These apps use KMS sink or DRM, which collides with weston
-
+  - Wait 1 second to make sure the application freeing all SGX resources
+    prior to weston shutdown
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
+ execute_command.sh | 40 +++++++++++++++++++++++++++++++++++++++-
  generate.php       |  4 ++++
  run_script.php     | 10 +++++++++-
- 3 files changed, 51 insertions(+), 2 deletions(-)
+ 3 files changed, 52 insertions(+), 2 deletions(-)
 
 diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..180e71f 100755
+index 325dcb9..b8bb6da 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -63,7 +63,22 @@ do
@@ -45,7 +46,7 @@ index 325dcb9..180e71f 100755
    then
      touch "lock/"$item
  
-@@ -72,10 +87,32 @@ do
+@@ -72,10 +87,33 @@ do
  
  done
  
@@ -55,6 +56,7 @@ index 325dcb9..180e71f 100755
 +
 +  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +  fi
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index d8aa00b..4e335e7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r35"
+PR = "r36"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.9.1


