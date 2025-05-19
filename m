Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7CBC54795
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.367.1747674058192649056
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bkXjLWNf;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0uwW517731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674056;
	bh=w4pHrUNtLIIHKoZyM67rsqYBuPflC98/oRy0sCjCT8A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bkXjLWNfdcsOjm3yBwa7r4NRiUGEyGdOZqPM2cW1XFlXE1eZx+UDZMaNna0uQTEbe
	 QKpFOAWBAoBJ4jA9iwDWyzFrLNjlTYQuwWALNo8O/YaVS5gqx2EVgm5xUl6lh6WVaf
	 6lFqrwrMDLObq4aLnHE3OP1nZ2dQ4RJOquLdg2C4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0ufd085219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:00:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0uhQ100474;
	Mon, 19 May 2025 12:00:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rE-0005ph-8f; Mon, 19 May 2025 12:00:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/9] CLEANUP: :append needs a space
Date: Mon, 19 May 2025 12:00:48 -0500
Message-ID: <20250519170055.22364-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16209

Usually :append is used to add items to a space separated list.  In
those cases the first character of the appended string should be a
space to make sure that the append is correct.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/wayland/weston-init-arago.inc              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
index fc964df5..28c4b1b9 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
@@ -11,4 +11,4 @@ do_install:append() {
     install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
 }
 
-FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
+FILES:${PN}:append = " ${bindir}/weston-launch-calibrator"
-- 
2.17.1


