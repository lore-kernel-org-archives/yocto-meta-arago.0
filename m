Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E2B8E52980
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2019 21:07:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QL6xtc067630
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2019 16:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561583219;
	bh=dhMr+vz9r0Zvo5gGbp8FqDv8rZVes4CNN5QkjHCrhTA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FIn8dW34rikkaojeHSnei4SfSO0ZTirwpaKmeJizXaw/elixn7ak5ok9HnupmzFof
	SQZr04rEcjVtvWCeca/BUJM3oERbCCA6mdV1qRl29feT/ezadx1pg+7F9XFeAcIKRO
	TPA7J8/pUm7fiIFlneNk9sFRcTUIw+zzWVd5RuNs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QL6xNH042585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2019 16:06:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 16:06:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 16:06:58 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QL6wxr073652;
	Wed, 26 Jun 2019 16:06:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2019 20:54:37 +0000
Message-ID: <20190626205437.32712-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626205437.32712-1-denys@ti.com>
References: <20190626205437.32712-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] ti-sci-fw: update SYSFW to 2019.06
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
X-List-Received-Date: Wed, 26 Jun 2019 21:07:43 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.05.bb => ti-sci-fw_2019.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.05.bb => ti-sci-fw_2019.06.bb} (98%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb
similarity index 98%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb
index ae0c8562..b6570a4a 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "94a06ceb66aa821b293e8b903f6b65346d33328d"
+SRCREV = "3930363562b35a5f3d495a61ea7e51739462b14a"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b78f394a997c919cff2733d1cf1d2f3b643ad02f"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1


