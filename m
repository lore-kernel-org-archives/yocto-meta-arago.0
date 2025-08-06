Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ED2C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:24:54 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.31012.1754501085749747483
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kTCp1eIU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576HOi23566677;
	Wed, 6 Aug 2025 12:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754501084;
	bh=wQK4285wCKbuuMHdWruAjIdY6n1T4Xu7YTKjUuhX28E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kTCp1eIU0iEWXwTEUM3K+0WMqwPcoj+OS0711doFS0dJhfNCRGlw6zE91oYLOKyWt
	 FuNNvxWHRn0EzJSqvHiCk+O4O/2QpU4Rosqz6UQ7xKaHQOiDFnqCzG9zGvt6w2v+th
	 Lmf0JrVrsvJPvbAd3mRcvyYe7j+i6T3TMVToi1h0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576HOirf284151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:24:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:24:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:24:43 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576HOZ8D4188594;
	Wed, 6 Aug 2025 12:24:41 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 2/2] packagegroup-arago-tisdk-addons: Add ti-rtos-messageq-test-fw package
Date: Wed, 6 Aug 2025 22:54:35 +0530
Message-ID: <20250806172435.296187-3-b-padhi@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:24:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16355

Add ti-rtos-messageq-test-fw package to UTILS for omap-a15 platform
which packages the pre-built messageq firmware into root and boot
partition.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8af1cf45..9632cf18 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -48,6 +48,7 @@ UTILS:append:omap-a15 = " mmc-utils \
                           stream-openmp \
                           pru-icss \
                           ti-ipc-rtos-fw \
+                          ti-rtos-messageq-test-fw \
 "
 
 UTILS:append:k3 = " mmc-utils \
-- 
2.34.1


