Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C60B1529C7
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 21:03:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93L31ST016610
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507064581;
	bh=ObOWhiL1x1ypTebTF7pKNsfI08EWIyduyCJqjOyYnOE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WcZ6LBQa+QctqbeqU1K3LdiwpWNM0V6UUlG3089gEpzJCxdeZ4Gk6jqyn2FWmC06z
	txJw1F+woy3eOB07ozmro0YCycZquxJCYWgGhbwrMGhf3nqThSnPV1RljrFX3dzwKP
	/M+eTzkzBMBN/UWphL/IUOj8/6jEavdnD5bLX9Zg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L31nd026544
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 16:03:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 16:03:01 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L30fD028952
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 17:02:57 -0400
Message-ID: <1507064577-60360-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
References: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 2/2] packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported modules for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 21:03:02 -0000
Content-Type: text/plain

X11 build: remove opencv
Non-Wayland build: remove glsdk-example-apps

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend        | 10 ++++++----
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 8de7992..b4bb200 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,15 +1,17 @@
-PR_append = "-tisdk26"
+PR_append = "-tisdk27"
+
+EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk-dev', '', d)}"
 
 UTILS_append_ti33x = " \
-    opencv-dev \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
 "
 
 UTILS_append_ti43x = " \
-    opencv-dev \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
 "
 
 UTILS_append_omap-a15 = " \
-    opencv-dev \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
 "
 
 UTILS_append_keystone = " \
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 30b6eb6..a234292 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,8 +1,9 @@
-PR_append = "-tisdk40"
+PR_append = "-tisdk41"
 
-EXTRA_PACKAGES_append_ti33x = " opencv"
-EXTRA_PACKAGES_append_ti43x = " opencv"
-EXTRA_PACKAGES_append_omap-a15 = " opencv"
+EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk', '', d)}"
+EXTRA_PACKAGES_append_ti33x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
+EXTRA_PACKAGES_append_ti43x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
+EXTRA_PACKAGES_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
 EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
@@ -29,6 +30,7 @@ UTILS_append_ti33x = " uio-module-drv-test \
                        uio-test-pruss \
 "
 
+UTILS_remove_dra7xx = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'glsdk-example-apps', d)}"
 UTILS_append_k2g = " uio-test-pruss"
 
 EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
-- 
1.9.1


