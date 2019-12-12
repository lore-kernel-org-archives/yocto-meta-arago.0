Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7F0AD529A8
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 16:27:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCGPdAk042482
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 10:25:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576167939;
	bh=mnhuVIup1ins6OjpE6DvEM7+ml5uh3j4cnFJcOqW5yk=;
	h=From:To:CC:Subject:Date;
	b=hf5OpWl4Sld2yUoSaY7BJnlr3XHDR0/9/Va7lR0UV2jIAOVX758sWpSqhFPM4VuFw
	StWYdgJalVmS42Wc1cw5BvvobjKyA+kN8FnSNDXGQUnnNbE5zKQC3YUEb0ylt/NSmu
	lngQwRhOB1OJzpOR7Qqjei8ISk0NMrCXBdijJ5RU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCGPdIt035881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 10:25:39 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 10:25:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 10:25:38 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCGPcIb085238;
	Thu, 12 Dec 2019 10:25:38 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 11:21:00 -0500
Message-ID: <20191212162100.13167-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [PATCH] armnn_demo_livecam: set the default video port according to machine type
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
X-List-Received-Date: Thu, 12 Dec 2019 16:27:15 -0000
Content-Type: text/plain

* For AM5, /dev/video0 has been reserved for VPE. Therefore, set the default video port
  for camera capture as /dev/video1 for AM5, and /dev/video0 for the others.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
index 247427e..b01cfa7 100644
--- a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
+++ b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
@@ -1,3 +1,12 @@
 cd /usr/bin
 
-./ArmnnExamples -f tflite-binary -i input -s '1 224 224 3' -o MobilenetV2/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v2_1.0_224.tflite -c CpuAcc --number_frame 999
+machine_type="`cat /etc/hostname`"
+video_port=0
+
+if [ "$machine_type" = "am57xx-evm" ] || [ "$machine_type" = "am57xx-hs-evm" ]; then
+    video_port=1
+fi
+
+echo "Camera capture on /dev/video$video_port..."
+
+./ArmnnExamples -f tflite-binary -i input -s '1 224 224 3' -o MobilenetV2/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input$video_port -m /usr/share/arm/armnn/models/mobilenet_v2_1.0_224.tflite -c CpuAcc --number_frame 999
-- 
2.17.1


