Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE27C021B5
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 20:54:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.7819.1740084869977095235
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 12:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wid5eWiO;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KKsSGt702435
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740084869;
	bh=wncle79m32ZpVOkmFKdn2jYwL1nMAG8eg3UV8GJWAyw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wid5eWiO2hC+Q/XlchRFGdoThhId7f3WtGO4ERml3jj7mUnIi5+IAySMXDNtXwd/p
	 dreMN1Rev82nHwNA4AuPYpbU6AwkFSm7+NP6eSLk2YGkz7j/5IlRwJNFLLEX8ufy2H
	 5dIUhpJs+outO4Ua1FcZVrjdFnX+Z8r+01WI7B2A=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KKsS6B099788
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:28 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 14:54:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 14:54:28 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KKsSDM096914;
	Thu, 20 Feb 2025 14:54:28 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 1/3 v2] meta-arago-test: add recipe opencl-cts
Date: Thu, 20 Feb 2025 14:54:26 -0600
Message-ID: <20250220205428.212747-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220205428.212747-1-a-christidis@ti.com>
References: <20250220205428.212747-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 20:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15877

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

Adding recipe for opencl-cts, v2024-08-08 is a pre-release version.
I have tested it to work with opencl-headers version v2024.05.08 . This version
is picked due to incompatibility issues with other versions of headers.

This is a backport from meta-openembedded, they rejected to move opencl-cts to
scarthgap due to their LTS procedure. New packages do not get merged into LTS
branches after 7 months of the branch creation.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Added explanation on why this patch is a backport from
  meta-openembedded 

 .../opencl/opencl-cts_2024.08.08.bb           | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 00000000..60bc3c6a
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,27 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core python3-io"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+           file://0001-Ignore-Compiler-Warnings.patch"
+
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DCMAKE_BUILD_TYPE=Debug -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}
-- 
2.34.1


