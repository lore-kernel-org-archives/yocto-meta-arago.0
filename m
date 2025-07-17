Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E04C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:48:59 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.689.1752763731512711207
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 07:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M+xMB0fG;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HEmoK4034182;
	Thu, 17 Jul 2025 09:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752763730;
	bh=C1phjLfSXAw4najZxzTkS47cUq6BE5DKSwWAWgK+ovk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M+xMB0fGk9xOIU9kicR+IxiC+YN0H9jXhHWFAKn3wFQOyWqYEBqsw+0oetMrj9+Jn
	 hc1dNvHbK5tNQauqDDbpjnwMQz2JI86DxUTkhqXwdrVQ+WJmaNQbl1sfmtIiug/MJB
	 KdiOi2zvoaJHHzH06IcYzghiIbanPZ5RJbxkQdBA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HEmoSI1711508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 09:48:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 09:48:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 09:48:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HEmo6x2339178;
	Thu, 17 Jul 2025 09:48:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ucPuj-00008Y-Se; Thu, 17 Jul 2025 09:48:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 2/3] CLEANUP: Add missing SUMMARY
Date: Thu, 17 Jul 2025 09:48:48 -0500
Message-ID: <20250717144849.471-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717144849.471-1-reatmon@ti.com>
References: <20250717144849.471-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 14:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16304

Every recipe should have a SUMMARY and that can only be 72 characters at
most.  These recipes had DESCRIPTIONS and not SUMMARY.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/busybox/softap-udhcpd-config_1.0.bb            | 2 +-
 .../recipes-support/makedumpfile/makedumpfile_1.5.0.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
index 0c896fed..bc72d383 100644
--- a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Configuration files for SoftAP with udhcpd"
+SUMMARY = "Configuration files for SoftAP with udhcpd"
 SECTION = "console/network"
 HOMEPAGE = "http://udhcp.busybox.net/"
 LICENSE = "GPL-2.0-only & BSD-4-Clause"
diff --git a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
index 29e6c18d..2b7002f5 100644
--- a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
+++ b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Make dump file utility"
+SUMMARY = "Make dump file utility"
 LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.17.1


