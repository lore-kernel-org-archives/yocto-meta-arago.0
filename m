Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472A3C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 09:01:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9021.1670490079683020203
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 01:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JHGBuzdg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vigneshr@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B891I77017749;
	Thu, 8 Dec 2022 03:01:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670490078;
	bh=7RoV3WdFY+k9YSX+1QNlbbNUNSYMZmC6erDxIGufPws=;
	h=From:To:CC:Subject:Date;
	b=JHGBuzdgheVweIwJVoEwzgRWwcrz1yD6ewvp/jn8zXmfmv9fW21v6M58P1ZAexemx
	 wKho1z6hgjeqMZaUiYkcKBi6inIv4JxF1NJQvKwTA79mmn8eFdaaRogGehiYk+OaKO
	 uJm2cJTKSV3IO/LX4qzso29bNXauBIJD9yX64OxE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B891Ipm020327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Dec 2022 03:01:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 8
 Dec 2022 03:01:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 8 Dec 2022 03:01:18 -0600
Received: from uda0132425.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B891GOM062782;
	Thu, 8 Dec 2022 03:01:17 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH dunfell] irqbalance: Move to the latest tip v1.9.2+
Date: Thu, 8 Dec 2022 14:28:26 +0530
Message-ID: <20221208085826.1600644-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Dec 2022 09:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14131

This fixes timeouts seen on daemon stop during reboot
Switches to using irqbalance provide irqbalance.service instead of
custom one
Fixes some IRQs not being classified and thus not balanced.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../recipes-extended/irqbalance/irqbalance_git.bbappend   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
index e87a65d65f47..3ba30b5d6acc 100644
--- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
@@ -1,4 +1,8 @@
-SRCREV = "99ae256d02b35778b406e598beedc8d827cdac18"
-PV = "1.8.0"
+SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
+PV = "1.9.2"
+
+do_install_append () {
+         install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
+}
 
 PR_append = ".arago3"
-- 
2.38.1


