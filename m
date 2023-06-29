Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA03EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 16:41:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1943.1688056896904959655
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 09:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lh18e9dF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35TGfZge087988;
	Thu, 29 Jun 2023 11:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688056895;
	bh=or8OC6IF+SpKT49qSMr+92F+xRdAO3nhcWi6m+PNKrk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lh18e9dFBJeRTAdVbdDAp7BOZRsbfRwT9fm/pOlJc2Cv/azszjB1a7vom85MzRk/H
	 zgRkclGg7y3DQsdQ+QkOMILRlUiQZbEsM4ao6mAmPeutIggZlt1qJRB8b8xLISPyOr
	 Yoptu9jtA88UJp4PcWSQE01q8dLTN/lq2WzvQTVM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35TGfZmG019679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jun 2023 11:41:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 11:41:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 11:41:34 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35TGfYwS036969;
	Thu, 29 Jun 2023 11:41:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qEui6-0000XB-Mt; Thu, 29 Jun 2023 11:41:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] arago.conf: Remove open62541 pkgconfig
Date: Thu, 29 Jun 2023 11:41:34 -0500
Message-ID: <20230629164134.2008-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230629164134.2008-1-reatmon@ti.com>
References: <20230629164134.2008-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 16:41:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14735

The newer version of open62541 has encryption by default, and the
available options changed in 1.3.6.  So remove our setting.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 59b09dcc..d9f84cbd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -107,9 +107,6 @@ PACKAGECONFIG:append:pn-piglit = " \
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 
-# Enable encryption support in open62541
-PACKAGECONFIG:append:pn-open62541 = " encrypt"
-
 # Enable netperf intervals/pacing and histogram
 PACKAGECONFIG:append:pn-netperf = " intervals histogram"
 
-- 
2.17.1


