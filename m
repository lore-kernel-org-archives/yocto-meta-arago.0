Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F8C0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 21:20:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5923.1737148794389701924
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 13:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G9jlWf9e;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJrOa261022
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737148793;
	bh=s7L/30V6ENuje9qJAbcCXgGvSCsFgO6rcGrGwJ875+A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G9jlWf9eeMf8ZOtSGTECON8fJoyv2wQhPS0sTt+gKSYrtniVVTE75nD2Cp7ocqyZB
	 xmZLtl0/N/8p78gasnTmQS0JRVHXytTjN+/32oLguDMQfLU1Fm8X1Sgy4NR7aRIcBP
	 ClVPMlJTUvXXwXYQ7O7eLwsODGSWFg88HDdDxFwk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJrMw112895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 15:19:53 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:19:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:19:52 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJp5g030757;
	Fri, 17 Jan 2025 15:19:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 3/5] arago-prefs.inc: Remove PREFERRED_PROVIDER for jpeg
Date: Fri, 17 Jan 2025 15:19:49 -0600
Message-ID: <20250117211951.698377-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117211951.698377-1-afd@ti.com>
References: <20250117211951.698377-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 21:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15707

There is now only one provider for libjpeg, the other provider was dropped
from oe-core ~10 years ago. Remove this very outdated PREFERRED_PROVIDER.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc           | 2 --
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a518a857..f8e39830 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -8,8 +8,6 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
 
-PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
-
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_crda = "3.18"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 9c5a2644..78ffe567 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} = "\
     curl-dev \
     i2c-tools-dev \
     freetype-dev \
-    ${@oe.utils.conditional('PREFERRED_PROVIDER_jpeg', 'libjpeg-turbo', 'libjpeg-turbo-dev', 'jpeg-dev', d)}  \
+    libjpeg-turbo-dev  \
     lzo-dev \
     opkg-dev \
     libpng-dev \
-- 
2.39.2


