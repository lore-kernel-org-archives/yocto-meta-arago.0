Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD22EC36010
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1878.1742494249661734502
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ma6DYMKe;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmSA703248
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=EW+H8DIyPVbVRqrL4LUhb9aS3bRhGA0zd78H/rLB3xI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ma6DYMKe4fmCtuJxRSGZVWiIhocU1C/PUXTeaf7NgzDayrktMyLe8mQHdxpxG7NLb
	 9u3GVva8akrGN0ecS4TQihmL/TuOOyUAmQC/HNBmeMn794o4rZrlAKGvEzeOMFtOfn
	 e+i8rVXzD66IQy5CM8xWBDB5Nh/0ROAHabxiXqFI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmaS038121;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAlhn085660;
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLv-00078R-A2; Thu, 20 Mar 2025 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 01/26] alsa-state: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:22 -0500
Message-ID: <20250320181047.18035-2-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16111

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{alsa-state.bbappend => alsa-state-arago.inc}           | 2 +-
 .../recipes-bsp/alsa-state/alsa-state.bbappend              | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-bsp/alsa-state/{alsa-state.bbappend => alsa-state-arago.inc} (53%)

diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc
similarity index 53%
copy from meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
copy to meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc
index ef9c2f32..80dfa776 100644
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc
@@ -1,4 +1,4 @@
 PR:append = ".arago0"
 
 # look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/alsa-state:"
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
index ef9c2f32..1a4fc80b 100644
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -1,4 +1,4 @@
-PR:append = ".arago0"
+ALSA_STATE_ARAGO = ""
+ALSA_STATE_ARAGO:arago = "alsa-state-arago.inc"
 
-# look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+require ${ALSA_STATE_ARAGO}
-- 
2.17.1


