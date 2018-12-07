Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8C30D520C0
	for <meta-arago@arago-project.org>;
	Fri,  7 Dec 2018 16:17:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB7GHFT7078118
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 10:17:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544199435;
	bh=9RgI3wqPaHbig+1Vk0HtT23CqMF+4K6YOA68Y+qpZec=;
	h=From:To:Subject:Date;
	b=SlvZKFOeeUm2Ug35oRrtddgtQ4kno/p1adQCRPvmwIxcxMqMpTPG2ZBrppb6Yx9ZP
	HQlY3wFHyafPvFOmphwcxgyXGuoKvRHSqMUCXGzP35C3wHJdOdlDt5pkMWh99f3vJn
	7Yh5QnQkIMA/EbNZCF002kZ5/GxW9GLOwJKAsRsw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB7GHF2x070509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 10:17:15 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 7 Dec 2018 10:17:14 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 7 Dec 2018 10:17:14 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB7GHEpY005370
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 10:17:14 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Dec 2018 11:17:12 -0500
Message-ID: <1544199432-4952-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] tidl_apps: update Arm NN demo examples
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
X-List-Received-Date: Fri, 07 Dec 2018 16:17:27 -0000
Content-Type: text/plain

Add more description in demo with camera input & reduced test loop count.

Signed-off-by: Qin Su <qsu@ti.com>
---
 tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html | 3 +++
 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh           | 2 +-
 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh       | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
index db0c2bb..6bfe303 100644
--- a/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
+++ b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
@@ -3,3 +3,6 @@
 <p>This application demonstrates Deep Learning Imagenet classification (1000 classes) with MobileNet network topology based on Arm NN SDK.</p>
 <p>Single Arm core is used with live camera input (at 640x480 resolution).</p>
 <p>Exit demo by doing right-click on image window.</p>
+<p>
+<span style="color:red">NOTE: Please make sure Camera card is connected to the main processor board. </span>
+</p>
diff --git a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
index 68007f3..bd1749f 100644
--- a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
+++ b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
@@ -1,3 +1,3 @@
 cd /usr/bin
 
-./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999
diff --git a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
index 8b996ff..e42c9d6 100644
--- a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
+++ b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
@@ -1,3 +1,3 @@
 cd /usr/bin
 
-./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999
-- 
1.9.1


