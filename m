Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7B8F7529FD
	for <meta-arago@arago-project.org>;
	Tue, 11 Jun 2019 22:20:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BMKHZ7123616
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 17:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560291617;
	bh=mFWToBBnwj2v8RUa0t42zP+E7/iM89xrqK3IQB1Fh84=;
	h=From:To:CC:Subject:Date;
	b=uQL3LnINH6VDzVGGq9hSRZxKqjKeXs1eaWVNIIwARfWevnWm0zOxfU2ZBYoBRvvhQ
	o7H61837kUXZAqcGx57w2xwf1pUPrqVLz9hX/f8s0Y5XjADn78BNq4F8YjqNNTpmkU
	b+ndbhuv5tz5MOIs6u5fUBSoK/sXWKNUvfJGPh64=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BMKHuj020203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 17:20:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 11 Jun 2019 17:20:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 11 Jun 2019 17:20:17 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BMKHbP062566;
	Tue, 11 Jun 2019 17:20:17 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Jun 2019 17:59:40 -0400
Message-ID: <20190611215940.26526-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01] [PATCH] pdm-anomaly-detection: bump SRCREV
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
X-List-Received-Date: Tue, 11 Jun 2019 22:20:59 -0000
Content-Type: text/plain

* Remove the hardcoding on using a single LSTM layer
* Add console printfs for anomaly detection status and results

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
index 4e7b2bc0..3f07013c 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
 inherit qt-provider
 
 PV = "1.0"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "832c4021de19998c7e47e94e1868943c9a145489"
+SRCREV = "01bca39e69cf2e73e17259a16b2465dde7cce6e9"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


