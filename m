Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0809ACAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:35:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2132.1757608508113303021
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 09:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oGGi/ga3;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BGZ67x417339;
	Thu, 11 Sep 2025 11:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757608506;
	bh=4svLTDUXRN+8Jkst+ZIjdQ/vZG2/jy3JQNxe1QbXz80=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oGGi/ga3brYCPeZWEHAd+iO0jh6wlczZITTD3KnMNOKksB3p1mY/nSN+iISBFAPtR
	 zeYPPNc/frxUNso1sMYXDHrYxtYXvA3AOPCFY9VFcb/iD3gBphARufbwNGmmbcrGFP
	 VvTDRxU18iufedAEBxorLC81vTvECxA2p+LBu2YM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BGZ67n2073408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 11:35:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BGZ6cn2416673;
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwkGI-0005K4-Cs; Thu, 11 Sep 2025 11:35:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/5] conf: Add support for whinlatter
Date: Thu, 11 Sep 2025 11:35:02 -0500
Message-ID: <20250911163506.20414-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250911163506.20414-1-reatmon@ti.com>
References: <20250911163506.20414-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16559

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4997038..9c6c9aa 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,3 +1,3 @@
 BBFILE_COLLECTIONS += "oe-layersetup"
 LAYERVERSION_oe-layersetup = "1"
-LAYERSERIES_COMPAT_oe-layersetup = "kirkstone scarthgap styhead walnascar"
+LAYERSERIES_COMPAT_oe-layersetup = "kirkstone scarthgap styhead walnascar whinlatter"
-- 
2.17.1


