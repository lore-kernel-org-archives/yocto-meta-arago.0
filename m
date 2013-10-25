Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EF7D752A65
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 20:31:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PKV225031817
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:31:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PKV2n8000873
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:31:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 15:31:02 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PKUxfM008229;
	Fri, 25 Oct 2013 15:31:00 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 25 Oct 2013 16:23:58 -0500
Message-ID: <1382736238-15829-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-core-tisdk-image: Update DTB_FILTER to pickup GP DTB
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
X-List-Received-Date: Fri, 25 Oct 2013 20:31:05 -0000
Content-Type: text/plain

* The AM437x GP EVM DTB uses am437x so change the filter to use
  am43 which will match both the GP and EPOS EVMs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 368fa47..74c2b87 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -20,7 +20,7 @@ DTB_FILTER = "unknown"
 DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx-evm = "dra7"
-DTB_FILTER_ti43x = "am43x"
+DTB_FILTER_ti43x = "am43"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-- 
1.7.0.4


