Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E9DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:12:34 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1930.1742494346722237174
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gxgn+Dix;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KICPT7075598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 13:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494345;
	bh=XLtxWr1n4d4/IkNSu3iqx9ILIU0D1+4qwVNdL0yQDC8=;
	h=From:To:Subject:Date;
	b=Gxgn+DixufF4IU6l4xEP69q3EpYWYd0w4B65twt2Uw/5FRVZ7sMzHA1zzC/HOoqki
	 AunIsveqZBelCLuMnwJ4fXxuNuEK7PKYVZD5hrJqJd890j1/RdHeVgK2ojcUnSo5Ym
	 1aavqD27ofHL3kY5qB5iJh3XWrLeuCq/1warKJ8Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KICPNL038812;
	Thu, 20 Mar 2025 13:12:25 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:12:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:12:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KICPWo087286;
	Thu, 20 Mar 2025 13:12:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKNV-0001a0-Fm; Thu, 20 Mar 2025 13:12:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-arago-demos: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Thu, 20 Mar 2025 13:12:25 -0500
Message-ID: <20250320181225.6028-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:12:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16129

Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 0bbf9a4e..40629794 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -39,11 +39,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     weston-init->kbd \
 "
 
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    udev \
-    eudev \
-    weston-conf \
-    cryptodev-module \
-"
-
 HOSTTOOLS_NONFATAL += "corkscrew getent socket"
-- 
2.17.1


