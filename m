Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F34C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.368.1747674058332947673
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LEbG4iSg;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0vtP955155;
	Mon, 19 May 2025 12:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674057;
	bh=GKwHN7hRx2GOa3qgIvPcL2iZwXMvd8e9LHYnGgHUK5k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LEbG4iSgTdg4TNRpcgFGQh43nNzY/u7qnN37igZ0iMjWrFtaduyu3T64fQn3qfefv
	 B/U7A0rTvLXLIQftwdynDlfaPXQk8Mls3J8aUjcDiMHWvsCalqNzH5VKUjs7DI0BVE
	 9zVXolqFdTrXLWyD8BVX0Zq+R8zYaxAZcwlDZFJ4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH0vQD1593891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:00:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0ubV100486;
	Mon, 19 May 2025 12:00:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rE-0005q6-QO; Mon, 19 May 2025 12:00:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 6/9] qtbase: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:00:52 -0500
Message-ID: <20250519170055.22364-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170055.22364-1-reatmon@ti.com>
References: <20250519170055.22364-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16210

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-ti-bsp with ti-soc in the
MACHINE_OVERRIDES would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-qt/qt6/{qtbase_%.bbappend => qtbase-ti.inc}      | 0
 .../qt6-layer/recipes-qt/qt6/qtbase_%.bbappend               | 5 +++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 copy meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/{qtbase_%.bbappend => qtbase-ti.inc} (100%)

diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc
similarity index 100%
copy from meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
copy to meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
index e2799572..5faab0e4 100644
--- a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
+++ b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
@@ -1,3 +1,4 @@
-# Include the examples for Qt6 related tests
+QTBASE_TI = ""
+QTBASE_TI:ti-soc = "qtbase-ti.inc"
 
-PACKAGECONFIG:append = " examples"
+require ${QTBASE_TI}
-- 
2.17.1


