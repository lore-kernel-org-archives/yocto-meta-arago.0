Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AF3C0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:34 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21962.1737481953800389375
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X0Bngf1a;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXrd865610
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:52:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481953;
	bh=FXH+RbSYyvurlLjfy81NVPgEBOvI5VxxQ0BUjyqm5lY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X0Bngf1agBTNIxKxDvFbmeV3OUL65w0lOekIoEmu1dEMjIJjmi715tEL9VsKeAERp
	 dpq5oqhR4gR0Q+qq76AplcHXhcMlb9ofMUFQmvP+qY6WOne1i8peQjz6riOjQZJ7HP
	 wwG4UtjPEyKZ8bPFbenSpPHjRxWYsJ+O2E2rEd4I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqWXe129568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 11:52:32 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:32 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV9A097709;
	Tue, 21 Jan 2025 11:52:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 3/7] arago-prefs.inc: Remove PREFERRED_PROVIDER for jpeg
Date: Tue, 21 Jan 2025 11:52:27 -0600
Message-ID: <20250121175231.27183-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121175231.27183-1-afd@ti.com>
References: <20250121175231.27183-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15722

There is now only one provider for libjpeg, the other provider was dropped
from oe-core ~10 years ago. Remove this very outdated PREFERRED_PROVIDER.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - No changes

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


