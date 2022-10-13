Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B8C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:46:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1307.1665694011453665909
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GUm0hZKG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKkoOg057513;
	Thu, 13 Oct 2022 15:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665694010;
	bh=9PMRDHqt66fQwaHr53hSPgM7Rr2HkhenuWeeyPKgu1E=;
	h=From:To:CC:Subject:Date;
	b=GUm0hZKG+CavakK6h1Q9dnepkjmoXTDfto5X9rteQ55WIk7VCNGxouWkAZdGSVY2j
	 wpuw5F8sqajz2v7l2JTPc69Wf8BaHOSWAOm+Niz3A+iNQLJgSDKU7kwFTWgSc1QiMi
	 JaenEmOgYkJ8kdU7mtQ+/n+27SMQaTn1UfjY+p9E=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKkoPq029060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:46:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:46:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:46:50 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKknMS064557;
	Thu, 13 Oct 2022 15:46:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] arago.conf: Specify omapl138 directly instead of omapl1
Date: Thu, 13 Oct 2022 15:46:49 -0500
Message-ID: <20221013204649.18028-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:46:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14085

Only omapl138 is supported now, being specific here lets us
remove a layer of family name support.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 088faa16..7e3aefbf 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -173,7 +173,7 @@ IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') ==
 # Set some sane defaults, in case someone forgets to set them in local.conf
 TC_SANE_DEFAULT ?= "arm"
 TOOLCHAIN_TYPE ?= "internal"
-TOOLCHAIN_TYPE:omapl1 = "internal"
+TOOLCHAIN_TYPE:omapl138 = "internal"
 TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"
 
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
-- 
2.37.3


