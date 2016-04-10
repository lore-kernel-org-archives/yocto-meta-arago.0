Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 6799A52090
	for <meta-arago@arago-project.org>;
	Sun, 10 Apr 2016 22:22:24 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5F00M9KVGV8180@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 10 Apr 2016 17:22:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mIblmZf1X3T5NjNiYq0A:9
Received: by 100.15.86.14 with SMTP id 6b72584a; Sun, 10 Apr 2016 22:22:17 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 47489161F78;	Sun,
	10 Apr 2016 18:22:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 10 Apr 2016 18:22:06 -0400
Message-id: <1460326926-31707-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: nativesdk-packagegroup-arago-sdk-host: disable OpenCL and OpenMP for now due to breakage
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
X-List-Received-Date: Sun, 10 Apr 2016 22:22:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 8eb4759..331c801 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r13"
+PR = "r14"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
+#               nativesdk-clocl
+#               nativesdk-clacc
 EXTRA_TOOLS = "nativesdk-ti-cgt6x \
                nativesdk-ti-cgt-pru \
-               nativesdk-clocl \
-               nativesdk-clacc \
                nativesdk-mtd-utils-ubifs \
 "
 
-- 
2.2.0


