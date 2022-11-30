Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3F7C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:13:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26811.1669846434412519151
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Npqf/wOz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMDrct080366;
	Wed, 30 Nov 2022 16:13:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669846433;
	bh=y3Tc1m/Mn4DmlOA+MlHIz46oDD2KFyDNSwb8ArFrHuM=;
	h=From:To:Subject:Date;
	b=Npqf/wOzy0xkSTQC0SUz240ZBOPDIXLOPH/l5bkXDF6sodJFX4YQ/NEszyMHVgWJU
	 OPEoPsTnQjlEOy1G7RM82P6qn9tQp4S2/+8J803An4UNiYPlJGOhK1wjjflg5ePjWw
	 wJZhX+aZSBPElB7QlFfC+tBacoXaZN64L/ffR0fM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUMDrqB003168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 16:13:53 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 16:13:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 16:13:53 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMDru7008615;
	Wed, 30 Nov 2022 16:13:53 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p0VKz-0001nY-1E; Wed, 30 Nov 2022 16:13:53 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] qtwayland: Bump version to v5.15.7-lts-lgpl
Date: Wed, 30 Nov 2022 16:13:53 -0600
Message-ID: <20221130221353.6872-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14120

There is a build error with the v5.15.4-lts-lgpl version and
xkbcommon. The bug was fixed in the next LTS, so go ahead and
move to the latest version available.

This haas been sent to meta-qt5 as a pull request.  When they
move to a version that does not have this build issue we will
revert this change.

Upstream-Status: Pending

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index 23a2f907..f6d6ceec 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -5,3 +5,6 @@ SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
     file://0001-examples-fix-wayland-texture-sharing-custom-composit.patch \
 "
+
+SRCREV = "533fff12f7c4beb177b56b766c71b1c7384e6229"
+
-- 
2.17.1


