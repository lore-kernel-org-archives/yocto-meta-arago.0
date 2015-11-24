Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id D0BD452976
	for <meta-arago@arago-project.org>;
	Tue, 24 Nov 2015 23:03:15 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYC00LI8DCWVM90@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 24 Nov 2015 17:02:56 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=ZuDsRGqTv1QDyYAWZgsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0FDB5161D26;	Tue,
	24 Nov 2015 18:02:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 24 Nov 2015 18:02:55 -0500
Message-id: <1448406175-18743-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons-sdk-target: make mpm-transport and multiprocmgr k2hk/k2e specific
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
X-List-Received-Date: Tue, 24 Nov 2015 23:03:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Commit e9924b71f07a72473263c76bd1fc0231ab26da89 changed packaging of
hyplnk-lld to be k2hk/k2e specific, but mpm-transport and multiprocmgr
both depend on it. So, only package those for k2hk/k2e platforms as well.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 853317e..e48c52b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -20,13 +20,13 @@ UTILS_append_keystone = "\
 	libbz2-staticdev \
 	boost-dev \
 	libsdl-dev \
-	"
+"
 
 TI_SECURE_STORAGE_DEV = "\
 	ti-softhsmv2-dev \
 	libp11-dev \
 	libp11-staticdev \
-	"
+"
 
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
@@ -65,24 +65,20 @@ EXTRA_LIBS_append_keystone = "\
 	libnl-staticdev \
 	ti-ipc-dev \
 	ti-ipc-staticdev \
-	multiprocmgr-dev \
-	multiprocmgr-staticdev \
-	mpm-transport-dev \
-	mpm-transport-staticdev \
 	edma3-lld-dev \
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
 	lksctp-tools-staticdev \
 	ipc-transport-qmss-dev \
 	ipc-transport-qmss-staticdev \
-	"
+"
 
 EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
-	"
+"
 
 EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-dev \
@@ -93,13 +89,21 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	"
+	mpm-transport-dev \
+	mpm-transport-staticdev \
+	multiprocmgr-dev \
+	multiprocmgr-staticdev \
+"
 
 EXTRA_LIBS_append_k2e-evm = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	mpm-transport-dev \
+	mpm-transport-staticdev \
+	multiprocmgr-dev \
+	multiprocmgr-staticdev \
 "
 
 UTILS_append_omap3 = " canutils-dev"
-- 
2.2.0


