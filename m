Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4AEC36007
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1888.1742494251680927876
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cO8TmFp4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoqr703268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=WKPIs9eVjTwcQ/1GMCa5f5GjKbEGrTWe3r2MDBR/TPA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cO8TmFp4Ywpt0rftlacXFznNCIKw8in8TCldtjBWvaFfymXbv99aafLOYEZlrvSyy
	 OxKHHnPusKvBDH+PVWOJBxovT0uE4uYmgfM+0RIyR47l2wxjFZJd6HDYEhZIhQZolJ
	 GpgCQghpjAOqA/JQB+vBz/GKKbZK2tcNVd+4Qxz4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoYi024530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAouG085724;
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-0001Pd-Sa; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 23/26] libnl: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:44 -0500
Message-ID: <20250320181047.18035-24-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16128

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../libnl/{libnl_%.bbappend => libnl-arago.inc}       |  0
 .../recipes-support/libnl/libnl_%.bbappend            | 11 +++--------
 2 files changed, 3 insertions(+), 8 deletions(-)
 copy meta-arago-distro/recipes-support/libnl/{libnl_%.bbappend => libnl-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend b/meta-arago-distro/recipes-support/libnl/libnl-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
copy to meta-arago-distro/recipes-support/libnl/libnl-arago.inc
diff --git a/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
index 26c9b6de..52df5313 100644
--- a/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
+++ b/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
@@ -1,9 +1,4 @@
-PR:append = ".arago0"
+LIBNL_ARAGO = ""
+LIBNL_ARAGO:arago = "libnl-arago.inc"
 
-do_install:append() {
-#   Install private files to allow libnl extensions
-    install -d ${D}${includedir}/nl-priv-dynamic-core
-    cp -r ${S}/include/nl-priv-dynamic-core/cache-api.h ${D}${includedir}/nl-priv-dynamic-core/
-    cp -r ${S}/include/nl-priv-dynamic-core/object-api.h ${D}${includedir}/nl-priv-dynamic-core/
-    cp -r ${S}/include/nl-priv-dynamic-core/nl-core.h ${D}${includedir}/nl-priv-dynamic-core/
-}
+require ${LIBNL_ARAGO}
-- 
2.17.1


