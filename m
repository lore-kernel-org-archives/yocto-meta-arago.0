Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A013C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 14:27:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.7372.1650983220829749312
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 07:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xFrGPisp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QEQuW4055208;
	Tue, 26 Apr 2022 09:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650983217;
	bh=XK4OfuPjtgbFg2RNaW+Y7D3GqbaZA5q2bzT4FZGwYP4=;
	h=From:To:CC:Subject:Date;
	b=xFrGPispX4et/crCoRgczjhGCcu3FzLksOovQmxTYReYLpdFhGxp8caI1d/WyFOYD
	 QQW3h6vlYX016z69XpQvgHKl4WeLHhzrcavmOoE9QrrOp0yLNKRvz6o6O0cV0ZRPXz
	 mOieqhmCU08f8MUrsv1DZ5+yHe/3OMYLqYInNi60=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QEQuPm070808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 09:26:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 09:26:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 09:26:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QEQuEd034305;
	Tue, 26 Apr 2022 09:26:56 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [oe-layersetup PATCH] oe-layer-setup.sh: Stop claiming generic sh
 support
Date: Tue, 26 Apr 2022 09:26:51 -0500
Message-ID: <20220426142651.22361-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 14:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13787

Lets be clear that we work with bash and not variants such as dash.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

There has been a bit of bashism that has crept into various checks,
which is fine as long as folks use bash ;) OR we can start cleaning up
in a manner to support dash and variants of that form.

 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index f171f94cf0fc..6654869ac061 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 # OE Build Enviroment Setup Script
 #
-- 
2.31.1


