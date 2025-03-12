Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5BBC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:36:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.38602.1741790193088449651
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yJwyc+Ps;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEaU3C1056227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 09:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790190;
	bh=TDX0KQ5EJ+7sTU8rEvlozwHcGNb7aT+GLjT7zO4P02c=;
	h=From:To:Subject:Date;
	b=yJwyc+Psk6FKVbltOe7r+CS9g51x7MdTd4cMeuK2H58thnD1V2HPbE+kaloNgkxlI
	 ZM45jX5y01p/fzOfEMfeHYZmAjP5IOHbIYYSWIoYQAPirWkZlVqldxXmDFF53n7Asc
	 L6qHycR6Rgr8a/rGKMfLYuFPqq5kA3F52oSeQaSo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEaU3R016338;
	Wed, 12 Mar 2025 09:36:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:36:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:36:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEaUd4062513;
	Wed, 12 Mar 2025 09:36:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNCA-0004CT-3u; Wed, 12 Mar 2025 09:36:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 1/2] arago-prefs: Remove PREFERRED_PROVIDER for wpa-supplicant
Date: Wed, 12 Mar 2025 09:36:29 -0500
Message-ID: <20250312143630.16096-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:36:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15990

A while back, the PREFERRED_PROVIDER settings for wpa-supplicant were
disabled due to a deprecation issue with OpenSSL 1.0 [1].  A short while
after that patch, a fix was provided for wpa-supplicant-wl18xx that
moved it to OpenSSL 1.1, but the PREFERRED_PROVIDER was never turned back on.

We have been happily using the mainline wpa-supplicant since that time,
so there seems to be no need to even maintain these overrides.  Remove
them.

[1] https://git.ti.com/cgit/arago-project/meta-arago/commit/meta-arago-distro/conf/distro/include/arago-prefs.inc?h=master-wip&id=413c96547f535529ce0705db0831b539b866efed

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index dbbcc42f..69bae7d7 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -10,11 +10,6 @@ PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
 PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
 
-PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
-#PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
-#PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
-#PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
-
 # Select meta-clang providers
 PREFERRED_PROVIDER_llvm = "clang"
 PREFERRED_PROVIDER_llvm-native = "clang-native"
-- 
2.17.1


