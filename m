Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 77A49529F0
	for <meta-arago@arago-project.org>;
	Fri, 16 Jul 2021 21:01:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GL1bFr054805;
	Fri, 16 Jul 2021 16:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626469297;
	bh=kW3iKLe5pGESeCJ4/zPUCTFDw/wbWBu7Bg4DGMRtYj0=;
	h=From:To:Subject:Date;
	b=Ghbi0uRRzPItxzYZluYXZmPT6eP8tzIrGP4hOwRcGZ19U5oxJCOz02tDatmxA15bZ
	O6ZdPhigr2THRYrYeIMbpad2OF0vUabbfxv536gRRID9x79p1rrCQztiQ4mFzxqbnR
	rqY4ve2icez6aW9nTMTjhUmakYIZOyw8CYMZG9yQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GL1biG021937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 16:01:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Jul 2021 16:01:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 16 Jul 2021 16:01:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GL1a55030762;
	Fri, 16 Jul 2021 16:01:36 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, <meta-arago@arago-project.org>
Date: Fri, 16 Jul 2021 21:01:36 +0000
Message-ID: <20210716210136.4430-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] ltp-ddt: Update to latest srcrev for 08.00.00.003
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
X-List-Received-Date: Fri, 16 Jul 2021 21:01:28 -0000
Content-Type: text/plain

Update the ltp-ddt to latest for 08.00.00.003 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 3051b58c..bdc23dd9 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "21b2b2e3ce3d30a685cd64c05cfd5920eca9be21"
+SRCREV = "02f6995cd7df25269a3bb3b67736d19bccaac99f"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


