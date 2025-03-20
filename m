Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DC5C3601C
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:54 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1848.1742494249385321226
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ikn0FgNM;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAm95684418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=mg1YYCmf0pKtxm2ipAtN0UqOrUbaLM5us25QuHZ0zfs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ikn0FgNMkxmwtKrI/Hna983Qj3DuFC+3yX/QwjzW+rVqWqFeGgVjgloGFmTxE4AQ+
	 WNOM2EkVcaZkXq7okaButbMPpF4qmIz0xUwRquq74Ik6tjqcWefXZnRaLCGpQP037c
	 BfeMox3nTfizeDp6yaBHP80fFO7vK5N0PE9D9YWA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAm9g024507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAlKd126188;
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLv-0007ZH-K0; Thu, 20 Mar 2025 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 03/26] base-files: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:24 -0500
Message-ID: <20250320181047.18035-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16103

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{base-files_%.bbappend => base-files-arago.inc}         | 2 +-
 .../recipes-core/base-files/base-files_%.bbappend           | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-core/base-files/{base-files_%.bbappend => base-files-arago.inc} (53%)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files-arago.inc
similarity index 53%
copy from meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
copy to meta-arago-distro/recipes-core/base-files/base-files-arago.inc
index 7d1f6751..16679c42 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files-arago.inc
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/base-files:"
 
 PR:append = ".arago5"
diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
index 7d1f6751..3e8d8855 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
@@ -1,4 +1,4 @@
-# look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+BASE_FILES_ARAGO = ""
+BASE_FILES_ARAGO:arago = "base-files-arago.inc"
 
-PR:append = ".arago5"
+require ${BASE_FILES_ARAGO}
-- 
2.17.1


