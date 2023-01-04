Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A8AC5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:12:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12882.1672841515818352682
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 06:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KoA64dVb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304EBtXD041171
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672841515;
	bh=HaZcKs4k06osyRH5VaT4A1n030IQeV6FeszILDBFqa0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KoA64dVbxL1qWh7LGFYP/uqJfYv/Gq7BD7Ik3T60NWi57FL/w7lwUZa8tgmDVUJEs
	 dtQOXdxZH39BGcYfjzdzE8SN9NF/9z9ezE1obPuURv+eE7UAxND0N+/F4DSnu3Klkx
	 n+yGjI8zVNL1VQI3bahPzSzK6JMff1CHBidd9+jg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304EBte3111930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:55 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 08:11:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 08:11:55 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304EBsmA099672;
	Wed, 4 Jan 2023 08:11:54 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <j-choudhary@ti.com>
Subject: [meta-arago][master/dunfell][PATCH 2/2] udev: fix the local rule to load modules when new hardware is added
Date: Wed, 4 Jan 2023 19:41:50 +0530
Message-ID: <20230104141150.186773-3-j-choudhary@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14149

Using modprobe causes the rule to fail when the module is builtin in kernel
and it is logged in journalctl. So use the builtin command 'kmod' instead.
This makes the journalctl logs clean and significantly easier to read.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 meta-arago-distro/recipes-core/udev/eudev/local.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/udev/eudev/local.rules b/meta-arago-distro/recipes-core/udev/eudev/local.rules
index 689e093c..f14352d5 100644
--- a/meta-arago-distro/recipes-core/udev/eudev/local.rules
+++ b/meta-arago-distro/recipes-core/udev/eudev/local.rules
@@ -14,7 +14,7 @@
 #
 
 # Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
 SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
-- 
2.25.1


