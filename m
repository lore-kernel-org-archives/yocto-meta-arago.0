Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5C78B529AD
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 21:36:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53La1pS127730
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559597761;
	bh=CuhDLHoMNDZBoQGiDskkCEkEuroEfCAR1TvjXXUxuSc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VUGaD8r6sl7yhbct/fKt+QPkPL5gdsG4X41WA14KOcjO/tPzLa4C2ZsKpQheDrEbQ
	Ck008s3zilkCVpC9vR0BOEhUdX5/I3zQCK7cGbHZ2Da4isNVqMuHgBIPoeesSPzkOs
	woPfH59IBi1elt56JGeA120kIvH7pPcc6fKUAfIo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53La1ia099810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:01 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 16:36:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 16:36:01 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53La0V8022105;
	Mon, 3 Jun 2019 16:36:01 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 17:34:44 -0400
Message-ID: <20190603213445.13887-4-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603213445.13887-1-h-gou@ti.com>
References: <20190603213445.13887-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 3/4] matrix-gui-analytics-demos: add predictive maintenance demo for anomaly detection
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
X-List-Received-Date: Mon, 03 Jun 2019 21:36:39 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../matrix/matrix-gui-analytics-demos_2.0.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
new file mode 100644
index 00000000..c77a6654
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Analytics demo descriptions for Matrix v2"
+HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/analytics_apps"
+
+# Make sure analytics submenu and app images has been installed
+ANALYTICSDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-analytics"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+PACKAGES = "matrix-analytics-pdm-anomaly-detection \
+"
+
+RDEPENDS_matrix-analytics-pdm-anomaly-detection = " \
+    bash \
+    ${ANALYTICSDEMO_RDEPENDS} \
+    pdm-anomaly-detection \
+"
+
+FILES_matrix-analytics-pdm-anomaly-detection = "${MATRIX_APP_DIR}/analytics_pdm_anomaly_detection/*"
+FILES_matrix-analytics-pdm-anomaly-detection += "${bindir}/runPdmAnomalyDetection.sh"
-- 
2.17.1


