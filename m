Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CB6C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1864.1742494251617110326
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H5MheHKd;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoeV684467
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=fyaRN7AvjGhItFFtRVLtBo6N2eVZRPQTXUEmtL9LV4Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=H5MheHKdbs43zbHee3Kt/G7d0CUdI/W9nPYKywgXNMsj+kMeIobS9nuZ7fSEq+52K
	 TQ/v4lBCUhCcI4aIVpGFkMMWppE+00/2nTzPCjbQ7OH63gJF2ZYu8KsOST/vPCNtDe
	 3CGEnIgkNBsQABCDqdC+1GXYFZzFGQm2jAJClwHI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAo9q049410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAolP126298;
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLy-0001Pz-7p; Thu, 20 Mar 2025 13:10:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 26/26] syslog-ng: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:47 -0500
Message-ID: <20250320181047.18035-27-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16126

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../syslog-ng/{syslog-ng_%.bbappend => syslog-ng-arago.inc} | 0
 .../recipes-support/syslog-ng/syslog-ng_%.bbappend          | 6 ++++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 copy meta-arago-distro/recipes-support/syslog-ng/{syslog-ng_%.bbappend => syslog-ng-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
copy to meta-arago-distro/recipes-support/syslog-ng/syslog-ng-arago.inc
diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
index 6c6a8ff0..0dbc6349 100644
--- a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
+++ b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
@@ -1,2 +1,4 @@
-PR:append = ".arago0"
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+SYSLOG_NG_ARAGO = ""
+SYSLOG_NG_ARAGO:arago = "syslog-ng-arago.inc"
+
+require ${SYSLOG_NG_ARAGO}
-- 
2.17.1


