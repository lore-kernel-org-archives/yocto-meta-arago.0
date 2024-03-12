Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7668FC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:12:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12520.1710256330861290700
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MtnHiHmY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFC93P062431;
	Tue, 12 Mar 2024 10:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710256329;
	bh=H43zSQlSMa9fL/s2pVOZmDS7nkxVLE0z08H8v0XZ3Yc=;
	h=From:To:CC:Subject:Date;
	b=MtnHiHmY2st6S1X3m5Ijvb2B0B04cStPwvr7lJqMmkA+nR6hNHKEuGFjvTsiSnwDq
	 APdHQEMqYnObr7O0I/9DZi0Q1G4zY2W/XkI+8KIgfYIOqJMMaV5imJ+jaqCnExCcZV
	 Qj21QXaK06tY+GjzwqxDbW5Ikj9nqVPpmqu8UdR0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFC9LR027534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:12:09 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:12:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:12:08 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFC8VN090033;
	Tue, 12 Mar 2024 10:12:08 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] packagegroup-arago-tisdk-addons: Remove ti-ipc-examples-linux
Date: Tue, 12 Mar 2024 10:12:08 -0500
Message-ID: <20240312151208.15349-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Mar 2024 15:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15235

This IPC example is no longer supported nor recommended for new designs.
The documentation is no not available either (was on Processors Wiki).
Remove this example.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 11d10596..db778699 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -85,9 +85,6 @@ EXTRA_PACKAGES:omapl138 = " \
     protobuf \
 "
 
-EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
-EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
-
 #EXTRA_PACKAGES:append:omap-a15 = " \
 #    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
 #"
-- 
2.39.2


