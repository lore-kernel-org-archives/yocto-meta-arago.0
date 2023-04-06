Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BB0C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:15:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.167734.1680808511820823657
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sNUlcBgs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336JFA4E003045;
	Thu, 6 Apr 2023 14:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680808510;
	bh=Yq54eDSQLGkEa1t4gQ2yUKfZFHosfYCZWSOX9Q2ZTVE=;
	h=From:To:CC:Subject:Date;
	b=sNUlcBgssuHFqkXywgzwXcuK61w9IMd28GByt62lGyqZKKIlSkXfWI1qrAsBnciul
	 HcIsJA6uPzm/KIOhSmrUfIAlIBqql7EOz7mqaTwsO56hbBz/W9xu3luv0A9j+uzi5O
	 C+h8JGfoOHznoJ0PWYXxLWIlKj0p+ScLPuyVQotA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336JFAEe090737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 14:15:10 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 14:15:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 14:15:10 -0500
Received: from lelv0854.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336JF9kp123515;
	Thu, 6 Apr 2023 14:15:10 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] branding-ltsprep: Temporarily disable GC320 driver
Date: Thu, 6 Apr 2023 14:15:08 -0500
Message-ID: <20230406191508.7031-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:15:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14296

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index a944bcdf..ee8761f9 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -9,3 +9,6 @@ PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
 MACHINE_FEATURES:remove = "gpu"
 PREFERRED_PROVIDER_virtual/gpudriver = ""
 
+# GC320 support requires out-of-tree drivers not available in until LTS prep is
+# complete. Disable for now.
+MACHINE_FEATURES:remove = "gc320"
-- 
2.39.2


