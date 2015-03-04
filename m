Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 45A5452A29
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 17:00:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKP00HST5WLEV00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 04 Mar 2015 11:00:22 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ReEn0Opq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=bSrsQA07O-TsxwUzZhYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 11ECC200EB;	Wed,
	4 Mar 2015 12:00:21 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 04 Mar 2015 12:00:20 -0500
Message-id: <1425488420-16525-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-connectivity: enable wlan/bt on dra7xx soc unconditionally
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
X-List-Received-Date: Wed, 04 Mar 2015 17:00:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 08d2a4a..f157676 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r31"
+PR = "r32"
 
 inherit packagegroup
 
@@ -64,10 +64,10 @@ CONNECTIVITY_RDEPENDS_ti43x = "\
     ${FIRMWARE_AND_DRIVERS} \
 "
 
-CONNECTIVITY_RDEPENDS_dra7xx-evm = "\
+CONNECTIVITY_RDEPENDS_dra7xx = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
-    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
+    ${FIRMWARE_AND_DRIVERS} \
     bt-firmware \
 "
 
-- 
2.2.0


