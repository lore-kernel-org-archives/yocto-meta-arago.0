Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8BF1E52A1A
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 17:08:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IH78c1120668
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 12:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568826428;
	bh=RpYr5270GRBESErlEqAR3rMAyqs6S3EaLqB3IinBVIA=;
	h=From:To:CC:Subject:Date;
	b=yMig15UDnYOlVL1/MJiJDwy6hpOLsaYKbgXWxlZsXSNpJVF/bkMP7gY/Xqt17Z7RF
	t55gE+L+fM/HTDBe5ZXgOgsPYQ/FxHEvsLb+TXjln9YifdhhSpUWpaLiiRf4AyWJYc
	8TvzM0lUdwlA60uPV9urtRV/KhcgFTN1Nl3lhIng=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IH78co030467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 12:07:08 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 12:07:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 12:07:04 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IH77Pe111310;
	Wed, 18 Sep 2019 12:07:08 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 13:05:59 -0400
Message-ID: <20190918170559.30027-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] armnn_demo*: update the scripts to run ArmnnExamples with TFLite parser
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
X-List-Received-Date: Wed, 18 Sep 2019 17:08:20 -0000
Content-Type: text/plain

* The model is also updated to mobilenet v2 (mobilenet_v2_1.0_224.tflite)

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh     | 2 +-
 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
index bd1749f..247427e 100644
--- a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
+++ b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
@@ -1,3 +1,3 @@
 cd /usr/bin
 
-./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999
+./ArmnnExamples -f tflite-binary -i input -s '1 224 224 3' -o MobilenetV2/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v2_1.0_224.tflite -c CpuAcc --number_frame 999
diff --git a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
index e42c9d6..298fe93 100644
--- a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
+++ b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
@@ -1,3 +1,3 @@
 cd /usr/bin
 
-./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999
+./ArmnnExamples -f tflite-binary -i input -s '1 224 224 3' -o MobilenetV2/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v2_1.0_224.tflite -c CpuAcc --number_frame 999
-- 
2.17.1


