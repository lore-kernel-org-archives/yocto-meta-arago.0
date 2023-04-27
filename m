Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7FC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:20:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.27203.1682616049260620762
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=St2g329h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj5Z079590;
	Thu, 27 Apr 2023 12:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682616045;
	bh=Cxhz4FpLajkUl5z9ocsKqPyTTWv4Lo9nMzzv/AZzizU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=St2g329hSKhoEay2tVb4OXsR6O0uu1HQnzr84CWYgwatgSoMAy6dl3zA2lhVpnCcE
	 CBM3SqDK1JPZEEj7hIZGVgXaUEYaWkB2ZLYY6f23JEKHfju0NlHro2vFLk2xWvT5zq
	 VHTz4E8kWwPj8m4txpDl+JiQXpwzWSZ7Pc372JDI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RHKjxK000559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 12:20:45 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 12:20:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 12:20:45 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj8g110570;
	Thu, 27 Apr 2023 12:20:45 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 1/5] arago.conf: drop the explicit removal of x11, add vulkan
Date: Thu, 27 Apr 2023 12:20:32 -0500
Message-ID: <20230427172036.863789-2-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172036.863789-1-rs@ti.com>
References: <20230427172036.863789-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 17:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14367

From: Randolph Sapp <rs@ti.com>

Drop the explicit removal of x11 as the new PVR Vulkan libs have runtime
dependencies on libx11.

Add vulkan as a distro feature.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 094e67da..58841051 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,12 +45,10 @@ TMPDIR .= "${TCMODEAPPEND}"
 # Start with default set of distro features
 DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
-# Remove some unwanted features
-DISTRO_FEATURES:remove = "x11"
-
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
 #DISTRO_FEATURES:append = " opencl"
+DISTRO_FEATURES:append = " vulkan"
 DISTRO_FEATURES:append = " opencv"
 DISTRO_FEATURES:append = " openmp"
 
-- 
2.40.0


