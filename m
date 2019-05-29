Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 785EA529AB
	for <meta-arago@arago-project.org>;
	Wed, 29 May 2019 21:21:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4TLKaRa073016
	for <meta-arago@arago-project.org>; Wed, 29 May 2019 16:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559164836;
	bh=mWqCehfTD9gH52z70LAAv7zIOg9tbbFkRYRbHNrQBx8=;
	h=From:To:CC:Subject:Date;
	b=JoiBqs0wiWdjO3WKaiO0f84er7FHIhGE+yci2EVH4B25J4UL9YEI9pTlAcYh/d6uc
	9jqX87N2Q+psFlG9g4QJm8UKCjirD9BXNt1y/mt1kta8cjQKGqcZTuRnDflHeR7dj7
	tQhe92I6wenfpUezTDvx85mgT0IIfFt5qrcBajcg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4TLKZgY027099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 May 2019 16:20:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 29 May 2019 16:20:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 29 May 2019 16:20:35 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4TLKZ50026001;
	Wed, 29 May 2019 16:20:35 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 May 2019 17:19:30 -0400
Message-ID: <20190529211930.817-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [matrix-gui-v2-apps] [PATCH v4] Add analytics_submenu and analytics_pdm_anomaly_detection demo
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
X-List-Received-Date: Wed, 29 May 2019 21:21:12 -0000
Content-Type: text/plain

* A new icon image "analytics-icon.png" is also added

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v4 changes:
 * Rename generic name of /tmp/myfifo to /tmp/pdmfifo
 * Add more explanations on use of /tmp/pdmfifo

 .../analytics_pdm_anomaly_detection.desktop   |   9 ++++
 .../desc_analytics_pdm_anomaly_detection.html |  23 +++++++++
 .../runPdmAnomalyDetection.sh                 |  45 ++++++++++++++++++
 analytics_submenu/analytics.desktop           |   7 +++
 images/analytics-icon.png                     | Bin 0 -> 16715 bytes
 5 files changed, 84 insertions(+)
 create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/analytics_pdm_anomaly_detection.desktop
 create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html
 create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/runPdmAnomalyDetection.sh
 create mode 100644 analytics_submenu/analytics.desktop
 create mode 100644 images/analytics-icon.png

diff --git a/analytics_apps/analytics_pdm_anomaly_detection/analytics_pdm_anomaly_detection.desktop b/analytics_apps/analytics_pdm_anomaly_detection/analytics_pdm_anomaly_detection.desktop
new file mode 100644
index 0000000..111504c
--- /dev/null
+++ b/analytics_apps/analytics_pdm_anomaly_detection/analytics_pdm_anomaly_detection.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=PdM Anomaly Detection with RNN
+Icon=/usr/share/matrix-gui-2.0/apps/images/analytics-icon.png
+Exec=runPdmAnomalyDetection.sh
+Type=Application
+ProgramType=gui
+Categories=analytics
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html
diff --git a/analytics_apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html b/analytics_apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html
new file mode 100644
index 0000000..05924c4
--- /dev/null
+++ b/analytics_apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html
@@ -0,0 +1,23 @@
+<h1>Pdm Anomaly Detection with RNN </h1>
+
+<p>
+<span style="color:red">NOTE: The Qt/QML display of this demo is designed for 1920x1080 resolution. Please run the demo with a 1080p HDMI monitor.</span>
+</p>
+
+<h2>Purpose:</h2>
+<p>This application demonstrates Predictive Maintenance (PdM) using Recurrent Neural Network (RNN) for anomaly detection.
+A system model is established to predict the output from the input for the normal scenario,
+creating a high accuracy approximation of the physical system.
+If there are significant and continuous prediction errors, it indicates anomalies are happening. </p>
+
+<p>Sensor data (phase currents and angular position) from motor drive TI design (http://www.ti.com/tool/TIDEP0025) are recorded for this demo </p>
+
+<p>The RNN model is trained with normal scenario data: motor moves with velocity of 100 degree per second from 45 degree to 270 degree
+and back to 45, and so on so forth. </p>
+
+<p>The testing sequence used in this demo starts with the normal scenario data.
+The beginning data series are used for calibration to set the error threshold for anomaly detection.
+After that, the demo is looking for anomalies, which produce prediction error larger than the threshold.
+Anomalies for this demo are created by moving the rotor with a higher velocity of 150 degree per second. </p>
+
+<p>Exit demo by clicking x at the top right corner of the Qt windos</p>
diff --git a/analytics_apps/analytics_pdm_anomaly_detection/runPdmAnomalyDetection.sh b/analytics_apps/analytics_pdm_anomaly_detection/runPdmAnomalyDetection.sh
new file mode 100644
index 0000000..f0d17d9
--- /dev/null
+++ b/analytics_apps/analytics_pdm_anomaly_detection/runPdmAnomalyDetection.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+
+cd /usr/share/ti/examples/pdm
+
+exe=RnnPdmAnomalyDetection
+
+PID=`pidof $exe`
+
+if [ "x${PID}x" != "xx" ]
+then
+    kill -9 ${PID}
+fi
+
+rm -rf /tmp/pdmfifo
+
+# mean and std of the phase currents, to be used for normalization/denormalization
+mean_current1=-0.0001841035315
+mean_current2=0.004191935886
+std_current1=0.01918238488
+std_current2=0.01933241767
+# relative ratio to determine the error threshold: max_err(calibration)*relative_threshold
+relative_threshold=2
+./$exe $mean_current1 $mean_current2 $std_current1 $std_current2 $relative_threshold &
+
+PID=$!
+echo "RnnPdmAnomalyDetection running as Process id: ${PID}"
+
+# Stream the pre-recorded sensor data to the FIFO (/tmp/pdmfifo).
+# /tmp/pdmfifo is consumed by the demo binary to have an identical consumer,
+# while the writer to the fifo can be from any pre-recorded files or
+# UART streaming.
+cat ./normal100-anomaly150-normal100.log > /tmp/pdmfifo
+
+while :
+do
+    PID=`pidof $exe`
+    if [ "$PID" == "" ]
+    then
+       break
+    else
+       sleep 1
+    fi
+done
+
+exit 0
diff --git a/analytics_submenu/analytics.desktop b/analytics_submenu/analytics.desktop
new file mode 100644
index 0000000..649743f
--- /dev/null
+++ b/analytics_submenu/analytics.desktop
@@ -0,0 +1,7 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=Analytics
+GenericName=Analytics Demos
+Icon=/usr/share/matrix-gui-2.0/apps/images/analytics-icon.png
+Type=Directory
+X-MATRIX-CategoryTarget=analytics
diff --git a/images/analytics-icon.png b/images/analytics-icon.png
new file mode 100644
index 0000000000000000000000000000000000000000..b27033e21ac90a59efbd73a917525cd5bb158d27
GIT binary patch
literal 16715
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

literal 0
HcmV?d00001

-- 
2.17.1


