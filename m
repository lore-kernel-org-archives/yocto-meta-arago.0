Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D70C27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:14:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18909.1717690459212024407
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jJubsuHO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456GEGF1038564;
	Thu, 6 Jun 2024 11:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717690456;
	bh=fHLWDOFvVYInMF5Pl1uLku4lsl6xFPtuY9HpnCZqX+s=;
	h=From:To:CC:Subject:Date;
	b=jJubsuHOL1X1CKsJSYnf+bST9VWNiP3+S6TeQJXIyaX8zHwPas6FPn4BYf3kYBGNV
	 IjRBeOXkfrnZubBMergcPoexAcZxmtC1fAgoXJB//T9kiDv/5tFu4CCU47sgLVmauv
	 mdQAbjadTQSAR9kTR4yLraznS/nblAL9EOz3hSoE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456GEGvK130439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 11:14:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 11:14:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 11:14:16 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456GEGGG052022;
	Thu, 6 Jun 2024 11:14:16 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCHv2] gitignore: lift some sane defaults from others
Date: Thu, 6 Jun 2024 11:14:15 -0500
Message-ID: <20240606161415.1375617-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jun 2024 16:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15371

From: Randolph Sapp <rs@ti.com>

Lift the common parts of the top level gitignore from oe-core and
meta-openembedded. This masks out temporary python files, intermediate
artifacts, and unclean patch leftovers (.orig, .rej, etc).

We're choosing to leave patches at the root of the project out of this
as maintainer preference.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .gitignore | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..ae174429
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+*.pyc
+*.pyo
+*.swp
+*.orig
+*.rej
+*~
-- 
2.45.1


