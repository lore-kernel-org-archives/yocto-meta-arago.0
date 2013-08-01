Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9E3A852A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107Soj001023
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107Rvc010275
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:27 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:27 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079RD032028;
	Wed, 31 Jul 2013 19:07:26 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:52 -0500
Message-ID: <1375317112-1690-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1375317112-1690-1-git-send-email-fcooper@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 7/7] meta-toolchain-arago: Add in linux-libc-headers version to variable
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:28 -0000
Content-Type: text/plain

* The path specified by REAL_MULTIMACH_TARGET_SYS did not take into
  consideration the separation of directories due to different
  linux-libc-headers version.
* By adjusting REAL_MULTIMACH_TARGET_SYS the environment-setup file points to
  the correct location.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index ff49426..a8da4dc 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -7,7 +7,10 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r26"
+# Add in linux-libc-headers version so that is taken into consideration
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"
+
+PR = "r27"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
-- 
1.7.0.4


