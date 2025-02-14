Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D257C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 19:00:51 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.28963.1739559649617394006
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 11:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bMOy+X09;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EJ0mnd195398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 13:00:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739559648;
	bh=xQ0C93Ua4Lt+8C2RQmVWtwrlDyyg7p+oyWKEHEn4o3k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bMOy+X09othnANmMfcz1mv78sfMw3upsJLsYsCyyxGZXQo1rGucTWkoWySvg/VJuT
	 Nn62fn41ogn6OjUaauo9I7Ok8qLbSIaxw22gDGFUF/kx6Opt8/u7PRNasRZxlsSkMd
	 L1rwaXVV1rNsMOB2aq6mkqQuw/wIOHY/bYQAEUVc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51EJ0m4G017401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 13:00:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 13:00:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 13:00:47 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EJ0l4s050654;
	Fri, 14 Feb 2025 13:00:48 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-arago][scarthgap][PATCH 2/2] arago.conf: enable opencl distro feature
Date: Fri, 14 Feb 2025 13:00:36 -0600
Message-ID: <20250214190036.360301-3-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214190036.360301-1-rs@ti.com>
References: <20250214190036.360301-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Feb 2025 19:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15848

From: Randolph Sapp <rs@ti.com>

The GPU (for rogue devices) is now capable of supplying required OpenCL
libraries. Additional tests for this feature will be pulled in later.

This was previously disabled due to an outdated opencl library on legacy
devices. The offending library has since been removed.

Signed-off-by: Randolph Sapp <rs@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 0b30b882..91c67d4b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -48,7 +48,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
 DISTRO_FEATURES:remove = "x11"
-#DISTRO_FEATURES:append = " opencl"
+DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.48.1


