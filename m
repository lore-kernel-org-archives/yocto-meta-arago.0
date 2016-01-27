Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 3543D529C2
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 22:40:35 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1M00052UZ6YLS0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 27 Jan 2016 16:40:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=HzvI_sJN3mAfTqGuu-4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9B29F161E3D;	Wed,
	27 Jan 2016 17:40:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 27 Jan 2016 17:40:14 -0500
Message-id: <1453934414-25569-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] k2-initramfs: update with proper initramfs
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
X-List-Received-Date: Wed, 27 Jan 2016 22:40:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
index 9a180c4..f7b13ae 100644
--- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
+++ b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Prebuilt Keystone2 initramfs with SerDes and QMSS firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.0.2"
+PV = "0.0.3"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
 
-SRC_URI[md5sum] = "6f64aef93b0132ca1cdaf65cfed9d41b"
-SRC_URI[sha256sum] = "2748bccb2b589054157b349cd726f4f6edcd89104eb3a8c3d0d0d672e2e34a0e"
+SRC_URI[md5sum] = "d5c7bf5425a7f09d2b70d5ce8c4e73bf"
+SRC_URI[sha256sum] = "5b6889593daef70e01b3933f44f3769c0fe766f5fe016fcc0777a4c3063bc03b"
 
 S = "${WORKDIR}"
 TARGET = "k2-fw-initrd.cpio.gz"
-- 
2.2.0


