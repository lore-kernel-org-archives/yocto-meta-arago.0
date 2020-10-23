Return-Path: <aparnab@aparnab-office>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A3CC452999
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 21:14:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NLBlpL054649
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 16:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603487507;
	bh=wYvknkXn8qEQwZd3Xdv5zl6XCHU/DJpLMcAwns2EcYU=;
	h=From:To:CC:Subject:Date;
	b=uSznaKnOqOFB5JbOt70KkcuiFfHoj5zrjB7/VjEbCNf1NPV0OM146xusdiwCs/iTP
	Z5eo3ieGj522e/KsAkWtwN6d9uIeYmevc4Uq6pLKQ8q0KPGYipy4kLwSrrKpy1Qne/
	pUM6V2VOkzd69jBplS1zcRaXrQmKDsoOPgsHK0w8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NLBlqV086613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 16:11:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 16:11:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 23 Oct 2020 16:11:47 -0500
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NLBlfE091173;
	Fri, 23 Oct 2020 16:11:47 -0500
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1kW4Lj-00056P-1h; Fri, 23 Oct 2020 16:11:47 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <dmurphy@ti.com>
Date: Fri, 23 Oct 2020 16:11:41 -0500
Message-ID: <20201023211141.19571-1-aparnab@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aparna Balasubramanian <aparnab@ti.com>
Subject: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 23 Oct 2020 21:14:53 -0000
Content-Type: text/plain

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index fb0382da..bcc8f958 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r6"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "ec5af0cc27ccf2481ccee77dfed5edc21a805b91"
+SRCREV = "e97fb1c59cbafc944e38de588cdc2565948116ef"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


