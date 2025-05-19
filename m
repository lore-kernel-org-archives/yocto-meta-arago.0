Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C858DC54E71
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.371.1747674058801058149
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YRXMgrZk;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0vTp176993
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674057;
	bh=rIhZ9plgH4fKYQx2p23r4Ja+yD2YljsKR+u2paLZPIM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YRXMgrZkIFPT4ygyUsCBrwQJU07u2q3LArC6SUkoQvasEjI/bzTL7fh8xEAbcIU7G
	 K5HmhcfvgJMJ3SYDUE65PeAbx9m5o6M8ijfMUoQ8u4w3J6MAJJCLdYUCGAqAEfUz5y
	 TLCdSWptDwnOjOONyw0VZj3w4NSivkan8ooH522o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH0vI5015414
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:00:57 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0uEt110975;
	Mon, 19 May 2025 12:00:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rE-0005pt-II; Mon, 19 May 2025 12:00:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/9] chromium-ozone-wayland: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:00:50 -0500
Message-ID: <20250519170055.22364-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170055.22364-1-reatmon@ti.com>
References: <20250519170055.22364-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16215

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...6723.91.bbappend => chromium-ozone-wayland-arago.inc} | 2 +-
 .../chromium-ozone-wayland_130.0.6723.91.bbappend        | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)
 copy meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_130.0.6723.91.bbappend => chromium-ozone-wayland-arago.inc} (66%)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
similarity index 66%
copy from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
copy to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index 66cdd00a..3573c112 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,6 +1,6 @@
 PR:append = ".arago0"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland-130.0.6723.91:"
 
 SRC_URI:append = " \
                   file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
index 66cdd00a..62ae18bf 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
@@ -1,7 +1,4 @@
-PR:append = ".arago0"
+CHROMIUM_ARAGO = ""
+CHROMIUM_ARAGO:arago = "chromium-ozone-wayland-arago.inc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
-
-SRC_URI:append = " \
-                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
-                  "
+require ${CHROMIUM_ARAGO}
-- 
2.17.1


