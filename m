Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 7CAD1529A5
	for <meta-arago@arago-project.org>;
	Fri, 12 Feb 2016 20:25:05 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2G006MJBDA7C20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 12 Feb 2016 14:25:00 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=HzvI_sJN3mAfTqGuu-4A:9
Received: by 100.15.86.14 with SMTP id 294de9df; Fri, 12 Feb 2016 20:25:00 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B1068161E9D;	Fri,
	12 Feb 2016 15:04:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 12 Feb 2016 15:04:23 -0500
Message-id: <1455307463-17555-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] k2-initramfs: update with new NETCP PA firmware images
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
X-List-Received-Date: Fri, 12 Feb 2016 20:25:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
index f7b13ae..e61edbd 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes and QMSS firmware"
+DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes, QMSS and NETCP PA firmware"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.0.3"
+PV = "0.0.4"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
 
-SRC_URI[md5sum] = "d5c7bf5425a7f09d2b70d5ce8c4e73bf"
-SRC_URI[sha256sum] = "5b6889593daef70e01b3933f44f3769c0fe766f5fe016fcc0777a4c3063bc03b"
+SRC_URI[md5sum] = "ba1fe7a7f9279ea7ed0d26fbba30e4d5"
+SRC_URI[sha256sum] = "c76c0899cbe9b5dde45febf4be48175142dc49ddcfe759596090c183743e8b3b"
 
 S = "${WORKDIR}"
 TARGET = "k2-fw-initrd.cpio.gz"
-- 
2.2.0


