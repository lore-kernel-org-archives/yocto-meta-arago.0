Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEF6C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:12:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12861.1672841514973847232
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 06:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r4ldxCwu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304EBrH7018744
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672841513;
	bh=88PIvETS27Ext/Olnf0BLRE+I2k+ob8MR0nHm+xJNPM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r4ldxCwubOG2uDarsR4hSCGvODtnBsFdwI+bGP6KQzsVVMP7NQcoIoroZZVpS2At/
	 KzcNsoG11rKVodOGHf/HiWfVRlPr8YkwxbpfFT3QNLpND6Tby7RmokL9gkHp0aJ4Zq
	 H5sBctNrGSYKymezpvE+3Gh4mpvNIIAkBKzhjJjI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304EBrUm012628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:53 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 08:11:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 08:11:53 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304EBqJ8099667;
	Wed, 4 Jan 2023 08:11:53 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <j-choudhary@ti.com>
Subject: [meta-arago][master/dunfell][PATCH 1/2] systemd: fix the local rule to load modules when new hardware is added
Date: Wed, 4 Jan 2023 19:41:49 +0530
Message-ID: <20230104141150.186773-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104141150.186773-1-j-choudhary@ti.com>
References: <20230104141150.186773-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 14:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14148

Using modprobe causes the rule to fail when the module is builtin in kernel
and it is logged in journalctl. So use the builtin command 'kmod' instead.
This makes the journalctl logs clean and significantly easier to read.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/local.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
index b0e9f84f..4829ca14 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/local.rules
+++ b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
@@ -14,7 +14,7 @@
 #
 
 # Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
 SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
-- 
2.25.1


