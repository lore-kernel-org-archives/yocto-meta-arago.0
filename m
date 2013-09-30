Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 79CF05296F
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 20:58:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UKwLWL029377
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 15:58:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UKwLkA007379
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 15:58:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 30 Sep 2013 15:58:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UKwIik002724;
	Mon, 30 Sep 2013 15:58:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Sep 2013 16:43:03 -0500
Message-ID: <1380577383-21395-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-prefs: Update preferred U-Boot version
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
X-List-Received-Date: Mon, 30 Sep 2013 20:58:22 -0000
Content-Type: text/plain

* The latest version has switched to rc2 instead of rc1.  Update
  the preferred version to avoid messages about not being able to
  find the rc1 version.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 70f02b9..5ac21ed 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -32,7 +32,7 @@ PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.8"
 PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.07+2013.10-rc1"
+PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.07+2013.10-rc2"
 
 PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
-- 
1.7.0.4


