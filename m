Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DFCC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:24:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.31262.1754501083244248468
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NUb/jwFW;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576HOftb130944;
	Wed, 6 Aug 2025 12:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754501081;
	bh=NJdhSEytdNrjYDGgGSLxOxKPT+Be0bak7RvPeDVV2iQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NUb/jwFWPXEYxuedMuSRoeMlR1tI2ACxgSzTzN/SmPGOVbs0sTSnpttZ0NH5IRhoL
	 sJ/eIu0ecNC7tMecnnmuibiK6KfdhOEH8HASiWmUep4FaERQm4ojaGtsIgFxLZ7ogl
	 cJptRp7oOMqSrufQ3eoTVxi9H1L41jce4W/7ppuM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576HOfVN187985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:24:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:24:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:24:41 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576HOZ8C4188594;
	Wed, 6 Aug 2025 12:24:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 1/2] packagegroup-arago-tisdk-addons: Add ti-ipc-examples-linux for omap-a15
Date: Wed, 6 Aug 2025 22:54:34 +0530
Message-ID: <20250806172435.296187-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806172435.296187-1-b-padhi@ti.com>
References: <20250806172435.296187-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16354

Add ti-ipc-examples-linux package for omap-a15 which builds and packages
the application host for messageq IPC testing.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index d9ab3617..8af1cf45 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -85,6 +85,7 @@ EXTRA_PACKAGES:omapl138 = " \
     protobuf \
 "
 
+EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
 #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"
 #EXTRA_PACKAGES:append:am437x-evm = " pruss-lld-apps"
 #EXTRA_PACKAGES:append:am57xx-evm = " pruss-lld-apps"
-- 
2.34.1


