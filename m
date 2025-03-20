Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6F2C36017
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1883.1742494250754866195
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=m0J0rrxK;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAn8R075286
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=eYsmDr7BThVyVGrdZMBVpgagyBY+XE226v2ngdz/3lM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=m0J0rrxKjp13Q+lpZrx38UdF9gTFfZpLABfo2PaqsF41HV/lukegHOdFv72XsJsmQ
	 CmEFSA4yO98iITHkLP3WZml4xcK6TkfK01CJpcMVop5aNQn56cL3iGYCcpKticBCvZ
	 b579L5SVn99WoRHby4gp21OXg4D6CsFiA3V++73A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnKu024524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAn8w126244;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-0001Ik-HC; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 20/26] linux-firmware: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:41 -0500
Message-ID: <20250320181047.18035-21-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16118

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...linux-firmware_%.bbappend => linux-firmware-arago.inc} | 0
 .../linux-firmware/linux-firmware_%.bbappend              | 8 +++-----
 2 files changed, 3 insertions(+), 5 deletions(-)
 copy meta-arago-distro/recipes-kernel/linux-firmware/{linux-firmware_%.bbappend => linux-firmware-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
copy to meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 43c54575..5e4fd639 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,6 +1,4 @@
-PR:append = ".arago2"
+LINUX_FIRMWARE_ARAGO = ""
+LINUX_FIRMWARE_ARAGO:arago = "linux-firmware-arago.inc"
 
-do_install:append() {
-	rm -rf  ${D}/lib/firmware/ti-connectivity/
-	rm -rf  ${D}/lib/firmware/cadence/
-}
+require ${LINUX_FIRMWARE_ARAGO}
-- 
2.17.1


