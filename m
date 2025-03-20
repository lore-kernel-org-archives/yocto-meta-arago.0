Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109D3C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1887.1742494251546912261
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W0XMB96f;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAotT684465
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=7w8fc64MLXWvep1j7g2zy49YOHCYdKGB/7DWQjqAy9c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=W0XMB96fGXiPOaeYituhSeW71pAaav3+FxKX0Wf7ZPv0a8D/aSsPfFxGvxdhOz+U9
	 kDEmFCy0FKTj4YgTDib+PRmiaElzTaMNb25ltdLpoI+j9c2kxG3pkQW3cYNM5z0E9x
	 rjenyb1GUar9xcqjJ4JItFRVNNevKjkneyOdE/Xs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoL7024538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAop6085736;
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLy-0001Pt-3w; Thu, 20 Mar 2025 13:10:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 25/26] strongswan: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:46 -0500
Message-ID: <20250320181047.18035-26-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16127

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ngswan_%.bbappend => strongswan-arago.inc} |  0
 .../strongswan/strongswan_%.bbappend          | 20 +++----------------
 2 files changed, 3 insertions(+), 17 deletions(-)
 copy meta-arago-distro/recipes-support/strongswan/{strongswan_%.bbappend => strongswan-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
copy to meta-arago-distro/recipes-support/strongswan/strongswan-arago.inc
diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index efedd7fb..31462f78 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -1,18 +1,4 @@
-PR:append = ".arago4"
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+STRONGSWAN_ARAGO = ""
+STRONGSWAN_ARAGO:arago = "strongswan-arago.inc"
 
-PACKAGECONFIG = "charon curl openssl stroke sqlite3 \
-        ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
-"
-
-EXTRA_OECONF += " \
-        --enable-ctr \
-        --enable-pkcs11 \
-        --enable-mgf1 \
-"
-
-SRC_URI += "file://pkcs11_plugin.conf"
-
-do_install:append () {
-	install -m 0644 ${UNPACKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
-}
+require ${STRONGSWAN_ARAGO}
-- 
2.17.1


