Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 81C2852AA4
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFANVt001736
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMU6019087
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMsn000488;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgo-0001oZ-Hy; Fri, 29 Jan 2016 10:10:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:15 -0500
Message-ID: <1454080219-6927-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
References: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] matrix-gui-apps-git: Bump SRCREV for multiple fixes
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:24 -0000
Content-Type: text/plain

* mc_demo_ipc: update dsp_image name in scripts for k2l and k2e
* utility_flash: Generalize parsing of mtd partitions
* optimize-benchmark: Fix for platforms without scaling_governor
* multimedia_apps: add queue for arm multimedia pipelines
* runIvahdVipVpeMpeg4EncDec: update gstreamer pipeline to specify
  frame rate for v4l2src output
* videoanalytics: add the submenu and the opencv+opencl+opengl demo

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 94766a9..8edcb2b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "02d7a2b8d9aaf4be19d6c20936161ce6ced63215"
+SRCREV = "497b2c6c9b748a3b3c5911bff200e027be45e0db"
 BRANCH = "master"
-INC_PR = "r39"
+INC_PR = "r40"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


