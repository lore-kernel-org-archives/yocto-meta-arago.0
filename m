Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46E2E7718D
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.156262.1734713354068819122
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 08:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x/3sz9Tn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGnCrj099398;
	Fri, 20 Dec 2024 10:49:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734713352;
	bh=z+6A7QVr/wAtExqZWGxvycrdD82oy1HHw7vMJ6jlMQs=;
	h=From:To:CC:Subject:Date;
	b=x/3sz9Tn67OZhLvlLNIFDBKe4eSogDpaOsLrDbWMcPvT5DVk/+yuA3LN8togqPC2F
	 Vkb8LMN7Mwo+ql8rCoqX3BmTP07JylzsNQFgHGMoxpxZWpwPXLzh6lm0x8tb2GdY6/
	 zg1TJvcQbcskWy/uVBJ8bYpOK2ZQlbPdKPPzxxRw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGnCeL055612;
	Fri, 20 Dec 2024 10:49:12 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 10:49:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 10:49:11 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGnBgh123677;
	Fri, 20 Dec 2024 10:49:11 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 0/2] Add ARM Compute Library
Date: Fri, 20 Dec 2024 10:49:08 -0600
Message-ID: <20241220164910.318809-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Dec 2024 16:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15677

Hello all,

This series adds support for arm-compute-library which will be used
as the base for several other ARM based ML frameworks and apps.

This package will be sent for inclusion in meta-arm as it is ARM
produced and supported software. This will be done after the patches
here for ACL are taken into the project's upstream. We can drop
this out of meta-arago master after that.

Thanks,
Andrew

Andrew Davis (2):
  flatbuffers: Remove this recipe
  meta-arago-extras: Add recipe for arm-compute-library

 ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
 ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
 ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
 ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
 ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
 .../arm-compute-library_24.12.bb              |  79 +++++++
 .../flatbuffers/flatbuffers_1.11.0.bb         |  34 ---
 .../recipes-core/packagegroups/ti-test.bb     |   1 +
 11 files changed, 1023 insertions(+), 34 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb

-- 
2.39.2


