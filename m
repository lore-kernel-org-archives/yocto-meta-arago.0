Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94698C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 05:55:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14484.1713160550005038365
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 22:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LJJKP5f0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43F5tkxZ118543;
	Mon, 15 Apr 2024 00:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713160546;
	bh=GvpF5cygHBAm5jD+sSnWzuAf73PWcSOg6CtG6admHRk=;
	h=From:To:CC:Subject:Date;
	b=LJJKP5f0Gjo0ZLwBmo8r7s33TnIDVgO2GUftVbxxvlriXrOfLCnk4PZ/jqafv7Fic
	 c67c2em9iFFeb+xEzAmn8AFLdbkKOANJxks2ngQfa095N+XTlcZBuikOChKmZvp0rX
	 E20Lo+h9qn/3pug1eaUnO760zXZdOwcPwFK5r6Z4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43F5tjvK018102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Apr 2024 00:55:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 00:55:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 00:55:45 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43F5timN118284;
	Mon, 15 Apr 2024 00:55:45 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: dbus: Remove redundant bbappend
Date: Mon, 15 Apr 2024 11:25:42 +0530
Message-ID: <20240415055542.3372278-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Apr 2024 05:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15281

dbus recipe from oe-core:meta already has the appropriate
SPDX license identifiers [1]. Hence, remove this bbappend.

[1]: https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend

diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
deleted file mode 100644
index da612c59..00000000
--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append = ".arago1"
-
-LICENSE = "GPL-2.0-or-later"
-- 
2.34.1


