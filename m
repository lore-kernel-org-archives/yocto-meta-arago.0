Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F794E7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:42:23 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.154587.1734709334320935739
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 07:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pFDUbnYR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFgCcn480898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 09:42:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734709332;
	bh=7h2yLKJdrnXE6EMHtQ9GhZlA1TKbODomeARCTn6RQV0=;
	h=From:To:CC:Subject:Date;
	b=pFDUbnYRgaN157Uc7A1fkoBmPndbcAoDJHpuozM1IPl2MceDJVoYqNczXgE5VZWQZ
	 FixrWzYqRctJb6+XLxNVLq8sKcmyL6qTi+QCvr9j7RITjhnMBP6A0DhAq82Zl8wLSL
	 Z8z0N/ZGeLfHlciCJKRpgOPXuWJpZrv769nQJXv4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFgCWJ021778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 09:42:12 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 09:42:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 09:42:12 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFgBe4047451;
	Fri, 20 Dec 2024 09:42:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Drop ARAGO_SYSTEST as a BUILD_VARIANT
Date: Fri, 20 Dec 2024 09:42:11 -0600
Message-ID: <20241220154211.201636-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Dec 2024 15:42:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15675

This is not currently used and will be dropped from meta-ti, remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                   | 7 +------
 .../conf/distro/include/branding-bleeding.inc              | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8e094e02..8ee1f571 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -2,7 +2,7 @@
 DISTRO_NAME = "Arago"
 DISTRO_VERSION = "2023.10"
 DISTRO_FEED_URI ?= "http://lcpd.itg.ti.com"
-BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
+BUILD_VARIANT = "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
 TISDK_VERSION ?= "live"
 FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
 
@@ -151,11 +151,6 @@ ARAGO_RT_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
 ARAGO_IMAGE_SUFFIX:append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
 
-# Set systest kernel suffix
-ARAGO_SYSTEST_ENABLE ?= "0"
-ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
-IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
-
 # Enable basic stack and buffer overflow protections
 #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
 #TARGET_CPPFLAGS += "-fstack-protector"
diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 0008a442..4efbb225 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -5,7 +5,6 @@ require branding-core.inc
 # Auto rev important packages to pick up latest
 SRCREV:pn-linux-ti-staging = "${AUTOREV}"
 SRCREV:pn-linux-ti-staging-rt = "${AUTOREV}"
-SRCREV:pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV:pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV:pn-ltp-ddt = "${AUTOREV}"
 #SRCREV:pn-optee-os = "${AUTOREV}"
-- 
2.39.2


