Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDCEC001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 20:49:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.145247.1692132560409776698
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 13:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wDghD3pW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FKnIax128525;
	Tue, 15 Aug 2023 15:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692132558;
	bh=loUu2hIzeWr8hKObIvSwV5uYG4Sy84VLntf6ghyASqk=;
	h=From:To:Subject:Date;
	b=wDghD3pW8imznQdvmmhM6epokSZ4Rh1OCcWtRWT3RdDrCO6n/R9LOdQCuKx74zglD
	 Bu0L0dMVpide/eR4ANnMRimfofpkd46f3fg07IG4Lh3QAQGN22VQ6xXTIYdG5EJU9C
	 WzKCgtIpRrBs9AMWHRw/8UWnUslTc0NkTG2t8Kwc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FKnI9S127782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 15:49:18 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 15:49:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 15:49:18 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FKnISr051690;
	Tue, 15 Aug 2023 15:49:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qW0yc-0006SM-8N; Tue, 15 Aug 2023 15:49:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2] mstpd: Change hard coded /sbin to $base_sbindir
Date: Tue, 15 Aug 2023 15:49:18 -0500
Message-ID: <20230815204918.24777-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 20:49:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14844

Bring this recipe into compliance with the latest standards.  Change
hardcoded /sbin path to $base_sbindir.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove FILES setting as the default is fine once we fix /sbin.

 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index a410f584..6b07889f 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -17,7 +17,7 @@ RDEPENDS:${PN} = "python3-core"
 
 inherit autotools
 
-EXTRA_OECONF = "--sbindir=/sbin"
+EXTRA_OECONF = "--sbindir=${base_sbindir}"
 
 do_configure:prepend() {
 	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
-- 
2.17.1


