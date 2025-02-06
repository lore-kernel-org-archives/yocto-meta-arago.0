Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C591C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:07:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.50091.1738868829478553411
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KX+Onye5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516J78hd2784732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:07:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738868828;
	bh=9YA/3MBV4oOnWbdS/OHL80AJoQ11PGo9q7/i8Vkmpqw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KX+Onye5vBDJVu8vAbA7TjBidRSxMLNyzWZWq1Fe0X8x6WA0QBsbKZ/EHYCzczfH4
	 rqoh1Xg768lQkAegwenRwnCQkNnHcS7cSyesIGz4Ll1wsvWrePXAUcCXYi2BUyhFyA
	 jf/k7FdKoMFKilcsZWDKUCrapdFd2CgHeuAFVqaY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516J78b2040242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:07:08 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:07:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:07:02 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516J70uA111637;
	Thu, 6 Feb 2025 13:07:02 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 5/5] meta-arago-extras: eventdump: Use default FILESEXTRAPATHS
Date: Thu, 6 Feb 2025 13:07:00 -0600
Message-ID: <20250206190700.1190499-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206190700.1190499-1-afd@ti.com>
References: <20250206190700.1190499-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 19:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15833

Rename the directory containing the extra files so we can
use the default FILESEXTRAPATHS and remove the prepend.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...01-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch | 0
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb   | 2 --
 2 files changed, 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/eventdump/{files => eventdump}/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch (100%)

diff --git a/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch b/meta-arago-extras/recipes-devtools/eventdump/eventdump/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
similarity index 100%
rename from meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
rename to meta-arago-extras/recipes-devtools/eventdump/eventdump/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index ddd5d5c2..f8864bae 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -7,8 +7,6 @@ PV = "1.0+git"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-
 SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master \
 	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
 
-- 
2.39.2


