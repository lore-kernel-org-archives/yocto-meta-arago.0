Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE6C28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.39717.1741792106318740813
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EyjiNq6X;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8Ok91061769
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792104;
	bh=Jjnyw6mpq3018UE8c4BmH67rqOGD12vuwjYAZxfPXDc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EyjiNq6XOM1MQvjza4JDUXBs0ul11KnOOz2SQkFXibjCW1ypGTQqB/iLuFe7LJrpe
	 nC9Hp/etq/vEMsd15R7pivdT+1RIxZwdJ5eOfDBKU7f2hO+o5cjwo7N/SMsMCBPfEE
	 zJeDrD5WvZXjhZHVapaCiN9BdBgPx7Zj1XRZ6fho=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8O7Y027380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8Ook034662;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001j5-9Z; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 2/6] ti-gc320-tests: Add COMPATIBLE_MACHINE
Date: Wed, 12 Mar 2025 10:08:20 -0500
Message-ID: <20250312150824.6579-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312150824.6579-1-reatmon@ti.com>
References: <20250312150824.6579-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16007

The ti-gc320-libs dependency has COMPATIBLE_MACHINE = "omap-a15", so you
already cannot properly handle this recipe without it being in effect.
yocto-check-layer complains about this, so simply add the same
COMPATIBLE_MACHINE setting here.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f9b9685f..6c4ed631 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -3,6 +3,8 @@ DESCRIPTION = "Test application for GC320 2D API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
 
+COMPATIBLE_MACHINE = "omap-a15"
+
 DEPENDS = "ti-gc320-libs"
 
 BRANCH = "ti-${PV}"
-- 
2.17.1


