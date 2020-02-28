Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9BEC1529D8
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 22:36:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SMYRqq064448
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 16:34:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582929268;
	bh=ZD+epGhMcOOwfbhvTVRg8CafoIVQ9q9CBoCLyfWbKe8=;
	h=From:To:CC:Subject:Date;
	b=ks6bIe1m+ZaB68jfyWYaiqvDSxSkyeXnVo/sBCf2+8oSr/Mz1Upl0fDKZpB/DH391
	gypOinEvnEhg4HvMuVKxWwVjqrRBvrq5WWowKTtSgj2VKfp9jhLiGan0xzcKqW1Ce6
	czBXI69OckNQgvjCIuNstBYVA9NX81uSu7ZH+kc8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SMYRRI102968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 16:34:27 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 16:34:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 28 Feb 2020 16:34:27 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SMYRMn041952;
	Fri, 28 Feb 2020 16:34:27 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Feb 2020 17:26:41 -0500
Message-ID: <20200228222641.21119-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH] tidl-utils: bump SRCREV to get fixes for tidl import tool
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
X-List-Received-Date: Fri, 28 Feb 2020 22:36:30 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 5801331e..5ba5ffd8 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "fe5ff65c2619717cc1f501a0a359e6242c7056c8"
+SRCREV = "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
 PV = "01.01.03.02"
-PR = "r0"
+PR = "r1"
-- 
2.17.1


