Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 169C0529B9
	for <meta-arago@arago-project.org>;
	Thu, 19 May 2016 14:50:33 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7F002QJIJTHH60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 19 May 2016 09:50:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=l8bg0u3WY7vGP8FHawAA:9
Received: by 100.15.86.14 with SMTP id 66944624; Thu, 19 May 2016 14:50:18 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7503816200B;	Thu,
	19 May 2016 10:50:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 19 May 2016 10:50:17 -0400
Message-id: <1463669417-21679-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-server-*-image: add opencl and opencl-extra packagegroups
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
X-List-Received-Date: Thu, 19 May 2016 14:50:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb | 1 +
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
index 432f421..48ea31d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
@@ -3,6 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
     packagegroup-arago-tisdk-addons-extra \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-multimedia \
 "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 93ecc6f..3ce26a4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -7,6 +7,7 @@ SPLASH = ""
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
     packagegroup-arago-tisdk-addons \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
     packagegroup-arago-base-tisdk-server-extra \
-- 
2.2.0


