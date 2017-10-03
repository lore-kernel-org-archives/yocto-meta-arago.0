Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B5C9E52A95
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsJPs008349
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046059;
	bh=8Ewm8WT9aiEz/R5aRJJwaXvlke66wUgcuwLUyhRTt+o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DVbOLwJXfA6mMcU6oPGBoR+hCEdbJ2r3QjlAehZO8WNedhtfvyc1IHO5mfamE8Lw3
	rTBFwAfomQqXVBUnGloG0nFXherLa9ONLDadZ2w6prOI/ZlG2lwO1LWwYlFfU2FqpA
	jvtxYiCtV5RUEwGNgdxmwiL6Yl/WqsFP7KvlhptA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsJrG013534
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSH013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:08 -0400
Message-ID: <1507046051-57949-21-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 20/23] packagegroup-arago-tisdk-hmi(-sdk): remove HMI demos for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:21 -0000
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


