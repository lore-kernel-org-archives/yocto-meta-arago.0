Return-Path: <sam.nelson@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5C1C652A5B
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 03:02:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4532UlZ022532
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 22:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493953350;
	bh=pWkQOQqq4Qfmx3S4aNRSYhhIJGWpjE2Vn8wJmh2AVII=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I/amO8hatUWWTOATtgxMBLn+rfWoTVRI241dZltXHiFAq7NECB+mNBJRC6obiqdLU
	mewgQdFy/dIGc9xdZ6Spu/aFEeb+TxGlS9jnfOgjLOfwqqToplxNG292l4VnD5iiV5
	26Bi+1+wSAWVn5zmuAKaEUigjHxWnQwyfzT8nHGA=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4532UQb031713
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 22:02:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 22:02:29 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4532R8A001607;	Thu, 4 May 2017 22:02:29 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 May 2017 23:02:26 -0400
Message-ID: <1493953346-873-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
References: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 2/2] arago-tisdk-addons: Add ti-ipc-examples-linux package for omap-a15
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
X-List-Received-Date: Fri, 05 May 2017 03:02:30 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for examples that demonstrate Host
Linux to Slave RTOS IPC

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Updated PR
---
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 9ed9bc2..9f037f0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r59"
+PR = "r60"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -55,6 +55,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           ti-ipc-rtos-fw \
                           uio-test-pruss \
                           uio-module-drv-test \
+                          ti-ipc-examples-linux \
 "
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
1.9.1


