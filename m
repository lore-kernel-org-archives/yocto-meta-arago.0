Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD45FC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:29:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.49275.1723476563824235774
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 08:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NKJnbA4+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47CFTMYe108244;
	Mon, 12 Aug 2024 10:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723476562;
	bh=S6LfArjyXtrwuOAUnJGe3HefB+t77uU97bHtGto0SP0=;
	h=From:To:Subject:Date;
	b=NKJnbA4+m1gyUSziTEZVMvQ7jblFXklv7uNIUjdwpoUm+xUn2NtgEyiu4B4pvoL7E
	 OnBxnfInypm01kX8WFU6tYz/ewLKD+1dfBuPuD8UW7ACfhHvInboFnej0aTbu+GkRf
	 anWuh4OpxUc1dVG9qJeCyURgRv4GgpdG8M1k6Rlc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47CFTMZW036873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Aug 2024 10:29:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Aug 2024 10:29:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Aug 2024 10:29:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47CFTMMT032555;
	Mon, 12 Aug 2024 10:29:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sdWz4-0007wJ-Fd; Mon, 12 Aug 2024 10:29:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-toolchain-arago: Inherit nopackage
Date: Mon, 12 Aug 2024 10:29:22 -0500
Message-ID: <20240812152922.30479-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Aug 2024 15:29:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15509

Since this is a bootstrap recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index be18be00..fa8ed3d4 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -10,6 +10,7 @@ SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
 inherit toolchain-scripts
 inherit tisdk-sw-manifest
+inherit nopackages
 
 require recipes-core/meta/meta-toolchain.bb
 
-- 
2.17.1


