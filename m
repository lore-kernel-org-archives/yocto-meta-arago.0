Return-Path: <vigneshr@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6E7D2529D1
	for <meta-arago@arago-project.org>;
	Fri, 24 Jul 2020 14:14:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OEBQSA106520
	for <meta-arago@arago-project.org>; Fri, 24 Jul 2020 09:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595599886;
	bh=ay+dSwC6wPriDBt1IKI98xN8x3eOpWG3zgEhnWwXudM=;
	h=From:To:CC:Subject:Date;
	b=DU2ITMMJrLq91sbJkzGZvYLmEs94UNlXA+dOo4dG5ux68VcsxmwOs/DBrOn/MP5Qn
	dw9QCP3C4q1pxwsxZGbZ/GvxWWL7IbpOXX3BW78MG4d9WLJVqEI9RWxI2RUmd0rGVN
	oey6le0mkNUOdB+Mi7SSnz5SksA90X5gieeJARCI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06OEBQxF012785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 24 Jul 2020 09:11:26 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 24 Jul 2020 09:11:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 24 Jul 2020 09:11:26 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OEBOSb002522;
	Fri, 24 Jul 2020 09:11:24 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jul 2020 19:41:19 +0530
Message-ID: <20200724141119.32341-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] switch-config: Update v4.1 branch to the latest version commit
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
X-List-Received-Date: Fri, 24 Jul 2020 14:14:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

New updates to switch-config repo's v4.1 branch now supports fiddling
with PRU_ICSS ethernet interfaces. Hence move to the latest.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../recipes-bsp/switch-config/switch-config_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index 6b619164..07368461 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -8,7 +8,7 @@ PR = "r4"
 BRANCH ?= "v4.1"
 BRANCH_aarch64 ?= "am65x-v1.0"
 
-SRCREV = "7efabd92177199205808ebd993267b04e8c2fb6a"
+SRCREV = "15e8be3b1249ac4193031127565eec5b64ecaff1"
 SRCREV_aarch64 = "3b31ce5fe8bd5a3560b89f2a709fb3e3b877326d"
 
 SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
-- 
2.27.0


