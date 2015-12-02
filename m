Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id B979752A14
	for <meta-arago@arago-project.org>;
	Wed,  2 Dec 2015 21:41:00 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYR007IE2VJFX10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 02 Dec 2015 15:40:37 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=x30bPJPgPvrwdlGsDNQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9461B161D1F;	Wed,
	2 Dec 2015 16:40:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 02 Dec 2015 16:40:31 -0500
Message-id: <1449092431-29232-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons-sdk-target: netapi is only supported on hk/l/e devices
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
X-List-Received-Date: Wed, 02 Dec 2015 21:41:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb              | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 8ba5a82..74bf6a7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -58,8 +58,6 @@ EXTRA_LIBS_append_keystone = "\
 	nwal-lld-staticdev \
 	pktlib-dev \
 	pktlib-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	libnl-xfrm-dev \
 	libnl-xfrm-staticdev \
 	libnl-dev \
@@ -83,6 +81,8 @@ EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 	"
 
 EXTRA_LIBS_append_k2hk-evm = "\
@@ -94,6 +94,8 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 	"
 
 EXTRA_LIBS_append_k2e-evm = "\
@@ -101,6 +103,8 @@ EXTRA_LIBS_append_k2e-evm = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 "
 
 UTILS_append_omap3 = " canutils-dev"
-- 
2.2.0


