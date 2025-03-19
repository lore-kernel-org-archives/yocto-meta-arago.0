Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F58C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:27:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.6849.1742419650573519192
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tRFlYEJ5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLRUN2441096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742419650;
	bh=lLRZI6yDf6Z2wbt9Od3vTTptzlEgmCCYoMKoMcUThaQ=;
	h=From:To:Subject:Date;
	b=tRFlYEJ5a7kLsam7sWx8qRNTcBBKRXbbQzi39aJTPcXQNUu2oB0YS47KqdlX2KGp0
	 ylTKGz4O02M5RJLjiekfvH2xN8kxw++WcJtaeeQmAHzEnOheKhe3oxLDzNt4S6DB+B
	 vgOC5aw96an5krIq9hw1Re/eMCYFnvMkupwjV7x8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLRUj8092824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:27:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:27:29 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLRT1u026491;
	Wed, 19 Mar 2025 16:27:29 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v6 0/3] Enabiling gc320 5 driver for am57 in k6.12
Date: Wed, 19 Mar 2025 16:27:26 -0500
Message-ID: <20250319212729.336516-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16098

From: Antonios Christidis <a-christidis@ti.com>

The gc320 driver has been ported from kernel 6.1 to 6.12.
This patch series updates and sets up everything required to start
buidling gc320 again for kernel 6.12.
 
This patch series goes hand in hand with a patch sent to meta-arago
updating the SRCREV of ti-gc320-tests.
 
Regards,
Antonios

Antonios Christidis (3):
  recipe-graphics: port gc320 driver to work on kernel 6.12
  conf: machine: am57xx-evm: Enable gc320 machine feature for am57xx
  recipes-graphics: port gc320 libs to work on kernel 6.12

 meta-ti-bsp/conf/machine/include/ti-bsp.inc               | 3 ---
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb            | 4 ++--
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 ++++++--
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.34.1


