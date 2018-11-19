Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 43719529AC
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 20:08:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAJK8T6h086438
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542658109;
	bh=C5m0yc0ONvCp+hEDkP8ymjqG6TYWfmhl7Q/1yU72YNA=;
	h=From:To:Subject:Date;
	b=BnlIwzn4JdJ8nk0DgKu147IKPRXodchGQJVpEjm7MPG3w0IUUIslrOszYDb3Q8tok
	nmaqoMDzalSNxM/2CxdS8Bb9YQyFc9PKzh8n5Lxy3HqrDjKlGzbq4o6AAhgEFtOxMr
	YuIb2MYeoYcMrTua3mkCJTUN2LcFc02C9x51YpGk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAJK8TNO060875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:08:29 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 19 Nov 2018 14:08:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 19 Nov 2018 14:08:29 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAJK8TaI000749
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:08:29 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Nov 2018 15:08:19 -0500
Message-ID: <1542658099-21040-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] armnn: added ARM-NN Matrix GUI demo examples in tidl_apps.
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
X-List-Received-Date: Mon, 19 Nov 2018 20:08:40 -0000
Content-Type: text/plain

added ARM-NN demo example 1 with MobileNet network topology and live camera input
added ARM-NN demo example 2 with MobileNet network topology and video clip input

Signed-off-by: Qin Su <qsu@ti.com>
---
 tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop       | 9 +++++++++
 tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html     | 5 +++++
 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh               | 3 +++
 tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop   | 9 +++++++++
 tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html | 5 +++++
 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh           | 3 +++
 6 files changed, 34 insertions(+)
 create mode 100755 tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
 create mode 100755 tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
 create mode 100755 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
 create mode 100755 tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
 create mode 100755 tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
 create mode 100755 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh

diff --git a/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop b/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
new file mode 100755
index 0000000..fb92d1f
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=ARM-NN MobileNet Camera Input
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runArmnnLiveCam.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
diff --git a/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
new file mode 100755
index 0000000..d305fa6
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
@@ -0,0 +1,5 @@
+<h1>ARM-NN MobileNet Demo with Live Camera Input</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) with MobileNet network topology based on ARM-NN.</p>
+<p>Single A15 core is used with live camera input (at 640x480 resolution).</p>
+<p>Exit demo by doing right-click on image window.</p>
diff --git a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
new file mode 100755
index 0000000..68007f3
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
@@ -0,0 +1,3 @@
+cd /usr/bin
+
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
diff --git a/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop b/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
new file mode 100755
index 0000000..e58567c
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=ARM-NN MobileNet Static Image Input
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runArmnnStaticImg.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
diff --git a/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html b/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
new file mode 100755
index 0000000..3515168
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
@@ -0,0 +1,5 @@
+<h1>ARM-NN MobileNet Demo with Video Clip Input</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) with MobileNet network topology based on ARM-NN.</p>
+<p>Single A15 core is used with pre-recorded clip of common objects.</p>
+<p>Exit demo by doing right-click on image window.</p>
diff --git a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
new file mode 100755
index 0000000..8b996ff
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
@@ -0,0 +1,3 @@
+cd /usr/bin
+
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
-- 
1.9.1


