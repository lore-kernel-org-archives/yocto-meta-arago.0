Return-Path: <subhajit_paul@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D3567520E3
	for <meta-arago@arago-project.org>;
	Mon,  7 Sep 2020 06:40:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0876bR3u119149
	for <meta-arago@arago-project.org>; Mon, 7 Sep 2020 01:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599460647;
	bh=gbF0MLLlZaYTFcNfYUkHZpYAhaQgrMveajyrwOl4SvU=;
	h=From:To:CC:Subject:Date;
	b=hdNwKSAXcn4cPHQC7wxOmDaSmeKKQ975hL3rCor10eGyt9LLhQQlnD+R3P5RsvZoO
	LcxIwJ+ojuUdsTgTgKJB2U/kMj2T3aY8u2tNyLirkR1Ncgc5ysziAcAL1HCTIH7kQT
	xo1rfhnQJgYRHdgdXc3QtC7AbcvGkXKQTz+GkZ0Y=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0876bRxK009019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 7 Sep 2020 01:37:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 7 Sep 2020 01:37:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 7 Sep 2020 01:37:27 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0876bOeC054087;
	Mon, 7 Sep 2020 01:37:25 -0500
From: Subhajit Paul <a0132170@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <dmurphy@ti.com>
Date: Mon, 7 Sep 2020 12:07:17 +0530
Message-ID: <20200907063717.20038-1-a0132170@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Subhajit Paul <a0132170@ti.com>
Subject: [dunfell PATCH] tisdk-default-image: add opencv
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2020 06:40:21 -0000
Content-Type: text/plain

Signed-off-by: Subhajit Paul <a0132170@ti.com>
---
 .../images/tisdk-default-image.bb             | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index ce4287ae..3b3a61b5 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -24,6 +24,43 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ti-analytics \
     ti-demos \
+    python3-opencv \
+    libopencv-aruco-dev \
+    libopencv-bgsegm-dev \
+    libopencv-bioinspired-dev \
+    libopencv-calib3d-dev \
+    libopencv-ccalib-dev \
+    libopencv-core-dev \
+    libopencv-face-dev \
+    libopencv-features2d-dev \
+    libopencv-flann-dev \
+    libopencv-fuzzy-dev \
+    libopencv-hfs-dev \
+    libopencv-highgui-dev \
+    libopencv-img-hash-dev \
+    libopencv-imgcodecs-dev \
+    libopencv-imgproc-dev \
+    libopencv-line-descriptor-dev \
+    libopencv-ml-dev \
+    libopencv-objdetect-dev \
+    libopencv-optflow-dev \
+    libopencv-photo-dev \
+    libopencv-plot-dev \
+    libopencv-quality-dev \
+    libopencv-reg-dev \
+    libopencv-rgbd-dev \
+    libopencv-saliency-dev \
+    libopencv-sfm-dev \
+    libopencv-shape-dev \
+    libopencv-stitching-dev \
+    libopencv-structured-light-dev \
+    libopencv-surface-matching-dev \
+    libopencv-tracking-dev \
+    libopencv-video-dev \
+    libopencv-videoio-dev \
+    libopencv-xfeatures2d-dev \
+    libopencv-ximgproc-dev \
+    libopencv-xphoto-dev \
 "
 
 export IMAGE_BASENAME = "tisdk-default-image"
-- 
2.17.1


