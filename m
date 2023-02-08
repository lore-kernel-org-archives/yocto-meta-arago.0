Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC832C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:40:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1194.1675899602955130800
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hBYlZk6m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318Ne18l111761;
	Wed, 8 Feb 2023 17:40:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899601;
	bh=zU4KDbYTn4K2fXAbQ5oVPWWeDa89PIn8CJMW/gK4ejE=;
	h=From:To:CC:Subject:Date;
	b=hBYlZk6m8l2u/9g+LRG6owSoy7gqtNNh2HowniUT7gA9IYZJWT2cHy3Z3hRwBZLfP
	 hTCyaARETkbBvAmODp4mO2NHjyH9b8QCHe7s6Omzc3jGUPU5xK7mbQpgEnVq6z3Pss
	 zMzFhghSJxh9YEI++2XXCijSu6P8jF+q1qltFZs0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318Ne1E7044995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:40:01 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:40:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:40:00 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318Ne0ue006017;
	Wed, 8 Feb 2023 17:40:00 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] meta-arago: Remove unmaintained am-sysinfo tool
Date: Wed, 8 Feb 2023 17:40:00 -0600
Message-ID: <20230208234000.20263-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14214

This tool is no longer maintained and is usefulness has been questionable
at best. Remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb        |  1 -
 meta-arago-extras/conf/layer.conf             |  1 -
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb | 29 -------------------
 .../matrix/matrix-gui-oprofile-demos_2.0.bb   |  2 --
 .../matrix/matrix-gui-settings-demos_2.0.bb   |  1 -
 5 files changed, 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a24adf06..8f42c464 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -11,7 +11,6 @@ PACKAGES =+ "${PN}-extra"
 #    dt
 
 UTILS = " \
-    am-sysinfo \
     gdbserver \
     oprofile \
     netkit-ftp \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index e2c8119f..6df62162 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -34,7 +34,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-armbenchmarks-demos->arm-benchmarks \
     matrix-gui-armbenchmarks-demos->lmbench \
     matrix-gui-armbenchmarks-demos->nbench-byte \
-    matrix-gui-settings-demos->am-sysinfo \
     matrix-gui-machinevision-demos->point-cloud-viewer \
     matrix-lighttpd-config->lighttpd \
 "
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
deleted file mode 100644
index 7a437fe8..00000000
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "AM SysInfo"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
-
-SECTION = "system"
-
-PR = "r10"
-
-BRANCH ?= "master"
-SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
-
-SRC_URI = "git://git.ti.com/git/apps/am_sysinfo.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-	export CROSS_COMPILE=${TARGET_PREFIX}
-	export CFLAGS='${TARGET_CC_ARCH}'
-	# build the release version
-	oe_runmake release CC="${CC}"
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/mem_util/Release/mem_util ${D}/${bindir}
-}
-
-INSANE_SKIP:${PN} = "ldflags"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
index 2235b49f..b9dfda75 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
@@ -9,8 +9,6 @@ inherit allarch
 S = "${WORKDIR}/git/oprofile_apps"
 
 # Make sure profiling submenu and app images  has been installed
-# Include am-sysinfo because that package has the sample
-# executables for profiling.
 RDEPENDS:${PN} += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile oprofile-example"
 
 FILES:${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
index 5a26ae24..e59596a6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
@@ -14,7 +14,6 @@ PACKAGES =+ "matrix-gui-weston-terminal-demo"
 SETTINGS_DEMOS_RDEPENDS = " \
     matrix-gui-apps-images \
     matrix-gui-submenus-settings \
-    am-sysinfo \
 "
 
 RDEPENDS:${PN} += "${SETTINGS_DEMOS_RDEPENDS}"
-- 
2.39.1


