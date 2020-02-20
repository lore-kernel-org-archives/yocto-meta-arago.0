Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3D7B6529F9
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG9qi129857
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226169;
	bh=JQj7lJiDCFCMTz64XaPIYx4I/7fi3hTemXbXKT9oRjI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gqd01pe2Jj4aW6JNH5nGK+IOJiSRynO0hCoLoLicFYaY/amAQnZwgUdwvsI0VaspW
	bQ2evkdHoQD4yxycF+DRKyKApa5dNUfpNnWqFomUqn5ZWa03Zosl+JcWubJXjaS9jy
	UrSNJbi/VK7EqI/CnBpiOYW+YhZivDAccQCUpQqQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJG9g7096976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:08 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pf017983;
	Thu, 20 Feb 2020 13:16:08 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:53 +0000
Message-ID: <20200220185458.26926-4-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 4/9] arago-console-image: drop unused image recipe
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:09 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-console-image.bb      | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-console-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-console-image.bb b/meta-arago-distro/recipes-core/images/arago-console-image.bb
deleted file mode 100644
index b455b2e1..00000000
--- a/meta-arago-distro/recipes-core/images/arago-console-image.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-# Arago console image
-# gives you an image with basic media libraries
-
-require arago-image.inc
-
-COMPATIBLE_MACHINE = "(?!arago)"
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-base \
-    packagegroup-arago-console \
-    "
-
-export IMAGE_BASENAME = "arago-console-image"
-- 
2.17.1


