Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12849EE49AF
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:44:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.9909.1692744274395842962
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 15:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zU5svqA6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiVSd097081;
	Tue, 22 Aug 2023 17:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692744271;
	bh=giMtSREfe3oE1afWLmkgtG5Oo+UiEYrzKL5/UKYRoNk=;
	h=From:To:CC:Subject:Date;
	b=zU5svqA6bdu8IUrQMZ73EY791EH0aQdYeJ6Y8SScw/06AnSpkXpLbJ2l9vVHFyCKg
	 9mkVKDZ8c+njXZCNCZIu9SDLV/txAFAFUppflej4YPG2XyKt3w0Wa0ElhG2PoI3lBv
	 aZSDgd1hCpBogUASnB36hEob8RRjMzMEelGdIxOc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MMiVkD048328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 17:44:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 17:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 17:44:30 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUqX056368;
	Tue, 22 Aug 2023 17:44:30 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCHv2 0/3] Packagegroup and irqbalance fixup
Date: Tue, 22 Aug 2023 17:38:28 -0500
Message-ID: <20230822224427.1880115-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Aug 2023 22:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14862

From: Randolph Sapp <rs@ti.com>

Rework of previous series to include feedback and drop the additional
packagegroup.

I was previously trying to mold a existing build target into something useful
for RT applications (where the end user want's to cheat and not properly tune
the system to their usecase) but that should have be addressed separately with a
new build target. Maybe someone will revisit that eventually.

Randolph Sapp (3):
  packagegroup-arago-bootstrap: fix RDEPENDS notation
  packagegroup-arago-base: edit the description to describe current use
  irqbalance: remove append to install systemd script

 .../recipes-core/packagegroups/packagegroup-arago-base.bb   | 2 +-
 .../packagegroups/packagegroup-arago-bootstrap.bb           | 2 +-
 .../recipes-extended/irqbalance/irqbalance_git.bbappend     | 6 +-----
 3 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.41.0


