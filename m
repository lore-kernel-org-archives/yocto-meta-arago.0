Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FD7C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 00:25:25 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.653.1737073523766592627
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 16:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qzgyvrRv;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50H0PMtX091984
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2025 18:25:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737073522;
	bh=+Xh/czLfygO0VRTu1RB+Ayw9Vs/ZpkPvzBndb8OVEgI=;
	h=From:To:CC:Subject:Date;
	b=qzgyvrRvlR9ktMNboCdjyY93Yh1U5BxglGR7ocVwQWC13/FyLH2Lbhodpyt0XqM6u
	 w6O45kycb5G8XqUIMKwLze8TtMNWfkeFRg35aVaKut/aRmLHkszUx1p1sVAfT3GRap
	 01Cd+MoeiA7YZeKkPu6xFPgsUKV6z5rArhBq0Vi8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PM3D094658;
	Thu, 16 Jan 2025 18:25:22 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 18:25:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 18:25:22 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PLnp007059;
	Thu, 16 Jan 2025 18:25:22 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 0/6] Add ONNX Runtime
Date: Thu, 16 Jan 2025 18:25:14 -0600
Message-ID: <20250117002520.627504-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 00:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15698

Hello all,

[2/6] is a v2 with a fixup so it only builds for ARMv7+.
[3/6] is already in -next but this is a small update, it can either
      replace the one in -next or I can resend as an update patch.
[4/6] is only needed for scarthgap, master should not need this one.

This all adds some initial support for ONNX Runtime for all devices
not just ones with DSP. For now, DSP support will still come from
meta-edgeai layer.

Thanks,
Andrew

Andrew Davis (6):
  flatbuffers: Remove this recipe
  meta-arago-extras: Add recipe for arm-compute-library
  meta-arago-extras: Add recipe for Arm NN
  meta-arago-extras: Backport abseil-cpp from meta-oe master
  meta-arago-extras: Add recipe for ONNX
  meta-arago-extras: Add recipe for ONNX Runtime

 .../0001-absl-always-use-asm-sgidefs.h.patch  |  38 ++++
 ...e-maes-option-from-cross-compilation.patch |  38 ++++
 ...e-neon-option-from-cross-compilation.patch |  49 +++++
 .../abseil-cpp/0004-abseil-ppc-fixes.patch    | 103 +++++++++
 ...-virtual-dtor-in-the-flags-are-neede.patch |  30 +++
 .../abseil-cpp/abseil-cpp_20240722.0.bb       |  54 +++++
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
 .../recipes-devtools/armnn/armnn_24.11.bb     |  85 ++++++++
 .../flatbuffers/flatbuffers_1.11.0.bb         |  34 ---
 ...age-Protobuf-before-checking-if-it-w.patch |  25 +++
 .../recipes-framework/onnx/onnx_1.16.1.bb     | 107 ++++++++++
 ...ble-permission-bit-from-source-files.patch |  72 +++++++
 ...-in-option-text-s-buildings-bindings.patch |  25 +++
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 +++
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  31 +++
 ...ake-Print-out-result-of-find_package.patch |  37 ++++
 .../onnxruntime/onnxruntime_1.20.1.bb         | 155 ++++++++++++++
 26 files changed, 1953 insertions(+), 34 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
 create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
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
 delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb

-- 
2.39.2


