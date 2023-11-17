Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A666AC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 17:27:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1443.1700242063342982614
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Nov 2023 09:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c+sOn8BJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AHHRf9x062517;
	Fri, 17 Nov 2023 11:27:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700242061;
	bh=a7eID1J9N+336nEbi+kHU56eMAtl96Jj6yyJswnUZnc=;
	h=From:To:Subject:Date;
	b=c+sOn8BJ7Gqof7+V/XeipRoaK74mWcySrrtqH9zlZhXixRmtJpJiwHAf7T0IMIGsi
	 4klLWJvkCmvXJInMbe/wAx0h/ll9wPfbfZygtc6JWsbshwGvxAxjwlakE3pfl0EdYz
	 bIjdJ1Ke+cd2+WlMCSL6dJyADTrtOFOG6W/p9x2k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AHHRf44130134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Nov 2023 11:27:41 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Nov 2023 11:27:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Nov 2023 11:27:41 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AHHRf9a082047;
	Fri, 17 Nov 2023 11:27:41 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r42d3-0004kM-Eb; Fri, 17 Nov 2023 11:27:41 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] packagegroup-arago-tisdk-addons: Remove netkit-ftp
Date: Fri, 17 Nov 2023 11:27:41 -0600
Message-ID: <20231117172741.18207-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Nov 2023 17:27:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15015

The netkit package was dropped from meta-openembedded [1] for not being
updated in a while.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=4c1e6d32ba6e9a14937a83f0d9375ef4d0b28057

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8412f5f6..4dec290a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -11,7 +11,6 @@ PACKAGES =+ "${PN}-extra"
 UTILS = " \
     gdbserver \
     oprofile \
-    netkit-ftp \
     ptpd \
     strongswan \
     kexec \
-- 
2.17.1


