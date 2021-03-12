Return-Path: <aparnab@aparnab-office>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 048E352AA8
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 18:55:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CItIap032606
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 12:55:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615575318;
	bh=ioQj6xfHRiuEcyv8r3LtnPuQ4Ev13nX+h6AuuhUGpCw=;
	h=From:To:CC:Subject:Date;
	b=dLXCFAGa4/yQHM9Wva9cs+1DURv0AJ5Pf5eqa8N+zItYjarOLWgrn6yJebnaTHiA2
	MK4pef9TyFvV/Yp9I0LBPdUCa3VsLBcmFDSLBj3EYH0zK+VXKyBs+UTm9FkWQNv0Tx
	E/v81FsCiFrWPxTcAJ05vnPL1ii36r+ZQ0TTcG+0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CItIr6107789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 12:55:18 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 12:55:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 12:55:18 -0600
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CItIMh110240;
	Fri, 12 Mar 2021 12:55:18 -0600
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1lKmwQ-00018D-4j; Fri, 12 Mar 2021 12:55:18 -0600
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Fri, 12 Mar 2021 12:55:11 -0600
Message-ID: <20210312185511.4306-1-aparnab@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aparna Balasubramanian <aparnab@ti.com>
Subject: [master/dunfell PATCH v2] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 12 Mar 2021 18:55:03 -0000
Content-Type: text/plain

Includes ipc testcase fixes for k3 devices

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index d8eb5918..be8bea98 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r11"
+PR = "r12"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
+SRCREV = "3543cba63326976b5fb184c88b56158e91b7626a"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


