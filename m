Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DCBC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 19:59:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3060.1717444788785590937
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 12:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LubU2PFo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453JxlIg021094;
	Mon, 3 Jun 2024 14:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717444787;
	bh=glHh64ofxEvjLMLcwZzsOqBeakkL04FKgZekhmX/DGQ=;
	h=From:To:CC:Subject:Date;
	b=LubU2PFo/TldCjQPPXTlng4X4eFGXvINoc6O1ieuo9xAXG2doBXLtjvjdkAhGDmHB
	 ARNb3q9RmQAgV4SWDfB+22tPUEUnVpxAefXAKgFC5b9Zh8vFvS/STv0CRvEOYhtZTb
	 UPc4NXTjRtt617TuQvl0Qjywj8HbyJORhZo/EecQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453JxlW7022032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 14:59:47 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 14:59:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 14:59:47 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453JxlP4017072;
	Mon, 3 Jun 2024 14:59:47 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] gitignore: lift some sane defaults from others
Date: Mon, 3 Jun 2024 14:59:43 -0500
Message-ID: <20240603195943.1089740-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 19:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15356

From: Randolph Sapp <rs@ti.com>

Lift the common parts of the top level gitignore from oe-core and
meta-openembedded. This masks out temporary python files, intermediate
artifacts, and patches at the root of the project.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .gitignore | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..c01df45e
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,7 @@
+*.pyc
+*.pyo
+/*.patch
+*.swp
+*.orig
+*.rej
+*~
-- 
2.45.1


