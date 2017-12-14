Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E270C52990
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 22:37:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEMbtO1001448
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 16:37:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513291075;
	bh=dPowEl3PItySziimuVsDz+pnJTKmE2iSaoExo1ZUsdM=;
	h=From:To:Subject:Date;
	b=mKsDgxw1XNVo7uAvDdVyaoQkk9/hQsEAZo4QW3e3gbGO8BSQiOlI2Whp2og6VxuSm
	qbqhADLuNSn2zsbSMXluGwNrcE8mS7zwIRckR/ArWJz85RpkxeoEQCXRU1DZagpy1C
	KeQsKIE54AEENXw6h+1wjotyhmcrI6p2Avwax22o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEMbtvI012070
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 16:37:55 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 16:37:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 16:37:54 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEMbsQ8030379
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 16:37:54 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 17:37:53 -0500
Message-ID: <1513291073-56171-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] pcie-lld-rtos:Updating to version 2.2.0.11
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
X-List-Received-Date: Thu, 14 Dec 2017 22:37:57 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend
new file mode 100644
index 0000000..fe57c46
--- /dev/null
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.11"
+PCIE_LLD_SRCREV = "07ad9c62da03bb8b6aa65e2507deab92e56ef83a"
+
+PV = "02.02.00.11"
+PR = "r0"
-- 
1.9.1


