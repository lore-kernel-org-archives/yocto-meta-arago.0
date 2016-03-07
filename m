Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id D452952A87
	for <meta-arago@arago-project.org>;
	Mon,  7 Mar 2016 21:18:56 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3O001H3TVJQHA0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Mar 2016 15:18:55 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=YTL0HTW5htadIX3LtlUA:9
Received: by 100.15.86.14 with SMTP id 15cc1c11; Mon, 07 Mar 2016 21:18:55 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 03CE3161EF9;	Mon,
	7 Mar 2016 16:18:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Mar 2016 16:18:54 -0500
Message-id: <1457385534-2153-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-server-extra-rootfs-image: only add multimedia when alsa is enabled
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
X-List-Received-Date: Mon, 07 Mar 2016 21:18:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-server-extra-rootfs-image.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
index 432f421..51237cb 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
@@ -3,7 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
     packagegroup-arago-tisdk-addons-extra \
-    packagegroup-arago-tisdk-multimedia \
+    ${@base_contains('MACHINE_FEATURES', 'alsa', 'packagegroup-arago-tisdk-multimedia', '',d)} \
 "
 
 export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
-- 
2.2.0


