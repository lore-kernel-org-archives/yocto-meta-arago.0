Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 3B38E52973
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 17:28:56 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXX00DJL4JOCP30@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Nov 2015 11:28:37 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=fL5fNKPEEktez8AQTc4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D5016161D1E;	Mon,
	16 Nov 2015 12:28:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Nov 2015 12:28:36 -0500
Message-id: <1447694916-30686-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons*: add canutils for k2g platform
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
X-List-Received-Date: Mon, 16 Nov 2015 17:29:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 044894f..853317e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -108,6 +108,7 @@ UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev \
                         opencl-staticdev \
 "
+UTILS_append_k2g-evm = " canutils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0171123..bf9d61c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -59,6 +59,8 @@ UTILS_append_dra7xx = " canutils \
                         opencl-examples-dev \
 "
 
+UTILS_append_k2g-evm = " canutils"
+
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem"
 
-- 
2.2.0


