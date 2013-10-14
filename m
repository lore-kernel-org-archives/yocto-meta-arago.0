Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 968465299D
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:00:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJ0Iov015658
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:00:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJ0I2q031466
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:00:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:00:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJ0E0d003426;
	Mon, 14 Oct 2013 14:00:16 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2013 14:49:35 -0500
Message-ID: <1381780175-15257-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] meta-toolchain-arago: copy relocate_sdk from COREBASE
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
X-List-Received-Date: Mon, 14 Oct 2013 19:00:19 -0000
Content-Type: text/plain

* Copy the relocate_sdk.py script from the COREBASE instead of
  from the ARAGOBASE since it was removed from ARAGOBASE

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index cd39b4a..ff74a95 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -10,7 +10,7 @@ require recipes-core/meta/meta-toolchain.bb
 # Add in linux-libc-headers version so that is taken into consideration
 REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"
 
-PR = "r27"
+PR = "r28"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
@@ -107,7 +107,7 @@ fakeroot create_sdk_files() {
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 
-	cp ${ARAGOBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
+	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
 	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
 	# Escape special characters like '+' and '.' in the SDKPATH
-- 
1.7.0.4


