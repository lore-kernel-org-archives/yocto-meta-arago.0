Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 9BD4C52A19
	for <meta-arago@arago-project.org>;
	Wed,  2 Dec 2015 22:49:17 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYR00LLE61SKV60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 02 Dec 2015 16:49:05 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=x30bPJPgPvrwdlGsDNQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 50316161D38;	Wed,
	2 Dec 2015 17:49:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 02 Dec 2015 17:49:03 -0500
Message-id: <1449096543-7932-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons-sdk-target: nwal-lld and hplib are also supported on hk/l/e only
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
X-List-Received-Date: Wed, 02 Dec 2015 22:49:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 74bf6a7..7d5b290 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -52,10 +52,6 @@ EXTRA_LIBS_append_keystone = "\
 	rm-lld-staticdev \
 	sa-lld-dev \
 	sa-lld-staticdev \
-	hplib-dev \
-	hplib-staticdev \
-	nwal-lld-dev \
-	nwal-lld-staticdev \
 	pktlib-dev \
 	pktlib-staticdev \
 	libnl-xfrm-dev \
@@ -83,6 +79,10 @@ EXTRA_LIBS_append_k2l-evm = "\
 	iqn2-lld-staticdev \
 	netapi-dev \
 	netapi-staticdev \
+	hplib-dev \
+	hplib-staticdev \
+	nwal-lld-dev \
+	nwal-lld-staticdev \
 	"
 
 EXTRA_LIBS_append_k2hk-evm = "\
@@ -96,6 +96,10 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	hyplnk-lld-staticdev \
 	netapi-dev \
 	netapi-staticdev \
+	hplib-dev \
+	hplib-staticdev \
+	nwal-lld-dev \
+	nwal-lld-staticdev \
 	"
 
 EXTRA_LIBS_append_k2e-evm = "\
@@ -105,6 +109,10 @@ EXTRA_LIBS_append_k2e-evm = "\
 	hyplnk-lld-staticdev \
 	netapi-dev \
 	netapi-staticdev \
+	hplib-dev \
+	hplib-staticdev \
+	nwal-lld-dev \
+	nwal-lld-staticdev \
 "
 
 UTILS_append_omap3 = " canutils-dev"
-- 
2.2.0


