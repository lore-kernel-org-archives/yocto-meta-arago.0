Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54192C0218D
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 00:25:25 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.601.1737073523736819485
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 16:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kQH8TptS;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50H0PMXZ092000
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 18:25:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737073522;
	bh=z+QOUHGpKSmjDgA19PJDuoCIeBuqJSN0ECbWcJ5vLko=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kQH8TptSHQiQjZ56x7CaVZFFSk93ksgl/eU5XpqME3H6dBbPl8OIIVZHLb3jVbGch
	 bwVHtRn9lgA2kyNXTOHLB+uGlrP7gbDpOM8KarHOxM/31ugH4IbZUw1AgWDQ7OUUAd
	 9NXnND1Q/MGTDcUqm55wePl+y6X7PHEOuQhrS0rA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50H0PMI4005059
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 18:25:22 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 18:25:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 18:25:22 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PLnq007059;
	Thu, 16 Jan 2025 18:25:22 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/6] flatbuffers: Remove this recipe
Date: Thu, 16 Jan 2025 18:25:15 -0600
Message-ID: <20250117002520.627504-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117002520.627504-1-afd@ti.com>
References: <20250117002520.627504-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 00:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15699

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


