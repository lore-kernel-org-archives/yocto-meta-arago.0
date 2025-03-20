Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6507DC36008
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1858.1742494250806502597
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t6Q8Qhxu;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnWt684449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494249;
	bh=XTN9b+yQVyYZJcUOhhis5mCRCI0ydqMfxGGzttSPd/A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=t6Q8QhxuxPH3DFgIbHJznbds6JxCm69biKsXTv4e7Crn3FOR3DX+plEA7A75Jt+ax
	 Jw6r/t34hdg4AHCbH5OEWicbbv8pn5hHjkDGodm7ycleaMTaL2bsWcglHtJgDyeD+a
	 ZH9NCDdnUy13Zqu5KdpEVWatSXAZijen5rZQ0d5I=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnqi020270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAnnI126241;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-0001BP-95; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 18/26] weston-init: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:39 -0500
Message-ID: <20250320181047.18035-19-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16119

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...eston-init.bbappend => weston-init-arago.inc} |  2 +-
 .../wayland/weston-init.bbappend                 | 16 +++-------------
 2 files changed, 4 insertions(+), 14 deletions(-)
 copy meta-arago-distro/recipes-graphics/wayland/{weston-init.bbappend => weston-init-arago.inc} (84%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
similarity index 84%
copy from meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
copy to meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
index 4d5db58c..fc964df5 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/weston-init:"
 
 PR:append = ".arago12"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 4d5db58c..b005c3c1 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,14 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+WESTON_INIT_ARAGO = ""
+WESTON_INIT_ARAGO:arago = "weston-init-arago.inc"
 
-PR:append = ".arago12"
-
-SRC_URI:append = " \
-    file://weston.ini \
-    file://weston-launch-calibrator.sh \
-"
-
-do_install:append() {
-    install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
-}
-
-FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
+require ${WESTON_INIT_ARAGO}
-- 
2.17.1


