Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id A871352AAE
	for <meta-arago@arago-project.org>;
	Mon, 12 Sep 2016 22:41:57 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE0008LXPNMX90@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 12 Sep 2016 17:41:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=HzvI_sJN3mAfTqGuu-4A:9
Received: by 100.15.86.14 with SMTP id 7f52eb2d; Mon, 12 Sep 2016 22:41:47 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id C8FAB162127;	Mon, 12 Sep 2016 18:41:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 12 Sep 2016 18:41:46 -0400
Message-id: <1473720106-26719-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1473720106-26719-1-git-send-email-denis@denix.org>
References: <1473720106-26719-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] k2-initramfs: update to 0.0.6 with new serdes FW images
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
X-List-Received-Date: Mon, 12 Sep 2016 22:41:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

License changed due to year update

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
index 46325aa..edfe725 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes, QMSS and NETCP PA firmware"
 
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3a86335d32864b0bef996bee26cc0f2c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c5e02be633f1499c109d1652514d85ec"
 
-PV = "0.0.5"
+PV = "0.0.6"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
 
-SRC_URI[md5sum] = "7c1ffa2ef565532aee07c28ea56b748f"
-SRC_URI[sha256sum] = "7816722c319fd83f5538649003158616481ded5f6a8361f66d38f738f93c0022"
+SRC_URI[md5sum] = "1a4052bdb659de4180c7e71271fe0451"
+SRC_URI[sha256sum] = "0af426ec1bdbf59f9ad4a84d6df123300f0d921feb74d4f1de701b9a0fa1ca76"
 
 S = "${WORKDIR}"
 TARGET = "k2-fw-initrd.cpio.gz"
-- 
2.7.4


