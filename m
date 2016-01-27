Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5D57552A5B
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWA8022472
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWMX012382
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWg9004691;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAi-0007FL-8S; Wed, 27 Jan 2016 14:54:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:29 -0500
Message-ID: <1453924469-27790-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] tisdk-server-rootfs-image: Add unnecessary dev packages to BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:34 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 3928948..89272f0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -13,4 +13,11 @@ IMAGE_INSTALL += "\
     gdb \
 "
 
+BAD_RECOMMENDATIONS += " \
+    ti-llvm3.3-dev \
+    opencl-monitor-dev \
+    libulm-dev \
+    gdbserver-c6x-dev \
+"
+
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
1.9.1


