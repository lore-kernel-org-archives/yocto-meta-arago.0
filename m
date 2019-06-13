Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 399FC52991
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2019 21:18:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5DLHxZQ039814
	for <meta-arago@arago-project.org>; Thu, 13 Jun 2019 16:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560460679;
	bh=r1To8jndgHwqJsCkv1D/GfSpMLwLkCfqUfUPxrWYbrs=;
	h=From:To:CC:Subject:Date;
	b=PFAfnSUHFay/1EeDPM6DPTza69pJ6AVNLmA4o0mxBQnSkIUK9tDC7VdHU4wKD0BCD
	lxeDKXsYTnE+V1CTLovnD245nYKE+FdkBiYAKZQaukVmohzMxD6wxAmSiX2pYl/Fks
	qOyg3AYnO6o7NavfN1L0tG9Bo8UEzWt2hSJ9unP0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5DLHxMw005958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 13 Jun 2019 16:17:59 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 13 Jun 2019 16:17:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 13 Jun 2019 16:17:59 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5DLHw39042260;
	Thu, 13 Jun 2019 16:17:58 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Jun 2019 17:16:19 -0400
Message-ID: <20190613211619.19196-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master/ti2019.01] [PATCH] pdm-anomaly-detection: bump SRCREV
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
X-List-Received-Date: Thu, 13 Jun 2019 21:18:39 -0000
Content-Type: text/plain

* Improve on the console logging to avoid largely slowing down the Qt GUI display

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
index 3f07013c..266cabd9 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
 inherit qt-provider
 
 PV = "1.0"
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
 SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "01bca39e69cf2e73e17259a16b2465dde7cce6e9"
+SRCREV = "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


