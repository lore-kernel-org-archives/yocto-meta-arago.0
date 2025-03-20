Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD11FC36013
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1860.1742494251048928698
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ttc5P5Vv;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnsW703264
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494249;
	bh=/rzsTm0Xd3EpKaDAuECOvBukZdliDjTj5RB1x8BUcMo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ttc5P5VvceedLjfHb0ZJQW0qULoha7T9/ma5HrtFpfOfw2r+VEpd3y2lD/v7Zq3cp
	 nVNcJwioF+E1Bf/SfSii0NpaTUHp8Fi0xuUXve7AFpo+d0h+TESuaYwh/+CzvHO3Av
	 XDTT1yFsTOIZFRK2FpNWEEKB04YVjK91Anxgmf5M=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAnR8049401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAnjZ085707;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-00017S-5A; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 17/26] weston: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:38 -0500
Message-ID: <20250320181047.18035-18-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16122

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../wayland/{weston_14.0.%.bbappend => weston-arago.inc} | 2 +-
 .../recipes-graphics/wayland/weston_14.0.%.bbappend      | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)
 copy meta-arago-distro/recipes-graphics/wayland/{weston_14.0.%.bbappend => weston-arago.inc} (70%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
similarity index 70%
copy from meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
copy to meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
index ba3be91c..16518353 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
 
 PR:append = ".arago1"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
index ba3be91c..c98a62de 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
@@ -1,7 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+WESTON_ARAGO = ""
+WESTON_ARAGO:arago = "weston-arago.inc"
 
-PR:append = ".arago1"
-
-SRC_URI += " \
-        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
-"
+require ${WESTON_ARAGO}
-- 
2.17.1


