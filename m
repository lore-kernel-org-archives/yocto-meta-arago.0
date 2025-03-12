Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC88C35FF4
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.39070.1741790742150747774
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IhzrqnZN;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfH41094863
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=MXAjwroYZuCKkyBxEDncgi4TW5ZXq4CXdg+By2uKuis=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=IhzrqnZN5O5B7tYymIMXDDsq2YEOGOcRYz6jHkrbTmCyCnAfbFe6wuxlAqWZgB3eo
	 K0TS6xwWFGGNCtEZK3xYirlYlBo+xjKesXFT75CK98EhAjXFlV/dHOaFLGHRbCqIP4
	 Ju6/WTob8jnIEMAGJtg0wLWRIu1ulv9sv+Oanc2A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfSH013974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEje4F074641;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003rg-RA; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 07/10] wayland-protocols: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:37 -0500
Message-ID: <20250312144540.14210-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15994

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ols_%.bbappend => wayland-protocols-arago.inc} |  2 +-
 .../wayland/wayland-protocols_%.bbappend          | 15 +++------------
 2 files changed, 4 insertions(+), 13 deletions(-)
 copy meta-arago-extras/recipes-graphics/wayland/{wayland-protocols_%.bbappend => wayland-protocols-arago.inc} (85%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols-arago.inc
similarity index 85%
copy from meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
copy to meta-arago-extras/recipes-graphics/wayland/wayland-protocols-arago.inc
index 332e9c97..b97b5edb 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/wayland-protocols:"
 
 PR:append = ".arago2"
 
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
index 332e9c97..26dc8fd0 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
@@ -1,13 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+WAYLAND_PROTOCOLS_ARAGO = ""
+WAYLAND_PROTOCOLS_ARAGO:arago = "wayland-protocols-arago.inc"
 
-PR:append = ".arago2"
-
-SRC_URI += " \
-    file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
-    file://0002-wayland-drm-Update-to-version-2.patch \
-"
-
-do_install:append() {
-	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
-	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-protocols/stable/wayland-drm/
-}
+require ${WAYLAND_PROTOCOLS_ARAGO}
-- 
2.17.1


