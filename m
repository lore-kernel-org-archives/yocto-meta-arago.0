Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4DB7E529AD
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:26:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ2vJ090474
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559589962;
	bh=nlRcE9Nwfwb87P9+eiLlKswbr3O4ySquiqIYqDHZIDc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Uma/RAMu48SFXvnner0KvLppjbFGIsQtvbF1VjBHIt8ZjnjnlmJXdDA+Oao2hfuSJ
	OvwxG64VHqXSjcGEbAK1eRLVgPdic3pytA2ZP4DNQmj05hi+1Gl03vYt66CJPFaYen
	vXh1ftz63oXlk8/XUImZkRFr9e1ICIL9Zt5sQ704=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JQ28a107725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:26:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:26:01 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ0c8100439;
	Mon, 3 Jun 2019 14:26:01 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 15:24:21 -0400
Message-ID: <20190603192424.23922-4-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603192424.23922-1-h-gou@ti.com>
References: <20190603192424.23922-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 3/6] pdm-anomaly-detection: predictive maintenance demo for anomaly detection
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
X-List-Received-Date: Mon, 03 Jun 2019 19:26:43 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../pdm-anomaly-detection_git.bb              | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb

diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
new file mode 100644
index 00000000..4e7b2bc0
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neural Network (RNN)"
+LICENSE = "BSD-3-Clause & MIT & GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
+
+inherit qt-provider
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "832c4021de19998c7e47e94e1868943c9a145489"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "qtbase qtdeclarative qtcharts"
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/pdm
+    install -m 755 RnnPdmAnomalyDetection ${D}${datadir}/ti/examples/pdm
+    install -m 644 ${S}/coeff.bin ${D}${datadir}/ti/examples/pdm
+    install -m 644 ${S}/logs/* ${D}${datadir}/ti/examples/pdm
+}
+
+FILES_${PN} += "${datadir}/ti/examples/pdm"
-- 
2.17.1


