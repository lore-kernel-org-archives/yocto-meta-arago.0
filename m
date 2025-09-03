Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12FECA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:36:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.22036.1756928155975987670
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 12:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UK/If1E3;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583JZt783339746;
	Wed, 3 Sep 2025 14:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756928155;
	bh=n9ezWpbyh7gLwcseD7PmPis32MlI2Wu4E3thlPu249c=;
	h=From:To:Subject:Date;
	b=UK/If1E3iFth7+YYyoJIUewVilUjq3TaZLlNYn87UjQosi+hJWrLcV7zckMBpZH1s
	 ntS2JxuWlYVe6kKbTrpV+fxfOIUkIa9Xd12aTqRHko5/W/XAa8IDHVe1EHYDH2kG44
	 KeojHbqh9ROy6dzfxGQ48qN9fy1iZyyQTTBIOIDk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583JZtmi3272760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 14:35:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 14:35:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 14:35:54 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583JZs8D1798698;
	Wed, 3 Sep 2025 14:35:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uttGs-00042X-EV; Wed, 03 Sep 2025 14:35:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-arago-test: Remove qt6 examples PACKAGECONFIG
Date: Wed, 3 Sep 2025 14:35:54 -0500
Message-ID: <20250903193554.15488-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Sep 2025 19:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16518

There was a recent change in meta-qt6 that removed the option for
setting the PACKAGECONFIG to include "examples" [1].  It looks like the
only change we need to do is stop setting PACKAGECOFNIG.  The
qtbase-examples recipe is newly created and we are already including
that in ti-test.

[1] https://code.qt.io/cgit/yocto/meta-qt6.git/commit/?id=fbaed93d8bdb8b1833bae655a303803f9c5dc5ab

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc     | 3 ---
 .../dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend | 4 ----
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc
 delete mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend

diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc
deleted file mode 100644
index e2799572..00000000
--- a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ti.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-# Include the examples for Qt6 related tests
-
-PACKAGECONFIG:append = " examples"
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
deleted file mode 100644
index 5faab0e4..00000000
--- a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-QTBASE_TI = ""
-QTBASE_TI:ti-soc = "qtbase-ti.inc"
-
-require ${QTBASE_TI}
-- 
2.17.1


