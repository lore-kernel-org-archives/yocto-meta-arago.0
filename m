Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC69C36011
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1882.1742494250739232966
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GN3Ve7pK;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnuR703252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494249;
	bh=+v49fUElLcLRxYtIGQeRDmX9CO3TahjNskUVvF1Xx60=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GN3Ve7pKA7Nt4yNZSwGFmVSgJIKe/2ZgQqraDBd26KePTD4ZX8qIaPEMQ2BrmWh/3
	 WDk4FUX+AoP3TtjxvdrlPxCLAmB1cmATs/m9N7ys2j8TuiMKkg1rByvW6mZkw00w3A
	 t5mq0tNxeu7Grz4l+rCiI1NxuJOPLPs4KybgFo1k=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAndx024517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAnse085703;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-0000vh-UY; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 15/26] freetype: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:36 -0500
Message-ID: <20250320181047.18035-16-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16116

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../freetype/{freetype_%.bbappend => freetype-arago.inc}     | 0
 .../recipes-graphics/freetype/freetype_%.bbappend            | 5 +++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 copy meta-arago-distro/recipes-graphics/freetype/{freetype_%.bbappend => freetype-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
copy to meta-arago-distro/recipes-graphics/freetype/freetype-arago.inc
diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
index 860a0797..56b11e93 100644
--- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
@@ -1,3 +1,4 @@
-PR:append = ".arago0"
+FREETYPE_ARAGO = ""
+FREETYPE_ARAGO:arago = "freetype-arago.inc"
 
-LICENSE = "GPL-2.0-or-later"
+require ${FREETYPE_ARAGO}
-- 
2.17.1


