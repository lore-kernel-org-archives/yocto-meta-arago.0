Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 05D67529CC
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 21:31:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6LSM9m030809
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2020 15:28:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604698102;
	bh=k4tzmG4FzWaNlVfBRMPstYu591fBT9XslvuN3D32YoY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e7oaDvIgZc62LpIwAx+rSbOGQygjTrqKU/ZPKlUwwQ8ry31cqewN+XegkwYwaok9Y
	rfdS4FswPpSjqD/bZlnEi6CSxP4q/vkoCRNSoLn28R/n5P68VIBvNmsai+FXWCnsDA
	SfN/PxWuDc6MTpDj7iqb0/jgEw+ALQz9crSveg80=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6LSMPo044646
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2020 15:28:22 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 6 Nov 2020 15:28:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 6 Nov 2020 15:28:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6LSMee046058;
	Fri, 6 Nov 2020 15:28:22 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2020 15:28:11 -0600
Message-ID: <20201106212811.26270-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201106212811.26270-1-dmurphy@ti.com>
References: <20201106212811.26270-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master] PATCH 2/2] recipes-tisdk: ti-tisdk-makefile: Update firmware name for j7 ti-sci->ti-fs
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
X-List-Received-Date: Fri, 06 Nov 2020 21:31:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index a6e6f866395e..96efa538be4e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -14,6 +14,7 @@ SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
 SYSFW_PREFIX = ti-sci-firmware
+SYSFW_PREFIX_j7 = ti-fs-firmware
 
 SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
 
-- 
2.29.2


