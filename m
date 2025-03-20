Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8333FC3600B
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1849.1742494249479127012
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xd2KXSEp;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAm0Z684420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=DqngY6osYFJeoIJD1bfiXyAe76rpoZXFKbbiqkzr67c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Xd2KXSEpTVd5lxz7rptppTohCJ7giRpqTapthMlBFxBBzOrx00gag7O264vxViyC9
	 zcWgnh4CrZcN94BL6Bwhbg5YgCS5aoJIOWRNjf1aUnzw9nOZiK9pBYynlYtBTrv8Zm
	 vXkT/ZP9wfHr2gZK2mbVDUzEF98aInaUHN3lF3Cc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmRd020256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAm0w126198;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLv-00083Y-Ut; Thu, 20 Mar 2025 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 06/26] init-ifupdown: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:27 -0500
Message-ID: <20250320181047.18035-7-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16105

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{init-ifupdown_%.bbappend => init-ifupdown-arago.inc}   | 2 +-
 .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-core/init-ifupdown/{init-ifupdown_%.bbappend => init-ifupdown-arago.inc} (52%)

diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-arago.inc
similarity index 52%
copy from meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
copy to meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-arago.inc
index d27bd7f0..0c1689c0 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-arago.inc
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/init-ifupdown:"
 
 PR:append = ".arago1"
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
index d27bd7f0..875b33de 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
@@ -1,4 +1,4 @@
-# look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+INIT_IFUPDOWN_ARAGO = ""
+INIT_IFUPDOWN_ARAGO:arago = "init-ifupdown-arago.inc"
 
-PR:append = ".arago1"
+require ${INIT_IFUPDOWN_ARAGO}
-- 
2.17.1


