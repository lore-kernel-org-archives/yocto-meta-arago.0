Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CCC83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 22:17:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4761.1693261047023202846
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 15:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h3Ty3yGG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SMHPuq039493;
	Mon, 28 Aug 2023 17:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693261045;
	bh=Q7A68Q1MQKQEcbHJ8SYYPljs3SG2WSV8SUh6Rs9asoA=;
	h=From:To:Subject:Date;
	b=h3Ty3yGGL92fbUkR3HiktqlE06Bk0ARHgB7UhR+tnfZaWDkL3zHFQapAY3etuKqmp
	 NLh7D6FHR66B0kgBxvkkBg9FOJdRToRKgMDQRXqbMKAkDZO+8ljpJ10SChalv9swks
	 f4sOYFTtRzgyYu6AgBjrvG+ohf96uXQX6ACA6Bys=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SMHPTQ017061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 17:17:25 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 17:17:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 17:17:25 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SMHP3W011806;
	Mon, 28 Aug 2023 17:17:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qakY1-000150-6v; Mon, 28 Aug 2023 17:17:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] arago.conf: Remove redundant require
Date: Mon, 28 Aug 2023 17:17:25 -0500
Message-ID: <20230828221725.4110-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 22:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14876

Remove unneeded require for the init-manager.inc files as they are
included from oe-core.  This cleans up some warning messages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5c1a5203..d5f973ad 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -60,7 +60,6 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??= "0"
 INIT_MANAGER ?= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
-require conf/distro/include/init-manager-${INIT_MANAGER}.inc
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
-- 
2.17.1


