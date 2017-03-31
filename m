Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B4AAC5298A
	for <meta-arago@arago-project.org>;
	Fri, 31 Mar 2017 23:04:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2VN43VA002467
	for <meta-arago@arago-project.org>; Fri, 31 Mar 2017 18:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491001443;
	bh=6gdndDxUdPTsNJNKOG6cZR2rqVdaX4LEbnY9Z8mNFvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DV9lERZOSx0KV34qx3lDN7QrV6fFTU3khwpDGywGSmJjjeG3Al6lVNpvZPdbSKqJW
	t4k494D+MUIQsBoIqlw6+QCFHGplAb3VdrnRxGXlLzcL4jtZqkiC5NtSI51qTPRKZU
	BOC4zkuhkPvOM2u8Oe5yFeVGlx1hrwFAZMLoQ180=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2VN3wUg000706
	for <meta-arago@arago-project.org>; Fri, 31 Mar 2017 18:03:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 31 Mar 2017 18:03:58 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2VN3qi7005619;	Fri, 31 Mar 2017 18:03:58 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Mar 2017 19:03:39 -0400
Message-ID: <1491001421-28683-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1491001421-28683-1-git-send-email-h-gou@ti.com>
References: <1491001421-28683-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty][PATCH 2/4] packagegroup-arago-tisdk-addons*: add voxelsdk
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
X-List-Received-Date: Fri, 31 Mar 2017 23:04:14 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb   | 8 +++++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 6 +++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b2586d5..46cff98 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -144,7 +144,13 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
+EXTRA_PACKAGES = ""
+EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev"
+EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${EXTRA_LIBS} \
+    ${EXTRA_PACKAGES} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index dfbdbde..cf4a9ee 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r58"
+PR = "r59"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -115,6 +115,10 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
+EXTRA_PACKAGES_append_ti33x = " voxelsdk"
+EXTRA_PACKAGES_append_ti43x = " voxelsdk"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-- 
1.9.1


