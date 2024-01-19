Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD6C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 23:42:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8333.1705707757593394542
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 15:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ba0lLwIR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40JNga44039342;
	Fri, 19 Jan 2024 17:42:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705707756;
	bh=EnwWMblo8dQSLhbUNJGUfIOQhZE4HruQqOaHj1v3k8M=;
	h=From:To:Subject:Date;
	b=Ba0lLwIRwilWkqYofB738Xuk+3BPPAnUT3dwcomggLcUNoJkFgc4AAVYrjjlN3lEC
	 Pg8MP+wGBX9RiWpgNbX3YYbxRuONb0HWXmQp26DUKtCQajS/vzdhP2lFAw4w5VG0de
	 x3F7nsRxLy3+0D/GZY5anpXr/wlZ9/fq947vqyHI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40JNgaot060766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jan 2024 17:42:36 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jan 2024 17:42:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jan 2024 17:42:36 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40JNgaNR130670;
	Fri, 19 Jan 2024 17:42:36 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rQyVQ-00089n-6d; Fri, 19 Jan 2024 17:42:36 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libcamera: Remove recipe in arago in favor of meta-openembedded version
Date: Fri, 19 Jan 2024 17:42:36 -0600
Message-ID: <20240119234236.31187-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Jan 2024 23:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15075

The version of libcamera in meta-openembedded is newer and has all of
our patches in it, so we no longer need to carry our own version of this
recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-simple-Support-TI-CSI-RX.patch       | 32 ---------
 .../libcamera/libcamera_0.0.5.bb              | 72 -------------------
 2 files changed, 104 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb

diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
deleted file mode 100644
index e1c30b61..00000000
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
-From: Jai Luthra <j-luthra@ti.com>
-Date: Thu, 23 Mar 2023 11:38:46 +0530
-Subject: [PATCH] simple: Support TI CSI-RX
-
-Add support for TI's CSI-RX pixel grabber device for the simple
-pipeline.
-
-The driver is not yet merged, but v7 is posted [1] upstream.
-
-Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com/ [1]
-Upstream-Status: Pending
-Signed-off-by: Jai Luthra <j-luthra@ti.com>
----
- src/libcamera/pipeline/simple/simple.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
-index e1f8b989..520405a1 100644
---- a/src/libcamera/pipeline/simple/simple.cpp
-+++ b/src/libcamera/pipeline/simple/simple.cpp
-@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
-	{ "mxc-isi", {} },
-	{ "qcom-camss", {} },
-	{ "sun6i-csi", {} },
-+	{ "j721e-csi2rx", {} },
-+
- };
-
- } /* namespace */
---
-2.41.0
diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
deleted file mode 100644
index f4290320..00000000
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY = "Linux libcamera framework"
-SECTION = "libs"
-
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
-
-LIC_FILES_CHKSUM = "\
-    file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
-    file://LICENSES/LGPL-2.1-or-later.txt;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
-"
-
-SRC_URI = " \
-        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
-        file://0001-simple-Support-TI-CSI-RX.patch \
-"
-
-SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
-
-PE = "1"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
-
-PACKAGES =+ "${PN}-gst"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-
-LIBCAMERA_PIPELINES ??= "auto"
-
-EXTRA_OEMESON = " \
-    -Dpipelines=${LIBCAMERA_PIPELINES} \
-    -Dv4l2=true \
-    -Dcam=enabled \
-    -Dlc-compliance=disabled \
-    -Dtest=false \
-    -Ddocumentation=disabled \
-"
-
-RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
-
-inherit meson pkgconfig python3native
-
-do_configure:prepend() {
-    sed -i -e 's|py_compile=True,||' ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
-}
-
-do_install:append() {
-    chrpath -d ${D}${libdir}/libcamera.so
-    chrpath -d ${D}${libdir}/v4l2-compat.so
-}
-
-addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
-do_recalculate_ipa_signatures_package() {
-    local modules
-    for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
-        module="${module%.sign}"
-        if [ -f "${module}" ] ; then
-            modules="${modules} ${module}"
-        fi
-    done
-
-    ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${modules}"
-}
-
-FILES:${PN} += " ${libdir}/v4l2-compat.so"
-FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
-
-# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.
-GLIBC_64BIT_TIME_FLAGS = ""
-- 
2.17.1


