Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 05819529AB
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2019 22:49:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARMlu1p041652
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574894876;
	bh=CVtQQkbcoUCnliLjm6gUmkPT+UxapSa1pULPXR2taYQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kz+1giQ3Rs5S5QiSR25LQ5NF9fbOySFDtrSYQbZEomTznKRgxjFx/rgSuxiWU1ZPZ
	QE9AnC1WzKtPoSjxUEi4WCHBePNnZfJ0/dPtRtt94KoFWEsBKUNelMVAM3iu8hVM45
	8+bIEGu5XRyVoQcVaGa+JLw2f0WIn0c5FE39rOhc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xARMlunO112795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:56 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 27 Nov 2019 16:47:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 27 Nov 2019 16:47:55 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARMltHR058284
	for <meta-arago@arago-project.org>; Wed, 27 Nov 2019 16:47:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Nov 2019 17:47:23 -0500
Message-ID: <20191127224723.63994-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127224723.63994-1-e-ruei1@ti.com>
References: <20191127224723.63994-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/mastr][PATCH 2/2] omapdrmtest: bump SRCREV to pickup the latest change
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
X-List-Received-Date: Wed, 27 Nov 2019 22:49:26 -0000
Content-Type: text/plain

- update LDFLAGS at Makefile for Mesa-based EGL

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 079663e7..68a8efe7 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -9,8 +9,8 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x"
 
 inherit autotools pkgconfig
 
-PR = "r28"
-SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
+PR = "r29"
+SRCREV = "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.17.1


