Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073FE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.156261.1734713353762126713
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 08:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eWSxWGF/;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKGnCYc191765
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 10:49:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734713352;
	bh=z+QOUHGpKSmjDgA19PJDuoCIeBuqJSN0ECbWcJ5vLko=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eWSxWGF/Mkg+EjH4mzndw9VjkOT7Lq98efSMpWSW1rtcM/9KTd57TtiAHnTpSAM+3
	 CfcMef8R7PItnLbst9B6fyMLIn4dwyACsTz4ag7Yrv97NvqVlQKTMrARU3qFKbbjW2
	 UEoUuqZ0YZQmvoqnUgkfWjguVjZAzfvEjfqkhuqQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKGnC6f011378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 10:49:12 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 10:49:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 10:49:12 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGnBgi123677;
	Fri, 20 Dec 2024 10:49:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/2] flatbuffers: Remove this recipe
Date: Fri, 20 Dec 2024 10:49:09 -0600
Message-ID: <20241220164910.318809-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220164910.318809-1-afd@ti.com>
References: <20241220164910.318809-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Dec 2024 16:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15676

This was used for TFlite and ARMNN before it was included in meta-oe.
A newer better maintained version of this is in meta-oe now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../flatbuffers/flatbuffers_1.11.0.bb         | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb

diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
deleted file mode 100644
index 7f7b8b99..00000000
--- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Memory Efficient Serialization Library"
-HOMEPAGE = "https://github.com/google/flatbuffers"
-SECTION = "console/tools"
-LICENSE = "Apache-2.0"
-
-PACKAGE_BEFORE_PN = "${PN}-compiler"
-
-RDEPENDS:${PN}-compiler = "${PN}"
-RDEPENDS:${PN}-dev += "${PN}-compiler"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
-
-SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
-
-SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
-
-# Make sure C++11 is used, required for example for GCC 4.9
-CXXFLAGS += "-std=c++11"
-BUILD_CXXFLAGS += "-std=c++11"
-
-# BUILD_TYPE=Release is required, otherwise flatc is not installed
-EXTRA_OECMAKE += "\
-    -DCMAKE_BUILD_TYPE=Release \
-    -DFLATBUFFERS_BUILD_TESTS=OFF \    
-    -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
-"
-
-inherit cmake
-
-S = "${WORKDIR}/git"
-
-FILES:${PN}-compiler = "${bindir}"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


