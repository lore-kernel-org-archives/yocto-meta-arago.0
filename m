Return-Path: <>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D4AEC52993
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2020 16:28:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RGQJFn128317
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:26:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580142379;
	bh=Vhv/9+QCxYqE2jXxiQsnY7/pBnv8OokgNL0iQU5sGT4=;
	h=From:To:CC:Subject:Date;
	b=UHatlyhGnlAIaqknJHc6B+6xIILFqogGyU0TjfUMpJGjukauNlwDp/o56BxkoA1nS
	hdDqkv3MSgTsCpdr2TFkGAuW0v7S8D2pVemkpqiePpueOisu79FcfYmeDpC+AaPR8t
	2cst9SH/O1crt3qyJOuexQDyg5uftlyC1Imgmlco=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RGQJDP007726
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:26:19 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 27 Jan 2020 10:26:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 27 Jan 2020 10:26:18 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RGQInL035392;
	Mon, 27 Jan 2020 10:26:18 -0600
Received: from localhost ([10.250.70.160])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00RGQH317190; Mon, 27 Jan 2020 10:26:18 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 27 Jan 2020 11:26:16 -0500
Message-ID: <20200127162616.24864-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/thud][PATCH] screenshot: Remove this screenshot tool in favor of fbgrab
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
X-List-Received-Date: Mon, 27 Jan 2020 16:28:10 -0000
Content-Type: text/plain

This takes a screenshot of the current framebuffer only. There are tools
for taking screenshots of the current window system which is usually what
a user wants. If the user really wants the conent of the framebuffer then
they can use fbgrab which is already in meta-oe.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk.bb         |  5 ----
 .../screenshot/screenshot_1.0.bb              | 27 -------------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index 42c6aefa..c9a17c5e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -17,11 +17,6 @@ OOBE_ti43x += "\
     parse-ip \
 "
 
-EXTRA_APPLICATIONS = "\
-    screenshot \
-"
-
 RDEPENDS_${PN} = "\
     ${OOBE} \
-    ${EXTRA_APPLICATIONS} \
 "
diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
deleted file mode 100644
index 08a3040b..00000000
--- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Screenshot"
-HOMEPAGE = "https://gitorious.org/screenshot"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
-SECTION = "graphics"
-
-PR = "r2"
-
-BRANCH ?= "master"
-SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
-
-SRC_URI = "git://git.ti.com/apps/screenshot.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    export CROSS_COMPILE=${TARGET_PREFIX}
-    export CFLAGS='${TARGET_CC_ARCH}'
-    # build the release version
-    make release CC="${CC}"
-}
-
-do_install() {
-    make DESTDIR=${D} install
-}
-
-INSANE_SKIP_${PN} = "ldflags"
-- 
2.17.1


