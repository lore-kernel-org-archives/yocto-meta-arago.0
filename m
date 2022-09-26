Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B80C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:40:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1006.1664214045780716152
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 10:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZyurGDjD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28QHei2J094513;
	Mon, 26 Sep 2022 12:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664214044;
	bh=C2AKoLTIFDzh3pfhhtr9D4g/N3Gkyt8Z7NupJyV+F/8=;
	h=From:To:Subject:Date;
	b=ZyurGDjDLxukTldJTI4qP39gqxFe++jKNDCSey87wZE8h8vC+IWTJ/4Oum6XTQ+HK
	 V2T4l5Ocs8e/L4OwEQrpS4eu6OwtOhpS0SF+dhiAAN5mwtYmFA5AhXCSna3Y72D/DW
	 JliUgSH/L+bnmzxjftpwegsH+qKVeR35EizSbDio=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28QHeiq9002465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Sep 2022 12:40:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 26
 Sep 2022 12:40:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 26 Sep 2022 12:40:44 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28QHeixe063379;
	Mon, 26 Sep 2022 12:40:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ocs5z-0004Tg-TR; Mon, 26 Sep 2022 12:40:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: adding uboot
 r5 config variable for j784s4
Date: Mon, 26 Sep 2022 12:40:43 -0500
Message-ID: <20220926174043.17171-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Sep 2022 17:40:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14044

lets add support for the latest of TI SoC.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 471e2776..39f4b851 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -374,6 +374,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j784s4-evm = "j784s4_evm_r5_config"
 K3_UBOOT_MACHINE_R5_am62xx-evm = "am62x_evm_r5_config"
 
 do_install_append_k3() {
-- 
2.17.1


