Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7B0E252972
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 19:45:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77Jj8K7003150
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:08 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77Jj8ut017844
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 14:45:08 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s77Jj6fK000926;	Thu, 7 Aug 2014 14:45:07 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s77Jj4IW011788;	Fri, 8 Aug 2014 01:15:05 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Aug 2014 14:45:00 -0500
Message-ID: <1407440703-21811-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4 v2] u-boot-fw-utils: Use dra7 evm for U-boot config for am57x
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
X-List-Received-Date: Thu, 07 Aug 2014 19:45:10 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* The new U-boot config for am57x evm doesn't exist in any U-boot.
* Simply use a different config name within u-boot-fw-utils since the configs
  are similar and doesn't matter from a utility perspective.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot-fw-utils_2013.07.bbappend        |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend
new file mode 100644
index 0000000..6d1680a
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend
@@ -0,0 +1,6 @@
+PR_append = "-arago0+gitr${SRCPV}"
+
+# The proper config doesn't currently exist anywhere in mainline U-boot.
+# For now just use a similar config which is good enough for U-boot utilities.
+UBOOT_MACHINE_am57xx-evm = "dra7xx_evm_config"
+
-- 
1.7.9.5


