Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8300EC35FF8
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.39075.1741790742392817945
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cx+0ZcMf;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfEA1525226
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=LMjz88pLaEehnztsRrZHeNvKJ6bUL9svK8PUEfaI12Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Cx+0ZcMfgCxzl/pEqAyqGQkt8L9/CFN/S2xkChykXw8EuucVeBiAQV8DtGYf3uuIU
	 0coc+qBjlfF290UApPSuiVSxqXresp05q63fYrSf7+gaapaGjGRv5y5dhOQW8GZlzi
	 WqGFer3uKK6dgT9BK8hZS9j75hSHDAfdCZwBUdb0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjfmO021529;
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjeYG007004;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003pt-JV; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 05/10] v4l-utils: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:35 -0500
Message-ID: <20250312144540.14210-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15998

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{v4l-utils_%.bbappend => v4l-utils-arago.inc}        | 2 +-
 .../recipes-multimedia/v4l2apps/v4l-utils_%.bbappend     | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)
 copy meta-arago-extras/recipes-multimedia/v4l2apps/{v4l-utils_%.bbappend => v4l-utils-arago.inc} (69%)

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
similarity index 69%
copy from meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
copy to meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
index 9b74dc7c..204874b6 100644
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/v4l-utils:"
 
 SRC_URI:append = " \
     file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
index 9b74dc7c..250bcb18 100644
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
@@ -1,7 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+V4L_UTILS_ARAGO = ""
+V4L_UTILS_ARAGO:arago = "v4l-utils-arago.inc"
 
-SRC_URI:append = " \
-    file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
-"
-
-PR:append = ".arago0"
+require ${V4L_UTILS_ARAGO}
-- 
2.17.1


