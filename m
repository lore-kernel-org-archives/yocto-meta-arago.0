Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A9F0C52A39
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:20:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNK3j3012407
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:20:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNK2XK022445
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:20:03 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 12 May 2013 18:20:02 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4CNJx8e019810;
	Sun, 12 May 2013 18:20:01 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 12 May 2013 18:19:57 -0500
Message-ID: <1368400797-32039-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] branding-amsdk: Update to latest Graphics SDK version
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
X-List-Received-Date: Sun, 12 May 2013 23:20:03 -0000
Content-Type: text/plain

---
 .../conf/distro/include/branding-amsdk.inc         |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index d300263..8fdf93d 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -8,7 +8,6 @@ PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
 PREFERRED_VERSION_u-boot-am33x = "2013.01.01"
 
-# Use v4.08.00.02 of the Graphics SDK
-PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.02"
-PREFERRED_VERSION_libgles-omap3 = "4.08.00.02"
-
+# Use v4.09.00.01 of the Graphics SDK
+PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
+PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"
-- 
1.7.0.4


