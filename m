Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4722BC02188
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 21:20:03 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5925.1737148794446347099
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 13:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pRlyzW86;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJrYf252451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737148793;
	bh=wNWOaY86+gqoTr9ODlcjtK+025gA1Dhd6VUALLxanyQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pRlyzW86yH3IfviK3kC5ByE7SKjktC4S1w6gL97zwQfGaUU4BOVdSsSBF3Xw3cX+I
	 h96AOzKKPQIMnCYO6Aqvc+aoxEOQbadRJZzqn6X7HzrZVlXj2pflTE59oRFH2Jj6iX
	 /WgAUBm2SZHX/icREvFrTtHLeKMEnZZc8b2QxuhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJr9f112900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 15:19:53 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:19:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:19:52 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJp5h030757;
	Fri, 17 Jan 2025 15:19:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 4/5] opencv: Remove OpenCV customization and DISTRO_FEATURE
Date: Fri, 17 Jan 2025 15:19:50 -0600
Message-ID: <20250117211951.698377-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117211951.698377-1-afd@ti.com>
References: <20250117211951.698377-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 21:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15708

These customizations are leftover from when we had DSP acceleration
for OpenCV. Also "opencv" is not a DISTRO_FEATURE, it is a regular
library, if you need OpenCV for a package you should just DEPEND on it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../point-cloud-viewer/point-cloud-viewer_git.bb             | 4 ----
 meta-arago-distro/conf/distro/arago.conf                     | 5 ++---
 .../recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh     | 3 ---
 .../recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh     | 3 ---
 .../recipes-support/opencv/opencv/keystone/setupEnv.sh       | 3 ---
 meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh  | 2 --
 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend   | 3 ---
 7 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend

diff --git a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index 0388a2e0..d08e0f6b 100644
--- a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -3,10 +3,6 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
 
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES = "opencv"
-
 PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f1948523..baa526a9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -50,13 +50,12 @@ DISTRO_FEATURES:append = " pam wayland opengl"
 DISTRO_FEATURES:remove = "x11"
 #DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
-DISTRO_FEATURES:append = " opencv"
 DISTRO_FEATURES:append = " openmp"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
-DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
+DISTRO_FEATURES_FILTER_NATIVE:append = " opencl openmp"
+DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl openmp"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??= "0"
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
deleted file mode 100644
index 3ad25601..00000000
--- a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
-export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
-export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
deleted file mode 100644
index 3ad25601..00000000
--- a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
-export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
-export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
deleted file mode 100644
index 5b6bdb78..00000000
--- a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
-export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
-export OPENCV_OPENCL_DEVICE='TI KeyStone II:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
deleted file mode 100644
index 5bf7afd3..00000000
--- a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
-export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
deleted file mode 100644
index 2ee6bff7..00000000
--- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES = "opencv"
-- 
2.39.2


