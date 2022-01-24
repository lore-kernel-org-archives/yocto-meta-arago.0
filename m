Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.4909.1643037540915422609
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 07:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wC/YT3cZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20OFIxfv110237;
	Mon, 24 Jan 2022 09:18:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643037539;
	bh=zrRY0Fdt6SfE+4W2sPu8KeL8977KmBWKun0BUPwtUAo=;
	h=From:To:Subject:Date;
	b=wC/YT3cZgKPV4YsMJczaMKWr+bYBl2nzy2P8Yt12ARv+jLJLzlw8wUtGEoPyQbilJ
	 79cUpei4lYtO7f/G8S1sI7LszEoLTPdzNdN29yCgsHQMYmXX8EWxeVY6ON5JNcHGzf
	 soViZu+jv3HkN45fQ6csDQbrDYICJXtR/mRxDYP0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20OFIxBa048093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jan 2022 09:18:59 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 24
 Jan 2022 09:18:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 24 Jan 2022 09:18:59 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20OFIxVc116009;
	Mon, 24 Jan 2022 09:18:59 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nC17S-0001Gv-UG; Mon, 24 Jan 2022 09:18:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] ti-tisdk-makefile: adding uboot r5 config variable for j721s2
Date: Mon, 24 Jan 2022 09:18:58 -0600
Message-ID: <20220124151858.4850-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

lets add support for the latest of TI SoC.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 25aa8c38..79047f26 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -359,6 +359,7 @@ K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1

