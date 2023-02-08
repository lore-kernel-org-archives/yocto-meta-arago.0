Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A4EC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:41:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1229.1675899695420759513
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ymr6Owyz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NfY74088038;
	Wed, 8 Feb 2023 17:41:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899694;
	bh=q7Ypv5Zwi52N7x53Q/0STO3Hl+rPpQMIJo1tjxozSvM=;
	h=From:To:CC:Subject:Date;
	b=ymr6OwyzjJjJBW3NyBMf9BMjZJDxX4cGImcoTDlA9szI5rKHGVNmKYJ5vhJM+tIUx
	 5G1jlYlA6yKu8YpPUOTe0w4vxamoBJH7ppS7fDw0x/aAejJzbRzxchyKKEMIiF/KJS
	 f/N/8l4LvsqOS/Tr9gLxbMORqM5KsWMVQj1XJp10=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NfYh1045835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:41:34 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:41:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:41:34 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NfXPs017180;
	Wed, 8 Feb 2023 17:41:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] tisdk-thinlinux-image: Include connectivity and security for IoT
Date: Wed, 8 Feb 2023 17:41:33 -0600
Message-ID: <20230208234133.20408-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14215

The thinlinux image targets IoT which heavily depends on connectivity and
security by its nature. Include those packagegroups.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 8827ac16..5161704d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -15,6 +15,8 @@ IMAGE_INSTALL += "\
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
+    packagegroup-arago-tisdk-connectivity \
+    packagegroup-arago-tisdk-crypto \
     docker \
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
-- 
2.39.1


