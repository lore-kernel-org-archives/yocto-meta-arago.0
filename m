Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C40E652B11
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINgnZ018746
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709422;
	bh=8Ewm8WT9aiEz/R5aRJJwaXvlke66wUgcuwLUyhRTt+o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=uKlLV2f0fJZIfcF/wrcSNdzCaWiIt+Vhik5Exq3924QjUWRnvucgaJdduQaqfzLut
	6apesD8hJgOpyrnEocfK8sQL46OdrbUXpReHE83IRzF31m/q/nlRenykeygyWWzM2j
	77y/FZPougLcxAD+1e9WsOqXb+3SmCjgljctKRnM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINbbS010268
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8j006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:24 -0400
Message-ID: <1506709407-16448-21-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 20/ packagegroup-arago-tisdk-hmi(-sdk): remove HMI demos for X11(xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:54 -0000
Content-Type: text/plain

The HMI demo programs only work on non-X11 window systems.
Remove those demo for X11(xsgx) build

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb     | 10 +++++-----
 recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 2aafcd3..3612feb 100755
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Task to add HMI related sources into the SDK"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -9,17 +9,17 @@ inherit packagegroup
 HMI = ""
 
 HMI_append_ti43x = " \
-    evse-hmi-src \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
 "
 
 HMI_append_ti33x = " \
-    evse-hmi-src \ 
-    protection-relays-hmi-src \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'protection-relays-hmi-src', d)} \
 "
 
 
 HMI_append_omap-a15 = " \
-    evse-hmi-src \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi-src', d)} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index 125443a..0230fb6 100755
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Task to add HMI related packages"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,16 +11,16 @@ HMI = " \
 
 
 HMI_append_ti33x = " \
-    evse-hmi \
-    protection-relays-hmi \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi', d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'protection-relays-hmi', d)} \
 "
 
 HMI_append_ti43x = " \
-    evse-hmi \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi', d)} \
 "
 
 HMI_append_omap-a15 = " \
-    evse-hmi \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', 'evse-hmi', d)} \
 "
 
 
-- 
1.9.1


