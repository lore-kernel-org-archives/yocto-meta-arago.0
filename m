Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3663C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:45:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.499.1746110722633095884
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 May 2025 07:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dV1TvSTK;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541EjLxj3639088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 09:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746110721;
	bh=PyG5hpyFtaVhv9av5mHZqLAJjNuukjdKg/IErGLymMw=;
	h=From:To:CC:Subject:Date;
	b=dV1TvSTKpGwFBpc6cs6J9CuXYh/ZUNWf0+nJO6oxMqohNypR33oRcLwD6tC0+EeO7
	 +0DgyvNq0oZ+//bSF0ruyNYb1bnkv9o8vAIDpbO9q/YmHWHrRgv48nWw7NdV4yOWxr
	 ZtqDoM+ye8Nyg00SKigtRIgepyiZBZAmylIEygBo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541EjLsp009709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 09:45:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 09:45:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 09:45:21 -0500
Received: from fllvsmtp7.itg.ti.com ([10.250.35.60])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541EjLnl063058;
	Thu, 1 May 2025 09:45:21 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] kms++: Remove this recipe
Date: Thu, 1 May 2025 09:45:19 -0500
Message-ID: <20250501144519.355364-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 May 2025 14:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16173

This now exists in meta-oe as "kmsxx". Remove this version and rename
it where it is included as the old name.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-base.bb  |  4 +--
 .../recipes-core/packagegroups/ti-test.bb     |  4 +--
 .../recipes-graphics/kms++/kms++_git.bb       | 30 -------------------
 3 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 meta-arago-test/recipes-graphics/kms++/kms++_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index fc2eafec..95e4250b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -32,8 +32,8 @@ ARAGO_EXTRA = "\
     parted \
     dropbear \
     openssh-sftp-server \
-    kms++ \
-    kms++-python \
+    kmsxx \
+    kmsxx-python \
     can-utils \
     docker \
     expat \
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index a73e2869..fcb20df0 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -27,8 +27,8 @@ TI_TEST_BASE = "\
     iperf3 \
     kernel-modules \
     kernel-selftest \
-    kms++ \
-    kms++-python \
+    kmsxx \
+    kmsxx-python \
     libdrm-tests \
     linuxptp \
     lmbench \
diff --git a/meta-arago-test/recipes-graphics/kms++/kms++_git.bb b/meta-arago-test/recipes-graphics/kms++/kms++_git.bb
deleted file mode 100644
index 56b83c7a..00000000
--- a/meta-arago-test/recipes-graphics/kms++/kms++_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "C++ library for kernel mode setting"
-HOMEPAGE = "https://github.com/tomba/kmsxx"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
-
-PV = "2.1"
-PR = "r1"
-
-BRANCH = "master"
-SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=https;branch=${BRANCH}"
-SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
-
-DEPENDS = "drm fmt"
-
-DEPENDS += "python3-pybind11"
-EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
-
-PACKAGES =+ "${PN}-python"
-
-RDEPENDS:${PN}-python += "python3-core"
-
-FILES:${PN}-python += "${libdir}/python*/site-packages"
-
-S = "${WORKDIR}/git"
-
-inherit python3native meson pkgconfig update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "kmstest"
-ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
-- 
2.39.2


