Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAFBC3601A
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1877.1742494249560597220
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qnLqVlFr;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmii684432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=M7qgIGuNZOuWjrALnK6agZJVxvo77QUqp5DrPwKSQoo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qnLqVlFrBnmz3LO4cNIpekGEpbZpGASD5NoKVyRVMzbWSYiR+imBWZ94gkgsIiI1C
	 a+0vYvn8BNYRmjUfE2LJ2LUCuNy71k6EzTKTcmAV3JNSYjJ1pJi4UTp9Q/DHrnV/D9
	 cYnadPafvop1VsMBeTqj+eiGM6aePmiPVVOKLDS0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAm9x038128;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmCT085686;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-0000Ki-E4; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 10/26] eudev: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:31 -0500
Message-ID: <20250320181047.18035-11-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16108

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{eudev_%.bbappend => eudev-arago.inc}     |  2 +-
 .../recipes-core/udev/eudev_%.bbappend        | 24 +++----------------
 2 files changed, 4 insertions(+), 22 deletions(-)
 copy meta-arago-distro/recipes-core/udev/{eudev_%.bbappend => eudev-arago.inc} (93%)

diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev-arago.inc
similarity index 93%
copy from meta-arago-distro/recipes-core/udev/eudev_%.bbappend
copy to meta-arago-distro/recipes-core/udev/eudev-arago.inc
index c5758a21..791a7926 100644
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev-arago.inc
@@ -3,7 +3,7 @@
 # meta-arago switches to Dora
 
 # look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/eudev:"
 
 PR:append = ".arago5"
 
diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
index c5758a21..51afb053 100644
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
@@ -1,22 +1,4 @@
-# This fixes an issue with touchscreens not being detected with the default
-# local.rules.  This can be removed when this change is picked up and
-# meta-arago switches to Dora
+EUDEV_ARAGO = ""
+EUDEV_ARAGO:arago = "eudev-arago.inc"
 
-# look for files in this layer first
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PR:append = ".arago5"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI:append = " \
-                  file://usb1-rules.sh \
-                  file://usb2-rules.sh"
-
-do_install:append() {
-    install -d ${D}/${bindir}
-
-    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
-    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
-    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
-}
+require ${EUDEV_ARAGO}
-- 
2.17.1


