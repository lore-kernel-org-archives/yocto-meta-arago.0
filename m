Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 14AF65299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:40:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJe6dY018390
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJe6xL020540
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:40:06 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJe33j012256;
	Mon, 14 Oct 2013 14:40:04 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2013 15:29:21 -0500
Message-ID: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] arago-core-tisdk-image: Add AM437x DTB filter
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
X-List-Received-Date: Mon, 14 Oct 2013 19:40:07 -0000
Content-Type: text/plain

* Add the DTB_FILTER setting for am437x-evm devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 1d00117..368fa47 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -20,6 +20,7 @@ DTB_FILTER = "unknown"
 DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx-evm = "dra7"
+DTB_FILTER_ti43x = "am43x"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-- 
1.7.0.4


