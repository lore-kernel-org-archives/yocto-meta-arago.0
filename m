Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 26D5852A81
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 20:32:16 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00BSPFPBJ040@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Apr 2016 15:31:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=nvzXRzm1vpu138aXkkMA:9
Received: by 100.15.86.14 with SMTP id 3cafcc01; Tue, 12 Apr 2016 20:31:59 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D6C92161F97;	Tue,
	12 Apr 2016 16:31:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Apr 2016 16:31:58 -0400
Message-id: <1460493118-8037-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot-fw-utils: add support for HS platforms
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
X-List-Received-Date: Tue, 12 Apr 2016 20:32:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
new file mode 100644
index 0000000..6f2f566
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
@@ -0,0 +1,4 @@
+# The proper config doesn't currently exist anywhere in mainline U-boot.
+# For now just use a similar config which is good enough for U-boot utilities.
+UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
+UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
-- 
2.2.0


