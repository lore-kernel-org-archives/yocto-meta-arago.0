Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A523EEB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:50:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16853.1687452618467477427
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SPjEQcJy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MGoFY4067930;
	Thu, 22 Jun 2023 11:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687452615;
	bh=b5KoSkcPi+XnGS+TXxHC6tPvaGdL9i/qAdYIgM9z/GU=;
	h=From:To:CC:Subject:Date;
	b=SPjEQcJyZpqW4968cswn0MhB8xDznZBfEtfgZEcbXp78MOj/ZQH2OkPGTvJMDT0n5
	 XCQkg2CDY4qTGbqhPOuD9TaVbwcuaN/SetB7Tp7fXVMHix0OETVoglvWZts/WtA4b+
	 rRxF93tYY2vKQArz3dEocccoOMjwMbFiqPiVkF3I=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MGoFMq051691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 11:50:15 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:50:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:50:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MGoFsS011740;
	Thu, 22 Jun 2023 11:50:15 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2] piglit: add conditional config to point at deqp bins
Date: Thu, 22 Jun 2023 11:50:10 -0500
Message-ID: <20230622165010.2378146-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:50:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14682

From: Randolph Sapp <rs@ti.com>

Add a PACKAGECONFIG to define runtime dependencies on deqp tests and
conditionally set values for the default config so piglit works out of
the box.

Adjust the arago.conf accordingly. Drop the explicit requirements for
individual cts tests in ti-test-extras.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  6 +++-
 .../recipes-core/packagegroups/ti-test.bb     |  2 --
 .../recipes-graphics/piglit/piglit_%.bbappend | 30 +++++++++++++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f770345c..512bc175 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -99,7 +99,11 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 PACKAGECONFIG:pn-weston-init = ""
 
 # Enable testing for opencl and vulkan with piglit
-PACKAGECONFIG:append:pn-piglit = " ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
+PACKAGECONFIG:append:pn-piglit = " \
+    ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "deqp-gles", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "deqp-vk", "", d)} \
+"
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 793eb583..11c327a0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -43,8 +43,6 @@ ARAGO_TEST = "\
 ARAGO_TEST_EXTRAS = " \
     python3-numpy \
     piglit \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
 "
 
 ARAGO_TEST:append:armv7a = " \
diff --git a/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend b/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
new file mode 100644
index 00000000..fb533533
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
@@ -0,0 +1,30 @@
+# add a config to point piglit at the default install location for deqp tests
+# if they are selected
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
+PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
+
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-gles', 'true', 'false', d)}; then
+        printf "%s\n" \
+            "[deqp-egl]" \
+            "bin=/usr/lib/opengl-es-cts/deqp-egl" \
+            "[deqp-gles2]" \
+            "bin=/usr/lib/opengl-es-cts/deqp-gles2" \
+            "[deqp-gles3]" \
+            "bin=/usr/lib/opengl-es-cts/deqp-gles3" \
+            "[deqp-gles31]" \
+            "bin=/usr/lib/opengl-es-cts/deqp-gles31" \
+            >> ${D}/${libdir}/piglit/piglit.conf
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d)}; then
+        printf "%s\n" \
+            "[deqp-vk]" \
+            "bin=/usr/lib/vulkan-cts/deqp-vk" \
+            "[deqp-vksc]" \
+            "bin=/usr/lib/vulkan-cts/deqp-vksc" \
+            >> ${D}/${libdir}/piglit/piglit.conf
+    fi
+}
-- 
2.41.0


