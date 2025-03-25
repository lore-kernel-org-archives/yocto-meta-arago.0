Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DB7C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:36:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.68942.1742917007915551824
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 08:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ra1IK1XA;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFak3o1880862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 10:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742917006;
	bh=yPo5/2EOZ6nVgy46igNSpjJHxAKCAoQHvPJVrCyn1ic=;
	h=From:To:Subject:Date;
	b=Ra1IK1XABns25MsoO4yB93/ixj0nr3/658/yL3+BjSRDh3yjo7XgjkH/BHj6kWmt5
	 xOY0tAWoxY/qugs29aWOU2HEdgJpWziDGQyi0yQ8WR5vmYw2a3xQdxOztQwUdMU6dQ
	 MTg7Rp8ceO+bVBlGAhBy6PMT4n0zOfdNmuH0lTO4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFakc0117987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Mar 2025 10:36:46 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:36:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:36:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFakuk033828;
	Tue, 25 Mar 2025 10:36:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tx6Kb-00066a-QS; Tue, 25 Mar 2025 10:36:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2] meta-arago-distro: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Tue, 25 Mar 2025 10:36:45 -0500
Message-ID: <20250325153645.23428-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Mar 2025 15:36:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16152

Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message.

 meta-arago-distro/conf/layer.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 0bbf9a4e..40629794 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -39,11 +39,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     weston-init->kbd \
 "
 
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    udev \
-    eudev \
-    weston-conf \
-    cryptodev-module \
-"
-
 HOSTTOOLS_NONFATAL += "corkscrew getent socket"
-- 
2.17.1


