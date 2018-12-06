Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A19A3520C0
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 21:59:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB6LwqW4025129
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544133532;
	bh=achPu0fO7FmmGkwZ9z00OFptlRd5tDnVU2PdARrgTpw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wAN1HrLEHgeTuy0Q8/+J6+HFaKXl65CtYRt7auw0YtxYogpiq5TlGn0s8TdKH6xrg
	Xjl3CrsZnZ8He4n0gpTUo3CDaGjElA5LRkDKOXxOcckgEQDEpQ779MAJVL437RTA3o
	CwOmtx8MlLAdeogG/rEKaFlk0Ltm2CFIqLe++zCU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB6Lwq98098632
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:52 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 6 Dec 2018 15:58:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 6 Dec 2018 15:58:52 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB6LwpcC031198
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 15:58:52 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Dec 2018 16:58:36 -0500
Message-ID: <1544133516-24053-2-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544133516-24053-1-git-send-email-qsu@ti.com>
References: <1544133516-24053-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH 2/2] tidl_apps: added Arm NN Matrix GUI demo examples
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
X-List-Received-Date: Thu, 06 Dec 2018 21:59:04 -0000
Content-Type: text/plain

Added two Arm NN demo examples with MobileNet network topology.
One example with live camera input and the other with video clip input.

Signed-off-by: Qin Su <qsu@ti.com>
---
 tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop       | 9 +++++++++
 tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html     | 5 +++++
 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh               | 3 +++
 tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop   | 9 +++++++++
 tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html | 5 +++++
 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh           | 3 +++
 6 files changed, 34 insertions(+)
 create mode 100644 tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
 create mode 100644 tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
 create mode 100644 tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
 create mode 100644 tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
 create mode 100644 tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
 create mode 100644 tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh

diff --git a/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop b/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
new file mode 100644
index 0000000..9317cb8
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/armnn_demo_livecam.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=Arm NN MobileNet Camera Input
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runArmnnLiveCam.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
diff --git a/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
new file mode 100644
index 0000000..db0c2bb
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/desc_armnn_demo_livecam.html
@@ -0,0 +1,5 @@
+<h1>Arm NN Demo with Live Camera Input</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) with MobileNet network topology based on Arm NN SDK.</p>
+<p>Single Arm core is used with live camera input (at 640x480 resolution).</p>
+<p>Exit demo by doing right-click on image window.</p>
diff --git a/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
new file mode 100644
index 0000000..68007f3
--- /dev/null
+++ b/tidl_apps/armnn_demo_livecam/runArmnnLiveCam.sh
@@ -0,0 +1,3 @@
+cd /usr/bin
+
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/camera_live_input -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
diff --git a/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop b/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
new file mode 100644
index 0000000..7d7a1a7
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/armnn_demo_staticimg.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=Arm NN MobileNet Real Common Objects
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runArmnnStaticImg.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
diff --git a/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html b/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
new file mode 100644
index 0000000..ad4c466
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/desc_armnn_demo_staticimg.html
@@ -0,0 +1,5 @@
+<h1>Arm NN Demo with Classification of Common Objects</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) with MobileNet network topology based on Arm NN SDK.</p>
+<p>Single Arm core is used with pre-recorded clip of common objects.</p>
+<p>Exit demo by doing right-click on image window.</p>
diff --git a/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
new file mode 100644
index 0000000..8b996ff
--- /dev/null
+++ b/tidl_apps/armnn_demo_staticimg/runArmnnStaticImg.sh
@@ -0,0 +1,3 @@
+cd /usr/bin
+
+./ArmnnExamples -f tensorflow-binary -i input -s '1 224 224 3' -o MobilenetV1/Predictions/Reshape_1 -d /usr/share/arm/armnn/testvecs/test2.mp4 -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb -c CpuAcc --number_frame 999900
-- 
1.9.1


