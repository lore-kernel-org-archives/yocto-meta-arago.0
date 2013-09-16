Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8D57A52998
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 20:28:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GKSNle023841
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 15:28:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GKSMvn028993
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 15:28:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 15:28:22 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GKSJYG025019;
	Mon, 16 Sep 2013 15:28:21 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Sep 2013 16:08:28 -0500
Message-ID: <1379365708-17093-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ti-compat-wireless: Update sourceipk function name
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
X-List-Received-Date: Mon, 16 Sep 2013 20:28:23 -0000
Content-Type: text/plain

* Recent changes in the sourceipk class caused the function clear_git to be
  renamed to adjust_git.
* Update function name to insure that the git repository isn't removed before it
  should be.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-compat-wireless-wl12xx_r5.sp4.01.bb         |    6 +++---
 .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
index 749ea54..c1d82bb 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "wireless-tools"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "d"
+PR_append = "e"
 
 # Tags: ol_R5.SP4.01
 SRCREV_wl12xx = "e96a68476155f1c3576066ab2d0b1417835dfdcf"
@@ -37,10 +37,10 @@ SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactio
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
-# Prevent sourceipk clear_git function from running.
+# Prevent sourceipk adjust_git function from running.
 # This preserves the git repo until driver-select is ran.
 
-clear_git() {
+adjust_git() {
     :
 }
 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
index 7f393a8..273c721 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
@@ -18,7 +18,7 @@ PV = "r8.a6.01"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "b"
+PR_append = "c"
 
 # Tags: ol_r8.a6.01
 SRCREV_wl18xx = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
@@ -39,10 +39,10 @@ SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wi
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
-# Prevent sourceipk clear_git function from running.
+# Prevent sourceipk adjust_git function from running.
 # This preserves the git repo until driver-select is ran.
 
-clear_git() {
+adjust_git() {
     :
 }
 
-- 
1.7.0.4


