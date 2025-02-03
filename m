Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C11C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:00:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.96256.1738609196558794632
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 10:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9Mn5bJy;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513IxtUS2190314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 12:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738609195;
	bh=OYna15UiM15t03IOifdnQ3Fo8wkU8DPm0h/1O/LiOTo=;
	h=From:To:CC:Subject:Date;
	b=F9Mn5bJynsA29TY3yJUUnjgLXS3Oe1d+G5AdtN/D1IiaHvmYznFjoMikmY2p/O0aa
	 WS8M4uw0goqO8ko/4FocYUFjdIDY+/VIMiYfVjwpW5QjxzK/Cf5IROacQyidzjJ6C7
	 HvOUtxe5asuaHBJOj5Ujiq0zQg+jmccZxi9xUygQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Ixtca069805;
	Mon, 3 Feb 2025 12:59:55 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 12:59:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 12:59:54 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Ixsp2123822;
	Mon, 3 Feb 2025 12:59:54 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 0/4] Add ML frameworks
Date: Mon, 3 Feb 2025 12:59:49 -0600
Message-ID: <20250203185953.269693-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 19:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15795

Hello all,

This series adds ACL, ArmNN, ONNX, and ONNX Runtime ML frameworks and
tools. It is a replacement for a couple previous series for the same
but now based on the latest scarthgap-wip.

Thanks,
Andrew

Andrew Davis (4):
  meta-arago-extras: Add recipe for arm-compute-library
  meta-arago-extras: Add recipe for Arm NN
  meta-arago-extras: Add recipe for ONNX
  meta-arago-extras: Add recipe for ONNX Runtime

 ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
 ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
 ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
 ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
 ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
 .../arm-compute-library_24.12.bb              |  89 ++++++++
 ...01-Fix-type-casting-for-32bit-builds.patch |  40 ++++
 .../recipes-devtools/armnn/armnn_24.11.bb     |  70 +++++++
 ...age-Protobuf-before-checking-if-it-w.patch |  25 +++
 ...-export-internal-targets-directories.patch |  28 +++
 .../recipes-framework/onnx/onnx_1.16.1.bb     | 107 ++++++++++
 ...ble-permission-bit-from-source-files.patch |  72 +++++++
 ...-in-option-text-s-buildings-bindings.patch |  25 +++
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 +++
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  31 +++
 ...ake-Print-out-result-of-find_package.patch |  37 ++++
 .../onnxruntime/onnxruntime_1.20.1.bb         | 155 ++++++++++++++
 20 files changed, 1654 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb

-- 
2.39.2


