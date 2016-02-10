Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 67E2B5296D
	for <meta-arago@arago-project.org>;
	Wed, 10 Feb 2016 00:04:39 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2B000DC1J7O0A0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Feb 2016 18:04:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=sXxbYe1gZPRFtlL-J8AA:9
	a=7MU8ljVfTrYSjeOW:21 a=jNbxiHwMRvXj5poW:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 83B6E161E8B;	Tue,
	9 Feb 2016 19:04:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 09 Feb 2016 19:04:18 -0500
Message-id: <1455062658-23081-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] images: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 10 Feb 2016 00:04:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

1. keystone-specific image was updated to exclude ti-llvm3.6-dev, but other
   platforms still refered to ti-llvm3.3-dev and won't purge it
2. no need to separate BAD_RECOMMENDATIONS for keystone from other platforms,
   as all of them incldude common arago-base-tisdk-image
3. also exclude coreutils that gets pulled due to number of -dev packages,
   for consistency of using busybox-based system tools across all platforms

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb    | 3 ++-
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 7 -------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index 51d2652..7b589e2 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -13,10 +13,11 @@ IMAGE_INSTALL += "\
     "
 
 BAD_RECOMMENDATIONS += " \
-    ti-llvm3.3-dev \
+    ti-llvm3.6-dev \
     opencl-monitor-dev \
     libulm-dev \
     gdbserver-c6x-dev \
+    coreutils \
 "
 
 export IMAGE_BASENAME = "arago-base-tisdk-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index d0c3f54..53ea300 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -14,11 +14,4 @@ IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
 "
 
-BAD_RECOMMENDATIONS += " \
-    ti-llvm3.6-dev \
-    opencl-monitor-dev \
-    libulm-dev \
-    gdbserver-c6x-dev \
-"
-
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
2.2.0


