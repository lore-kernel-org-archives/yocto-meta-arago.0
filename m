Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF86C36006
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1861.1742494251126951019
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bqh2mA9P;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoHY684457
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=b1GWf6RhULbJ0avIisDzbApmuquEElMJt8SS/mV+0MY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Bqh2mA9PVMfItR15F5gwfG+EfD0ttGnrK5k3Zfj8Qu7G7At+43lJXhDjvTrnfit6M
	 1zNjsbdHla2TPOUP9RFtSQUp1te0oerGPdUgizNHNghqzTTysSTnvXQ9+XPUb4ocvZ
	 GfIC223aA7U3gaQIXMkVvFP5AwyM/tCz9hUPedfg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoe0020276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAnu8085717;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-0001LW-Ky; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 21/26] tiff: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:42 -0500
Message-ID: <20250320181047.18035-22-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16123

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../libtiff/{tiff_%.bbappend => tiff-arago.inc}             | 0
 .../recipes-multimedia/libtiff/tiff_%.bbappend              | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 copy meta-arago-distro/recipes-multimedia/libtiff/{tiff_%.bbappend => tiff-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend b/meta-arago-distro/recipes-multimedia/libtiff/tiff-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
copy to meta-arago-distro/recipes-multimedia/libtiff/tiff-arago.inc
diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
index 1bdc0802..872d6b94 100644
--- a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
@@ -1,4 +1,4 @@
-PR:append = ".arago0"
+TIFF_ARAGO = ""
+TIFF_ARAGO:arago = "tiff-arago.inc"
 
-# Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
-PACKAGECONFIG:remove = "lzma"
+require ${TIFF_ARAGO}
-- 
2.17.1


