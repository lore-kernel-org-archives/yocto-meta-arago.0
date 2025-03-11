Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE7C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:53:11 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.9516.1741701186840830242
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BLpJhcck;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BDr5PB732308
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 08:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741701185;
	bh=mfrdgE2JoJzXNByO8+BzXn+HHVgrbsr1DvhSyilImUs=;
	h=From:To:CC:Subject:Date;
	b=BLpJhcckaQpdngodTCkN8G6H5g0jfxgBaDp9tNkYDJkJneWYUZ7cnP3dzJxIhb0xF
	 uKg4Ry9g54y6ciI0dnDWlCOPWq32tlq4DlkbHjQ9A2vNGZ5C9ctbBe+ScRRqPx6LJ6
	 QGgqUroDVTPxHKhnsggogwSz41SsFTnn9Ff8gT8A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BDr5iM077909;
	Tue, 11 Mar 2025 08:53:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 08:53:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 08:53:04 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BDr4bc100309;
	Tue, 11 Mar 2025 08:53:04 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: Remove remaining GLSDK examples
Date: Tue, 11 Mar 2025 08:53:03 -0500
Message-ID: <20250311135303.90562-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15968

These used to be part of the Graphics SDK. These do not build anymore.
Remove these old packages.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb        |  4 ---
 .../packagegroup-arago-tisdk-graphics.bb      |  6 ----
 .../util-scripts/glsdk-util-scripts.bb        | 30 -----------------
 .../glsdk-example-apps/glsdk-example-apps.bb  | 33 -------------------
 4 files changed, 73 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 1d489937..d3bbf623 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -70,10 +70,6 @@ UTILS:append:omapl138 = " ti-ipc-rtos-fw"
 UTILS:append:dra7xx = " \
                         ${UTILS_DSP} \
 "
-# glsdk-example-apps depends on libkms, which has been removed upstream from libdrm:
-# https://gitlab.freedesktop.org/mesa/drm/-/commit/2b997bb4bb688be00620887c8646ff24ccb9396b
-#                        ${@bb.utils.contains('DISTRO_FEATURES','opengl','glsdk-example-apps','',d)} \
-#"
 
 EXTRA_PACKAGES = " \
     protobuf \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index a82db154..52557e5c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -11,16 +11,10 @@ GFX_WAYLAND = "\
     weston-examples \
 "
 
-GFX_UTILS = ""
-GFX_UTILS:append:omap-a15  = "\
-    glsdk-util-scripts \
-"
-
 RDEPENDS:${PN} = "\
     libegl \
     glmark2 \
     kmscube \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
-    ${GFX_UTILS} \
 "
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
deleted file mode 100644
index 1ab1cbc1..00000000
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Utility scripts for debug"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
-
-COMPATIBLE_MACHINE = "omap-a15|j7"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-RDEPENDS:${PN} += "bash"
-
-SRC_URI = "git://git.ti.com/git/glsdk/util-scripts.git;protocol=https;branch=master"
-
-SRCREV = "5a3f8eca444a5c4bf8855705a3018d482e3e19cd"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti/util-scripts
-    install -d ${D}${datadir}/ti/util-scripts/debug
-    install -d ${D}${datadir}/ti/util-scripts/perf
-    install -d ${D}${datadir}/ti/util-scripts/demo
-    install -m 755 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
-    install -m 755 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
-    install -m 755 ${S}/demo/* ${D}${datadir}/ti/util-scripts/demo/.
-
-}
-
-FILES:${PN} += "${datadir}/ti/util-scripts/*"
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
deleted file mode 100644
index 7b0bc3c4..00000000
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "GLSDK example applications"
-HOMEPAGE = "http://git.ti.com/glsdk"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
-
-DEPENDS = "gstreamer1.0 libdrm libdce ti-ipc wayland weston"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://git.ti.com/git/glsdk/example-applications.git;protocol=https;branch=master \
-"
-
-SRCREV="52466430609c402a9f1c0667ccf727d096336d0d"
-
-PR = "r53"
-
-CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11',d)}"
-
-do_install:append () {
-    install -d ${D}${sysconfdir}/glsdkstatcoll
-    install -m 0644 ${S}/bandwidth-tool/config.ini ${D}${sysconfdir}/glsdkstatcoll/.
-    install -m 0644 ${S}/bandwidth-tool/initiators.cfg ${D}${sysconfdir}/glsdkstatcoll/.
-
-    install -d ${D}${sysconfdir}/visualization_scripts
-    install -m 0644 ${S}/cpuload-plugins/scripts/*.sh  ${D}${sysconfdir}/visualization_scripts/.
-    install -m 0644 ${S}/cpuload-plugins/scripts/*.cfg ${D}${sysconfdir}/visualization_scripts/.
-}
-
-FILES:${PN} += "${sysconfdir}/glsdkstatcoll/* ${sysconfdir}/visualization_scripts/*"
-- 
2.39.2


