Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0895EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:55:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13976.1688615729476597539
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w2iD57KR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3663tRYL061990;
	Wed, 5 Jul 2023 22:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688615727;
	bh=ABFraADPIH2g4Oe6EjhjR+uoqaKph6gsIDFFblQDvtk=;
	h=From:To:CC:Subject:Date;
	b=w2iD57KRhEXMoLevQ0vJVU3DJ5zd0rkwQcayIWXePS5Lmk/sRQo67xwIH6W91/so2
	 /SHoLL+JWHgnMvJf4GxZbkreFOZx0FT3TLbtEi4AbYcVcDxMJoQUKzA6AnESLW9bgJ
	 zhi4ZjWko4cVCZpIVW/1ob0+EDUvkX6htXG/dvLI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3663tRDE103987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 22:55:27 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 22:55:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 22:55:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3663tQGD028873;
	Wed, 5 Jul 2023 22:55:26 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH v2 1/3] libcamera: Add recipe for v0.0.5
Date: Thu, 6 Jul 2023 09:25:20 +0530
Message-ID: <20230706035522.1817402-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14758

For kirkstone, an older recipe is present in meta-oe which is using
libcamera from December 2021 with many missing features.

TI's 6.1 based kernel can support the simple pipeline of libcamera, and
benefit from the latest features in release v0.0.5, so we override the
recipe here for arago.

The new recipe here is taken as-is from meta-oe master.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

v2: No changes
Link to v1: https://lore.kernel.org/all/20230705130928.1201894-1-j-luthra@ti.com/

 .../libcamera/libcamera_0.0.5.bb              | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb

diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
new file mode 100644
index 00000000..6ad376f2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -0,0 +1,72 @@
+SUMMARY = "Linux libcamera framework"
+SECTION = "libs"
+
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "\
+    file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
+    file://LICENSES/LGPL-2.1-or-later.txt;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
+"
+
+SRC_URI = " \
+        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+"
+
+SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
+
+PE = "1"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
+
+PACKAGES =+ "${PN}-gst"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+
+LIBCAMERA_PIPELINES ??= "auto"
+
+EXTRA_OEMESON = " \
+    -Dpipelines=${LIBCAMERA_PIPELINES} \
+    -Dv4l2=true \
+    -Dcam=enabled \
+    -Dlc-compliance=disabled \
+    -Dtest=false \
+    -Ddocumentation=disabled \
+"
+
+RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
+
+inherit meson pkgconfig python3native
+
+do_configure:prepend() {
+    sed -i -e 's|py_compile=True,||' ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
+}
+
+do_install:append() {
+    chrpath -d ${D}${libdir}/libcamera.so
+    chrpath -d ${D}${libdir}/v4l2-compat.so
+}
+
+addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
+do_recalculate_ipa_signatures_package() {
+    local modules
+    for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
+        module="${module%.sign}"
+        if [ -f "${module}" ] ; then
+            modules="${modules} ${module}"
+        fi
+    done
+
+    ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${modules}"
+}
+
+FILES:${PN} += " ${libdir}/v4l2-compat.so"
+FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
+
+# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.
+GLIBC_64BIT_TIME_FLAGS = ""
+
-- 
2.41.0


