Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2DFD052AF8
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINgJd018811
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709423;
	bh=i4+XzgTIDkE+/DiW6h1Rw6f0KCsRjlqVBTxoeofDyTw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WXUZKWotESgk8eesSBhkPTWjYJpIGD9cc+UKtCcYL/rymYEXtqbYe7rZiY9oafDR4
	UJ8sZEcpcS7WHZQuiF8z0loY7Vq5mPX5GZjXvVj+/8+4tGqBRQkiu1QvueO8NdoHuH
	Bn/KJODi5gRkjk7b09w4QaX2aD/Estiv8ASN5Dco=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINbTN010463
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8m006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:27 -0400
Message-ID: <1506709407-16448-24-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 23/ packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported modules for X11(xsgx) build
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

X11 build: remove opencv
Non-Wayland build: remove glsdk-example-apps

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend        | 10 ++++++----
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 14e4930..88a73d7 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,15 +1,17 @@
-PR_append = "-tisdk25"
+PR_append = "-tisdk26"
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
index 91e92ff..b7f2b44 100644
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


