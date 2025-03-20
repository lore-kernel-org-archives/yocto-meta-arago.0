Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D843AC36018
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1851.1742494249558703333
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iWRhFskx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAlV1703242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=44p3dHVci8yveRce6jPFkfDGtqtlp+Wm5p8EZvgmjSg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iWRhFskxb7z+FWjkOfUItFwyT9tzHvzofYVFrFobOt8Y5Zi5pWDnbncqhK91nEFuE
	 8fPfrbUx+TWU3dmxuGIqe2cCpmPu9mwlUNxMDef9t8Xh0/Nelruqd0x8zDXpKtdOoy
	 Bxt8oSeQtqa4IdVvJ2gaVjC0D0h4O9PSw+HwONb8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAlVu049390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAl3u085666;
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLv-0007O0-G3; Thu, 20 Mar 2025 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 02/26] iproute2: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:23 -0500
Message-ID: <20250320181047.18035-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16107

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../iproute2/{iproute2_%.bbappend => iproute2-arago.inc} | 2 +-
 .../recipes-connectivity/iproute2/iproute2_%.bbappend    | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)
 copy meta-arago-distro/recipes-connectivity/iproute2/{iproute2_%.bbappend => iproute2-arago.inc} (71%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2-arago.inc
similarity index 71%
copy from meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
copy to meta-arago-distro/recipes-connectivity/iproute2/iproute2-arago.inc
index 500071e4..2f88ea36 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2-arago.inc
@@ -1,6 +1,6 @@
 PR:append = ".arago6"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/iproute2:"
 
 SRC_URI:append = " \
     file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch \
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
index 500071e4..89cd1fac 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
@@ -1,7 +1,4 @@
-PR:append = ".arago6"
+IPROUTE2_ARAGO = ""
+IPROUTE2_ARAGO:arago = "iproute2-arago.inc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI:append = " \
-    file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch \
-"
+require ${IPROUTE2_ARAGO}
-- 
2.17.1


