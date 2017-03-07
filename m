Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 60342529D2
	for <meta-arago@arago-project.org>;
	Tue,  7 Mar 2017 16:32:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v27GWxhp019621
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:32:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488904379;
	bh=aQBcpBRE/Ir0ssz7Qt6a56I7Ltpa97Vs1a1zqirIGRs=;
	h=From:To:CC:Subject:Date;
	b=XniGWR46rIQDmxaooJrIrcyOPV8NaJMZL7+G88beikch34aDcrpckwRM/d+kLndHh
	2/9+mS4Cw/L8O4SLA1r+basExSbDLP2YLXo1TE6J8P8d2wnKp0CCcXZ9abTnrFnjs9
	RjpyHU9JhK+xOTfuJ5b9jwkeL0OsRqT/oL40Ze/o=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v27GWwpL020649
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 10:32:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 10:32:58 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v27GWwsv029489;	Tue, 7 Mar 2017 10:32:58 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Mar 2017 11:32:56 -0500
Message-ID: <1488904376-21769-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] packagegroup-arago-tisdk-multimedia*: add hevc-arm-decoder for keystone
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
X-List-Received-Date: Tue, 07 Mar 2017 16:33:00 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb             | 8 ++++++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb          | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 3c72bf0..6f3b559 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,7 +18,11 @@ MULTIMEDIA_append_ti33x = " barcode-roi-dev"
 MULTIMEDIA_append_ti43x = " barcode-roi-dev"
 MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
 
-MULTIMEDIA_append_keystone = " barcode-roi-dev"
+MULTIMEDIA_append_keystone = " \
+    hevc-arm-decoder-dev \
+    hevc-arm-decoder-staticdev \
+    barcode-roi-dev \
+"
 
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index cb143b8..d850e0f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,7 +10,9 @@ MULTIMEDIA = " \
     amsdk-av-files \
 "
 
-MULTIMEDIA_keystone = ""
+MULTIMEDIA_append_keystone = " \
+    hevc-arm-decoder \
+"
 
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo \
-- 
1.9.1


