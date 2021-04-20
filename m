Return-Path: <aparnab@aparnab-office>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 0581652B58
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 16:46:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13KGlCAP041623
	for <meta-arago@arago-project.org>; Tue, 20 Apr 2021 11:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618937232;
	bh=eHkKJxPNqwfaak7Q3jbMdj3DkslETb9fhzxDzeR1jgE=;
	h=From:To:CC:Subject:Date;
	b=D3cR4bHtN1ftPWr0vKxfACxYvf/8DVUDpK4jx5qlYRLpes7oKi1DkGo6Sc7EM2KRc
	9DG4ljJQwKt338uVwc4OWiLT/OcVuviAEGNgId5SbsPMl9OeZqqMcHcx00Ey3qdth7
	sQq4K/WkPBAHopObwBl97+J9BhkW3NlgrAMVKVUQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13KGlCEQ096628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Apr 2021 11:47:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 20 Apr 2021 11:47:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 20 Apr 2021 11:47:11 -0500
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13KGlBEM126048;
	Tue, 20 Apr 2021 11:47:11 -0500
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1lYtWp-0000g4-FY; Tue, 20 Apr 2021 11:47:11 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>, <nm@ti.com>
Date: Tue, 20 Apr 2021 11:47:08 -0500
Message-ID: <20210420164708.2562-1-aparnab@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aparna Balasubramanian <aparnab@ti.com>
Subject: [master/dunfell PATCH] Rebase to ltp 20210121
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
X-List-Received-Date: Tue, 20 Apr 2021 16:46:46 -0000
Content-Type: text/plain

Update ltp to latest ltp tag 20210121

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210121.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210121.bb} (94%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
similarity index 94%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
index 7c9d50fd..db3e6a36 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r13"
+PR = "r0"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "31f9cfa61ae4102da6fa87f624130096c09d63a2"
+SRCREV = "585fd7f640a9bc9fd77eec4991e097ba069908ea"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


