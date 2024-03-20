Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C04C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 13:27:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.44671.1710941260056793098
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 06:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x1jQUYYF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42KDRcQi053571;
	Wed, 20 Mar 2024 08:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710941258;
	bh=YZ8NSqlhDEDhWjbLHv1bRfw7obk4gzS7n6psX/5S5XM=;
	h=From:To:Subject:Date;
	b=x1jQUYYFq+kbB3AApu6qiDmpV8dzAw2tzJQz0K1obrkQoYcJB0kpfqtRZmMFLU+XU
	 0FBZL5Kh8pEkpLo0ha4e0jobIaCrvUJvnrMgs0LytaJCt1RBXk9Ud2TB2ywhuOH0pT
	 SUBMbZaXgxl9d84fi80IhGBPJFCQnhvlrdKaW02E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42KDRcMt105886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 08:27:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 08:27:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 08:27:38 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42KDRcxL023631;
	Wed, 20 Mar 2024 08:27:38 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rmvyk-0006CD-2F; Wed, 20 Mar 2024 08:27:38 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] linux-firmware: Remove Intel 9260 modules
Date: Wed, 20 Mar 2024 08:27:38 -0500
Message-ID: <20240320132738.23778-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Mar 2024 13:27:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15243

oe-core has added the 9260 modules to the upstream linux-firmware
recipe[1], so having these entries causes a QA error with duplicate
packaging.  As these are no longer needed, we can remove them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=d924307b9cee4065ff60d08e3b4298278693ff2c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_%.bbappend   | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index d4f3e679..cb9573a1 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,15 +1,11 @@
 PR:append = ".arago1"
 
-PACKAGES =+ "${PN}-iwlwifi-9260"
 PACKAGES =+ "${PN}-ibt-18"
 
-LICENSE:${PN}-iwlwifi-9260 = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-ibt-18 = "Firmware-ibt_firmware"
 
-FILES:${PN}-iwlwifi-9260 = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
 FILES:${PN}-ibt-18 = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
 
-RDEPENDS:${PN}-iwlwifi-9260 += "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-ibt-18 += "${PN}-ibt-license"
 
 do_install:append() {
-- 
2.17.1


