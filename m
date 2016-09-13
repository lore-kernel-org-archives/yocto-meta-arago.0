Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 0CF6752996
	for <meta-arago@arago-project.org>;
	Tue, 13 Sep 2016 18:42:21 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODG00FEOHA55420@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 13 Sep 2016 13:42:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=kCfvZJGldO2mi53t-5YA:9
Received: by 100.15.86.14 with SMTP id 0a28431d; Tue, 13 Sep 2016 18:42:05 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 2319F162128;	Tue, 13 Sep 2016 14:42:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 13 Sep 2016 14:42:04 -0400
Message-id: <1473792124-25047-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup-base-tisdk: add OPTEE deps for AM57/DRA7 to include in all images
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
X-List-Received-Date: Tue, 13 Sep 2016 18:42:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb      | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 0e8960f..41c1304 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,9 +1,21 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+OPTEE_PKGS = " \
+    optee-os \
+    optee-client \
+    optee-test \
+"
+
+OPTEE_DEPS = ""
+OPTEE_DEPS_am57xx-hs-evm = "${OPTEE_PKGS}"
+OPTEE_DEPS_dra7xx-hs-evm = "${OPTEE_PKGS}"
+
 RDEPENDS_${PN} = "\
     dbus \
     expat \
@@ -15,4 +27,5 @@ RDEPENDS_${PN} = "\
     arago-gpl-notice \
     arago-feed-config \
     nfs-utils-client \
-    "
+    ${OPTEE_DEPS} \
+"
-- 
2.7.4


