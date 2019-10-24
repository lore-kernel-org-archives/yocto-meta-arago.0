Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C0B9F52A1E
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2019 17:02:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0uWr016753
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571936456;
	bh=VqTgoZ3iWj0zPr7cImgFT20RyJI7pUJ3k7pJQuUuqYE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OeXm5WxSIFY5c9LNoss6G6Lt8wxzCREWWsNIVroOFVq2bodFmhM2AgCMaOdzhGd3J
	4RwSBVxEF2LR9/TV74fvQ0tOoMXufo/39cx9pR7/6xuD6pmnGSi2SNcEkhKTGBMOri
	q+nIRynIXP+KxiTpUlJytwpHZ6disDe64FSwpgJY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9OH0u01010556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:56 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 24 Oct 2019 12:00:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 24 Oct 2019 12:00:45 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0m34129790;
	Thu, 24 Oct 2019 12:00:55 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Oct 2019 12:58:13 -0400
Message-ID: <20191024165813.21958-4-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024165813.21958-1-a0271529@ti.com>
References: <20191024165813.21958-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 3/3] armnn: udpate with tensorflow lite version 1.15.0
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
X-List-Received-Date: Thu, 24 Oct 2019 17:02:15 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-support/armnn/armnn_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 261d4f63..f022ef9f 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-PR = "r2"
+PR = "r3"
 PV = "19.08"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
@@ -65,9 +65,9 @@ EXTRA_OECMAKE=" \
     -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
     -DONNX_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-onnx \
     -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 -DBUILD_ONNX_PARSER=1 -DBUILD_TF_LITE_PARSER=1 \
-    -DTF_LITE_GENERATED_PATH=${STAGING_DIR_HOST}${includedir}/tensorflow/contrib/lite/schema \
+    -DTF_LITE_GENERATED_PATH=${STAGING_DIR_HOST}${includedir}/tensorflow/lite/schema \
     -DFLATBUFFERS_ROOT=${STAGING_DIR_HOST}${includedir}/flatbuffers \
-    -DFLATBUFFERS_LIBRARY=${STAGING_DIR_HOST}${libdir}/libflatbuffers.a \
+    -DFLATBUFFERS_LIBRARY=${STAGING_DIR_HOST}${libdir}/libflatbuffers.so \
     -DARMCOMPUTENEON=1 \
     -DBUILD_TESTS=1 -DPROFILING=1 \
     -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
-- 
2.17.1


