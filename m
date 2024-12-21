Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060B5E7718D
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 19:50:22 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.13144.1734810612344875426
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 21 Dec 2024 11:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dYwdwp2B;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJoB8t328974
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 13:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734810611;
	bh=3N3im6biCwqo8FlTvCmqhscvwTgutJVp0UrW+8jMofU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dYwdwp2BiwjivpNlT0IG0/OpCFJjZxZL80sTIipwPtVboi8JVp1joAdafsw1kMtuL
	 A8wPHDTlc4rQE8duhtn+HbMHm71xYH/8OCnHvM91j4TOlqcww3YSxB8N0IWWoEVZrO
	 qbnC6N4najNdWSFQJD7Bl4X0OMO19xAE0jd7noNE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJoB6j017771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 21 Dec 2024 13:50:11 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 21
 Dec 2024 13:50:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 21 Dec 2024 13:50:08 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BLJo79M125173;
	Sat, 21 Dec 2024 13:50:08 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/1] meta-arago-extras: Add recipe for Arm NN
Date: Sat, 21 Dec 2024 13:50:06 -0600
Message-ID: <20241221195006.395991-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241221195006.395991-1-afd@ti.com>
References: <20241221195006.395991-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Dec 2024 19:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15682

Arm NN is a performant machine learning inference engine for Linux,
accelerating ML on Arm Cortex-A CPUs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-devtools/armnn/armnn_24.11.bb     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
new file mode 100644
index 00000000..5f0f0a11
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
@@ -0,0 +1,82 @@
+SUMMARY = "ARM Neural Network SDK"
+DESCRIPTION = "Linux software and tools to enable machine learning workloads on power-efficient devices"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
+
+BRANCH = "branches/armnn_24_11"
+SRC_URI = "git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https"
+
+# v24.11
+SRCREV = "3ed70c005559d409feff2c578a1a39cf8fec8804"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit pkgconfig
+
+DEPENDS = " \
+    boost \
+    protobuf \
+    xxd-native \
+    arm-compute-library \
+"
+
+RDEPENDS:${PN} = " \
+    arm-compute-library \
+    protobuf \
+    boost \
+"
+
+PACKAGECONFIG += "unit-tests tests ref"
+PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
+PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"
+
+PACKAGECONFIG[neon] = " \
+    -DARMCOMPUTENEON=1, \
+    -DARMCOMPUTENEON=0 \
+"
+
+PACKAGECONFIG[unit-tests] = " \
+    -DBUILD_UNIT_TESTS=1, \
+    -DBUILD_UNIT_TESTS=0 \
+"
+
+PACKAGECONFIG[tests] = " \
+    -DBUILD_TESTS=1, \
+    -DBUILD_TESTS=0 \
+"
+
+PACKAGECONFIG[ref] = " \
+    -DARMNNREF=1, \
+    -DARMNNREF=0 \
+"
+
+EXTRA_OECMAKE += " \
+    -DHALF_INCLUDE=${STAGING_DIR_TARGET} \
+"
+
+do_install:append() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
+        install -d ${D}${bindir}/${P}
+        find ${B}/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir}/${P} \;
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'unit-tests', 'true', 'false', d)}; then
+        install -d ${D}${bindir}/${P}
+        cp $CP_ARGS ${B}/UnitTests ${D}${bindir}/${P}
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'tensorflow-lite', 'false', 'true', d)}; then
+        rm -rf ${D}${includedir}/armnnTfLiteParser
+    fi
+}
+
+CXXFLAGS += "-Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=nonnull"
+
+FILES:${PN} += "${libdir}/*"
+FILES:${PN}-dev += "${includedir}/* ${libdir}/cmake/armnn/* ${libdir}/pkgconfig/*.pc ${bindir}/*"
+
+INSANE_SKIP:${PN} = "dev-so buildpaths"
+INSANE_SKIP:${PN}-dev += "dev-elf"
-- 
2.39.2


