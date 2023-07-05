Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2A6EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 13:09:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16339.1688562576051174365
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 06:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hcQvcF60;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365D9YFH066236;
	Wed, 5 Jul 2023 08:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688562574;
	bh=qTPFz1sv9ImjOZ2SEq8anu2I6MsnbGpSyjp80+PbaU4=;
	h=From:To:CC:Subject:Date;
	b=hcQvcF60n0Ccqnr9tpP3Bev+DYwV9MOxm3KvaFCBotwm5qpAHDMDS+CacCvl3fZwv
	 QmCwN09p0JxeqBBEaTrDZ2jIn99eo7PCag2IYsI/VM83dImhHc3V1KzX50h3qd8srz
	 O7NC9cfC77HypzXYB23gQu2tJPzPZSzJR7ct7o5I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365D9YCK108432
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 08:09:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 08:09:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 08:09:34 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365D9XGh040831;
	Wed, 5 Jul 2023 08:09:33 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH 1/3] libcamera: Add recipe for v0.0.5
Date: Wed, 5 Jul 2023 18:39:26 +0530
Message-ID: <20230705130928.1201894-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3181; i=j-luthra@ti.com; h=from:subject; bh=VRxga/59Cgfuyi60QXlNP52I57SKrGw+K9DM6rpXGNY=; b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkpWtb8pYepr1fmHxFhitMFLoxX68Kj2vXldzg6 zbOF1U2tLOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZKVrWwAKCRBD3pH5JJpx Ra4hEAC1xlXSJr8++/bK+K5SHNiY+wFN3B4wwdCbPPZGbDhg9LmRMeLbG9NM2pijB+dtHvbqqiO 6miI720mZVvZOD3w+wCCnRAm1KQiPGVPAcQ7Wl4LkHLpf59uvEuh8W1blM7VCT2XMHgosJq0RQ3 0u4+nhoVGZez5lwUJDEyX3QZBQ+3NUOauAx6mQu8vkSxDIaWSIHpy4NtWXOV/M//f2AIoY5ucvs mSo9lKLSE0OLyXNIa0w8qFgIembRiBPHgQiFpUHPVCe7E0OTzdcxkeaDAjDutLVWa+MTvbyvTwI AWiL9EXbTdVHfjGJV7XlKP0wloUS8BYiE8Hy5+h1R9LNKEy+Th0Tz1cDbp4E/vP8lJoYLJqhWcl RsNrWuQKAnC/ILlk/aFvi4IAKzOMJFO/H2opZdv8qz6MageDDeDo9XeIuyV1Y0+6eHkjLanRH+N XgOPVCsNOBiOTRALmM0qvTGz7M7n2K91ZFFkh5HtbAMZ7g6ukVr/nDftrPcS45n05T62NeOTaF0 Fy2y0pbxUnvyr25j8kDj3D/LOE9hl7Mw+Zq/vCH0891awxsE7UYzDOFSBNr/Zq5iNTa1HVi15rz V2G+8DiJyshFH6/+bFeAJrefl3yv/yPy/NZCoXXdvv/DSlGeVug9Iapn9TCDswHNNXDF7t/Lt7L WoFtxfgjWJuP2XQ!
 ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp; fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 13:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14747

For kirkstone, an older recipe is present in meta-oe which is using
libcamera from December 2021 with many missing features.

TI's 6.1 based kernel can support the simple pipeline of libcamera, and
benefit from the latest features in release v0.0.5, so we override the
recipe here for arago.

The new recipe here is taken as-is from meta-oe master.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
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


