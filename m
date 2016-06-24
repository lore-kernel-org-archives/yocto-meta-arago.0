Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 1EEB452A5B
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 17:13:54 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9A006VAD75OG50@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jun 2016 12:13:53 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=HzvI_sJN3mAfTqGuu-4A:9
Received: by 100.15.86.14 with SMTP id 0150045a; Fri, 24 Jun 2016 17:13:53 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EE43D162078;	Fri,
	24 Jun 2016 13:13:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jun 2016 13:13:49 -0400
Message-id: <20160624171350.18507-2-denis@denix.org>
X-Mailer: git-send-email 2.9.0
In-reply-to: <20160624171350.18507-1-denis@denix.org>
References: <20160624171350.18507-1-denis@denix.org>
Subject: [PATCH 2/3] k2-initramfs: update to latest with fresh FW images
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
X-List-Received-Date: Fri, 24 Jun 2016 17:13:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
index e61edbd..46325aa 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes, QMSS and NETCP PA firmw
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.0.4"
+PV = "0.0.5"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
 
-SRC_URI[md5sum] = "ba1fe7a7f9279ea7ed0d26fbba30e4d5"
-SRC_URI[sha256sum] = "c76c0899cbe9b5dde45febf4be48175142dc49ddcfe759596090c183743e8b3b"
+SRC_URI[md5sum] = "7c1ffa2ef565532aee07c28ea56b748f"
+SRC_URI[sha256sum] = "7816722c319fd83f5538649003158616481ded5f6a8361f66d38f738f93c0022"
 
 S = "${WORKDIR}"
 TARGET = "k2-fw-initrd.cpio.gz"
-- 
2.9.0


