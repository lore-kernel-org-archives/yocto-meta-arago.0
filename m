Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DBDEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:45:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4085.1686905145142728965
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 01:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HTwZgukv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G8jf1N089697;
	Fri, 16 Jun 2023 03:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686905141;
	bh=vw+IuUnw4meXh0KjnM2GcL7fapvrV7qvoCAabbw/mOA=;
	h=From:To:CC:Subject:Date;
	b=HTwZgukvkUF4w/4HpIef6oT7gYVFXMIbwvyo5STM/ZxZDXbYWLtWNB/Cxjh8L0OCB
	 vr9+hICmw8izjJ+etzKlv3nbAuSib5CLMSrY+sAR0NVNxgPXl8V6f53H6x4SvOmx/c
	 TjS+8lunU5e81clHxauBenfud8j7Atv9JPkHQFwY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G8jfb0054460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jun 2023 03:45:41 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 03:45:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 03:45:41 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G8jcmh025843;
	Fri, 16 Jun 2023 03:45:39 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>
Subject: [oe-layersetup PATCH] configs: Update Kirkstone config for sysrepo
Date: Fri, 16 Jun 2023 14:15:38 +0530
Message-ID: <20230616084538.10530-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 08:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14643

NETCONF/YANG is implemented through netopeer2/sysrepo.
A Yocto project for sysrepo is available in public domain[1].

[1] is compatible only with Yocto Honister branch. So update
the config with [2] which is fork of [1] for Kirkstone.

[1] - https://github.com/sartura/meta-sysrepo
[2] - https://github.com/ravig07/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
I have sent a Pull Request for [2]. Once it gets merged, then the URI
in the config.txt can be replaced with it.

 configs/arago-kirkstone-config.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index c2524a4..e80ab80 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -10,6 +10,7 @@ meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,
 meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HEAD,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
-- 
2.17.1


