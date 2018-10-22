Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8EDE152092
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2018 18:25:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9MIOw0e052279
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2018 13:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1540232698;
	bh=zYCfZDgCOHF5kiDE7mzru4GVQv4jpufFzBnNRhPOTO8=;
	h=From:To:CC:Subject:Date;
	b=ay2K4L39/CFC6Nnp8WqIvIA2gtzZkIdHpZcBQjMuznMlvJHVqBPPBqePGc1cfq5XA
	c74KD3iToDopK1KzlRby1GSLnB0ZLcDKYukc+6aimgAv+6oXZGWCoEWQBV16dHxaB8
	OS3AE+bqdK8m0Whx51h356z25m8jAxN/SoBJBHKg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9MIOwpv028235
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2018 13:24:58 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 22 Oct 2018 13:24:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 22 Oct 2018 13:24:58 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9MIOwl1000574;
	Mon, 22 Oct 2018 13:24:58 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gEesp-0001Es-Iw; Mon, 22 Oct 2018 13:24:57 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Oct 2018 13:24:52 -0500
Message-ID: <20181022182452.3726-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] hmi_apps : hmi_mmwave : Add matrix icon for Gesture controlled HMI
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
X-List-Received-Date: Mon, 22 Oct 2018 18:25:13 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html |  8 ++++++++
 hmi_apps/hmi_mmwave/hmi_mmwave.desktop   | 12 ++++++++++++
 hmi_apps/hmi_mmwave/runHmiMmWave.sh      |  9 +++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
 create mode 100644 hmi_apps/hmi_mmwave/hmi_mmwave.desktop
 create mode 100755 hmi_apps/hmi_mmwave/runHmiMmWave.sh

diff --git a/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
new file mode 100644
index 0000000..b8608e2
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
@@ -0,0 +1,8 @@
+<h1> mmWave Gesture Controlled HMI Example </h1>
+
+<p> This example demonstrates HMI control using gesture from mmWave IWRxxxx sensor. </p>
+<p> mmWave sensor IWRxxxx reads and processes motion and gesture data and reports the gesture to the Sitara device over the Serial port. </p>
+<p> Sitara device parses the gesture and  control the HMI. </p>
+
+</p>
+
diff --git a/hmi_apps/hmi_mmwave/hmi_mmwave.desktop b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
new file mode 100644
index 0000000..2077a35
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
@@ -0,0 +1,12 @@
+#!/usr/bin/env xdg-open
+
+[Desktop Entry]
+Name=MmWave Gesture Controlled HMI
+GenericName=Demo App
+Icon=/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
+Exec=/usr/bin/runHmiMmWave.sh
+Type=Application
+ProgramType=gui
+Categories=hmi
+X-MATRIX-Lock=hmi_mmwave_lock
+X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/hmi_mmwave/desc_hmi_mmwave.html
diff --git a/hmi_apps/hmi_mmwave/runHmiMmWave.sh b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
new file mode 100755
index 0000000..a37fc74
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+/etc/init.d/weston stop
+sleep 1
+
+mmwavegesture -platform eglfs
+
+/etc/init.d/weston start
+sleep 1
-- 
2.13.0


