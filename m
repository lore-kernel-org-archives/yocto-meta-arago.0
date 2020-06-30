Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 28A90529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 17:09:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UH6wGh042805
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593536818;
	bh=nBXNE7A3wBGbSKI9G3iXZGPPqrahmWFaR9n1x4bcQ0E=;
	h=From:To:CC:Subject:Date;
	b=ird7tTlYdtYE/8ZqhLBxVa1Sjlz9a+wsJwcO8sw1Bzkf+6bql0xkhpk8cSObL2Yr6
	0HQDxbZwto07cbB00eFGzYxVPf4OWqInG529Fx3E9MYk7hjQpu6mgM4i94KPe3v4jJ
	l9dPzKZi53TCtvEr+Bsxv39L/Oe5AeRosEbj3Pys=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UH6wt0055757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:06:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 12:06:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 12:06:57 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UH6tnu032174;
	Tue, 30 Jun 2020 12:06:56 -0500
From: <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 30 Jun 2020 22:36:52 +0530
Message-ID: <20200630170652.26282-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: prao@ti.com
Subject: [master/dunfell] recipes-tisdk: ti-tisdk-makefile: Fix Makefile for Jailhouse
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
X-List-Received-Date: Tue, 30 Jun 2020 17:09:36 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Latest Jailhouse does not have the ci files for j7-evm.
Fix the Makefile to create the header file with right defines.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
index f5367c83..8e70fd9d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
@@ -8,7 +8,7 @@ jailhouse_config:
 	@echo =====================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
-	cp -v ./ci/jailhouse-config-$(JH_PLATFORM).h ./include/jailhouse/config.h
+	echo "#define CONFIG_TRACE_ERROR    1" >> include/jailhouse/config.h
 
 jailhouse: linux jailhouse_config
 	@echo =====================================
-- 
2.17.1


