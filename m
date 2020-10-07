Return-Path: <aparnab@aparnab-office>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 59F1A520E5
	for <meta-arago@arago-project.org>;
	Wed,  7 Oct 2020 16:01:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097Fw6Cs103358
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 10:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602086286;
	bh=Ze7FHP02TDle/p+p6qVkbkqc55L+OgDTomJQoNgiy4o=;
	h=From:To:CC:Subject:Date;
	b=WuLpkUZAE1bkJjRVnCqVDEcYNKCl514OAIC752ZD3quDQWgxt3nGAsm98bNXvkhh9
	W/JBzL3k+L0dj21GH/SQWcFIDpVfVZNe1f7qjBVL27H85UbrPe7ClKqCvl2FjoUeRz
	ZQBIqkm5PZ4haRDlUEZMarohBtpvkRTKICCXfITk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097Fw6rF128446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 10:58:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 7 Oct 2020 10:58:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 7 Oct 2020 10:58:05 -0500
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097Fw586007501;
	Wed, 7 Oct 2020 10:58:05 -0500
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1kQBpN-0008WP-LY; Wed, 07 Oct 2020 10:58:05 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <dmurphy@ti.com>
Date: Wed, 7 Oct 2020 10:57:58 -0500
Message-ID: <20201007155758.32716-1-aparnab@ti.com>
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
X-List-Received-Date: Wed, 07 Oct 2020 16:01:07 -0000
Content-Type: text/plain

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 56a644e..fb0382d 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r5"
+PR = "r6"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "9d8d90a7cba25bb1e61b41075ec4eab9bfc19d3d"
+SRCREV = "ec5af0cc27ccf2481ccee77dfed5edc21a805b91"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.7.4


