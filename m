Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A97B052093
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2019 19:07:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1SJ7gjc030380
	for <meta-arago@arago-project.org>; Thu, 28 Feb 2019 13:07:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551380862;
	bh=PfSg8PfR82BBh27Nkbw8f9L+Y0JwUMA9zd0FU6hpnzM=;
	h=From:To:CC:Subject:Date;
	b=OQiIMZVAR+4rElMY+sMf7/m5i7W2CfG4IlDBIYVZv0FUy5mxwOheSUOQ5u36ECsSv
	aPgzOFKIwzCUdqF1bAEaQI0YwNoI5+vdstHZ4u1wUv9yB7Qeoksrl4cNw1/6quaLlC
	qqgmxQbLph/+ftBVUC1wtvkV0JO/dbtQuG2XAq84=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1SJ7gqR002158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 28 Feb 2019 13:07:42 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 28 Feb 2019 13:07:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 28 Feb 2019 13:07:42 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1SJ7gUd016228;
	Thu, 28 Feb 2019 13:07:42 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gzR1y-0004nw-5Y; Thu, 28 Feb 2019 13:07:42 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Feb 2019 13:07:39 -0600
Message-ID: <20190228190739.18431-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v1] matrix-gui-hmi-demos : folder name fix for hmi_mmwave
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
X-List-Received-Date: Thu, 28 Feb 2019 19:07:47 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index 41e14bd1..2ffb3d1c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -43,5 +43,5 @@ FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
 FILES_matrix-hmi-demo-protection-relays   = "${MATRIX_APP_DIR}/hmi_protection_relays/*"
 FILES_matrix-hmi-demo-protection-relays  += "${bindir}/runHmiProtectionRelays.sh"
 
-FILES_matrix-hmi-demo-mmwavegesture    = "${MATRIX_APP_DIR}/hmi_mmwavgesture/*"
+FILES_matrix-hmi-demo-mmwavegesture    = "${MATRIX_APP_DIR}/hmi_mmwave/*"
 FILES_matrix-hmi-demo-mmwavegesture  += "${bindir}/runHmiMmWave.sh"
-- 
2.13.0


