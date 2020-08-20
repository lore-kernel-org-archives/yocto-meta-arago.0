Return-Path: <a0221627@swubn03>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5A84B520DF
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2020 20:55:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KKqLxX048531
	for <meta-arago@arago-project.org>; Thu, 20 Aug 2020 15:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597956741;
	bh=bjI39Z6Y1LtI8aoU62kvF2TUIo4IKfwg6h2nJurfe+A=;
	h=From:To:CC:Subject:Date;
	b=DsRSriz5ZNEyagiyjoa/US73sEMOwH21a3QUG7TRNyfjUZUsihkGRqRcTD7TVkRE1
	/oxr8nZKDohL2L4RsHMkdHfEOBcpQoJA21XOKjIwqSEfT9POAX/S4TQTFar9Xk+6O2
	ObInkya5uULzb9tUNgAhBCw6NcpRFvQosy9xjW3w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KKqL5b085333
	for <meta-arago@arago-project.org>; Thu, 20 Aug 2020 15:52:21 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 20 Aug 2020 15:52:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 20 Aug 2020 15:52:21 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KKqKDu088302;
	Thu, 20 Aug 2020 15:52:21 -0500
Received: from a0221627 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0221627@swubn03>)
	id 1k8rXo-0001ws-03; Fri, 21 Aug 2020 02:22:20 +0530
From: <l-weaver@ti.com>
To: <denys@ti.com>
Date: Fri, 21 Aug 2020 02:22:10 +0530
Message-ID: <20200820205210.6070-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master PATCH] ti-tisdk-makefile: adding uboot r5 config variable for j7200
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
X-List-Received-Date: Thu, 20 Aug 2020 20:55:11 -0000
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a441d4b1..48ed961e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -363,6 +363,7 @@ K3_UBOOT_MACHINE_R5_am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1


