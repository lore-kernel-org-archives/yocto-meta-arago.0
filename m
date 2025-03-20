Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB8BC3600A
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1854.1742494249959477011
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QMbH9hFC;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmwF090962
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=UY8PVBysuelhkSqRGysPiNVSdkevpBMZlPOwYQq9e/w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QMbH9hFCPs3e+UFyqWz/6q3NECwiNI0rfc+cxwkkH+mYUtQLczwA1kBI0cYJCDQxv
	 RtibE16izXIMYWEM9ULpRw6RE5a/L+9pMuFEXtuSO33BWMnmvTtTcWvKgIRlIRmNcI
	 kcsO2MJMjnEFOtXmoIWcW7uCqjEg9Qa7hnwE+dSc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmTB020260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmG5085683;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-0008FL-2d; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 07/26] psplash: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:28 -0500
Message-ID: <20250320181047.18035-8-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16113

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{psplash_git.bbappend => psplash-arago.inc}      |  2 +-
 .../recipes-core/psplash/psplash_git.bbappend        | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)
 copy meta-arago-distro/recipes-core/psplash/{psplash_git.bbappend => psplash-arago.inc} (83%)

diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash-arago.inc
similarity index 83%
copy from meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
copy to meta-arago-distro/recipes-core/psplash/psplash-arago.inc
index f522261f..5e481434 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash-arago.inc
@@ -1,5 +1,5 @@
 # look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/psplash:"
 
 PR:append = ".arago5"
 
diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index f522261f..7c9da9fc 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -1,10 +1,4 @@
-# look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+PSPLASH_ARAGO = ""
+PSPLASH_ARAGO:arago = "psplash-arago.inc"
 
-PR:append = ".arago5"
-
-SRC_URI += "file://psplash-18bpp.patch                      \
-            file://0001-psplash-Add-Arago-custom-color.patch\
-"
-
-SPLASH_IMAGES = "file://txn-logo.png;outsuffix=default"
+require ${PSPLASH_ARAGO}
-- 
2.17.1


