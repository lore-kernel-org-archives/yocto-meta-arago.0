Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CFE1B52970
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 14:47:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84Eki51118513
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 09:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567608404;
	bh=afYU2IGp3QF5c//dUwS781A1yirRluCSV6g3LMoUETs=;
	h=From:To:CC:Subject:Date;
	b=rAkYycnkZz0ra5EDdXwOV3d/fNP9LIHhruu0P7wokvEnHd4/h7ojnOzMPzVTxgtJK
	APTJ/kYif06paVy5szpK+pvUXFYlhWQKuUGiQghcI0cJ33eakgtFgb6Xk4KjE4EFiM
	BXJLB2SPeqMzvhng07wLG9k2Vqq1w6cTye5R3+S0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84Ekihn031522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 09:46:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 4 Sep 2019 09:46:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 4 Sep 2019 09:46:43 -0500
Received: from UDA0869574A.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84Ekh9w100881;
	Wed, 4 Sep 2019 09:46:43 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Sep 2019 10:46:14 -0400
Message-ID: <20190904144614.31641-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Wed, 04 Sep 2019 14:47:48 -0000
Content-Type: text/plain

* bug fixes and config files update in tidl import tool

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 6fdeec48..64667e59 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,6 +1,4 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "b2466e02f99d85d8afcbc93edc612da5cc9345de"
-
+SRCREV = "23d158e4f18a3391e0d836bb3bd9a7c7c7ada7ee"
 PV = "01.01.02.00"
-PR = "r0"
-
+PR = "r1"
-- 
2.17.1


