Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2BDAA52092
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2018 13:37:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEDasvM016410
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:36:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542202614;
	bh=4XAX2IrMUjI5qssXLfIK3LFn4J1o//MDyS8X+7SnNtc=;
	h=From:To:Subject:Date;
	b=hNgofnChRX0FNhQoCVEiYBntB2VtYSZSmaHOlZ3Nk1zePvDukcrOfkYefETJLnQiF
	6kEIEBR18R+oEcuUb4yxOi97upDDqFc2Tb2IHIYeo4I7MfN/jt2FwtQSUvxTvLFTZX
	q+/bTLCAlfcRLGgwBPs9phP1t1RvfECYOKQ2p6Dk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEDas4m095089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:36:54 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 14 Nov 2018 07:36:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 07:36:53 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEDarCk019948
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:36:53 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Nov 2018 08:36:03 -0500
Message-ID: <1542202563-24901-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] Revert "matrix-gui: sleep 1 second prior to weston shutdown"
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
X-List-Received-Date: Wed, 14 Nov 2018 13:37:05 -0000
Content-Type: text/plain

This reverts commit 13f988e5e897e10607cd3c9910ce526019f93a48a.
This patch is no longer needed. We need to fix the root issue
at the SGX DDK UM.
---
 ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 ++++++++----------
 .../recipes-core/matrix/matrix-gui_2.0.bb              |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
index 90a604e..5a85935 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 156ce8d8d9ee1b614b0079e1e9506af1835bdab7 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 7 Nov 2018 15:48:47 -0500
+From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 28 Feb 2018 12:20:32 -0500
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
 
 * For all GUI apps, shutdown matrix before launching
@@ -8,18 +8,17 @@ Subject: [PATCH] execute_command: workaround for GUI apps with weston
     GUI app may get hidden behind matrix with no way to recover.
 * For MM and 3D and null window apps, shutdown weston before launching
   - These apps use KMS sink or DRM, which collides with weston
-  - Wait 1 second to make sure the application freeing all SGX resources
-    prior to weston shutdown
+
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 40 +++++++++++++++++++++++++++++++++++++++-
+ execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
  generate.php       |  4 ++++
  run_script.php     | 10 +++++++++-
- 3 files changed, 52 insertions(+), 2 deletions(-)
+ 3 files changed, 51 insertions(+), 2 deletions(-)
 
 diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..b8bb6da 100755
+index 325dcb9..180e71f 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -63,7 +63,22 @@ do
@@ -46,7 +45,7 @@ index 325dcb9..b8bb6da 100755
    then
      touch "lock/"$item
  
-@@ -72,10 +87,33 @@ do
+@@ -72,10 +87,32 @@ do
  
  done
  
@@ -56,7 +55,6 @@ index 325dcb9..b8bb6da 100755
 +
 +  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
 +  then
-+    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +  fi
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 4e335e7..d8aa00b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r36"
+PR = "r35"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.9.1


