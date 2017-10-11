Return-Path: <jjhiblot@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A4B1252961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 17:58:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BHwphC005927
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 12:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507744731;
	bh=Y59EI8fnedlTrSH0RlEEuAgkthJ3EWSVqC+axrYzOco=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H5gXL2sB6I8aiFRIZGBHxOQqO0plOxat6v4unXEQHKfMOr3wOvgn9rdbg00LQG1/1
	1TScKtwV2Ic+19noUaoCLmDf8OXJLPXpaiM8nrgu3KxzZjCQrSmHXGKze+CW2RWXze
	3udQDjltnN/l1Mrle9D9P2/XEHNlwPaU402uzJoo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BHwpUw003173
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 12:58:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 12:58:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 12:58:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BHwoqC002017;
	Wed, 11 Oct 2017 12:58:50 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Wed, 11 Oct 2017 19:58:45 +0200
Message-ID: <1507744725-32713-2-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
References: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] [PATCH 2/2] packagegroup-*-addons*: replace canutils with can-utils
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
X-List-Received-Date: Wed, 11 Oct 2017 17:58:51 -0000
Content-Type: text/plain

The latter supports CAN-FD and is required for MCAN IP on dra76

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb              | 10 +++++-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b31d729..d1c664f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -116,13 +116,13 @@ EXTRA_LIBS_append_k2e = "\
 	nwal-lld-staticdev \
 "
 
-UTILS_append_ti33x = " canutils-dev"
-UTILS_append_ti43x = " canutils-dev"
-UTILS_append_dra7xx = " canutils-dev \
+UTILS_append_ti33x = " can-utils-dev"
+UTILS_append_ti43x = " can-utils-dev"
+UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
-UTILS_append_k2g = " canutils-dev"
+UTILS_append_k2g = " can-utils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8bfcb82..57f5021 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r54"
+PR = "r55"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,13 +31,13 @@ UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_keystone = ""
 
 UTILS_append_ti33x = " mmc-utils \
-                       canutils \
+                       can-utils \
                        switch-config \
                        pru-icss \
 "
 
 UTILS_append_ti43x = " mmc-utils \
-                       canutils \
+                       can-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
@@ -54,7 +54,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           uio-module-drv-test \
 "
 
-UTILS_append_dra7xx = " canutils \
+UTILS_append_dra7xx = " can-utils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
@@ -81,7 +81,7 @@ UTILS_append_k2e = " \
 "
 
 UTILS_append_k2g = " \
-    canutils \
+    can-utils \
     pru-icss \
 "
 
-- 
1.9.1


