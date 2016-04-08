Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 693CB5296D
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 22:43:23 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5C004M073V8U20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 17:43:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=PTb7x--dKtFaB_77ZMkA:9
Received: by 100.15.86.14 with SMTP id 1386cda5; Fri, 08 Apr 2016 22:43:08 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C4C9161F78;	Fri,
	8 Apr 2016 18:43:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 18:43:07 -0400
Message-id: <1460155387-17834-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: packagegroup*: disable linalg due to dependency on cmem
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
X-List-Received-Date: Fri, 08 Apr 2016 22:43:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c39e54b..2295e49 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,8 +38,8 @@ UTILS_append_dra7xx = " \
 
 #    opencl-examples-src
 #    openmpacc-examples-src
+#    linalg-examples-src
 UTILS_append_k2hk-evm = " \
-    linalg-examples-src \
 "
 
 #    opencl-examples-src
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 58c75be..9222c06 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -127,9 +127,9 @@ UTILS_append_dra7xx = " canutils-dev \
 "
 #opencl-staticdev
 #                          openmpacc-dev
-UTILS_append_k2hk-evm = " \
-                          linalg-dev \
-"
+#UTILS_append_k2hk-evm = " \
+#                          linalg-dev \
+#"
 #opencl-staticdev
 #                         openmpacc-dev
 UTILS_append_k2l-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 55def38..baaa03a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -111,9 +111,9 @@ EXTRA_PACKAGES_append_dra7xx = " \
 #    opencl-staticdev
 #    opencl-examples-dev
 #    openmpacc-examples-dev
-EXTRA_PACKAGES_append_k2hk-evm = " \
-    linalg-examples \
-"
+#EXTRA_PACKAGES_append_k2hk-evm = " \
+#    linalg-examples \
+#"
 #    opencl-staticdev
 #    opencl-examples-dev
 #    openmpacc-examples-dev
-- 
2.2.0


