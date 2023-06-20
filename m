Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF592EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 23:10:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4085.1687302625494292391
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 16:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o0/P2RFF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KNAM5e021123;
	Tue, 20 Jun 2023 18:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687302622;
	bh=fgQ0ghc1aIbp9yS+dipIs5JXJHB1dyDqsdkZ2DGccBg=;
	h=From:To:CC:Subject:Date;
	b=o0/P2RFFXfUxHQS1aPQEjss+pKFmmUgwA8MrdfU5/M52bkhq2lr1JssyeI0l5TeQz
	 sIX46konbcmXynaxt5byKQu11nPiyzZ44yirb6nn1F5Knz0EohTeKwi6NKXsGRnmTG
	 SlYDPqWVoA4mrljn5zCXMHur6ael3MXg8ohYDGoE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KNAMJk045394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 18:10:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 18:10:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 18:10:20 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KNAKLb096960;
	Tue, 20 Jun 2023 18:10:20 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] piglit: add conditional config to point at deqp bins
Date: Tue, 20 Jun 2023 18:09:03 -0500
Message-ID: <20230620230902.1864984-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 23:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14663

From: Randolph Sapp <rs@ti.com>

Add a PACKAGECONFIG to define runtime dependencies on deqp tests and
conditionally set values for the default config so piglit works out of
the box.

Adjust the arago.conf accordingly. Drop the explicit requirements for
individual cts tests in ti-test-extras.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Not sure how I feel about this patch. Feel free to tear it to shreds if
it's a bad idea.

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
index 00000000..e4cb9525
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
+            >> ${D}/usr/lib/piglit/piglit.conf
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d)}; then
+        printf "%s\n" \
+            "[deqp-vk]" \
+            "bin=/usr/lib/vulkan-cts/deqp-vk" \
+            "[deqp-vksc]" \
+            "bin=/usr/lib/vulkan-cts/deqp-vksc" \
+            >> ${D}/usr/lib/piglit/piglit.conf
+    fi
+}
-- 
2.41.0


