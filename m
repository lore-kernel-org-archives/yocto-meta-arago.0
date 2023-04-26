Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E1C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5239.1682544740262150572
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vqZh1lJz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGiU067683;
	Wed, 26 Apr 2023 16:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682544736;
	bh=tRktft2qxYeEOy+80IjzD+3USuY8cjR85Hew9n2GeSQ=;
	h=From:To:CC:Subject:Date;
	b=vqZh1lJzpwXpKcMV7rGoEuZHYmpemLC7iTpJMN2nbk507KCjnvuX1mlr1pay262ml
	 XxGGEoeM+JovidkUqa6LW/oMV+4A+szCKI3qaJZnAPCjizp5TegCMWs6IItmDRqe2b
	 dHuyJVkyh2EqhuD4++UQZBy5J8oGQD43x94NoMAA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLWGfE088753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:32:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:32:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:32:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGvg067242;
	Wed, 26 Apr 2023 16:32:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 0/6] Vulkan prep and some cleanup
Date: Wed, 26 Apr 2023 16:32:07 -0500
Message-ID: <20230426213214.3501230-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14352

From: Randolph Sapp <rs@ti.com>

Enable limited x11 support to help with the Vulkan WSI layers. Adjust
PACKAGECONFIG strings for a few packages so they still prefer the Wayland
backend properly and still use GLES instead of GL.

Also attempt a little bit of patch cleanup. Expect a few more cleanup
patches with the non-root Weston patchset when that comes out.

Randolph Sapp (6):
  arago.conf: drop the explicit removal of x11, add vulkan
  qtwayland: override the packageconfig to prefer wayland
  qtwayland: drop the fix-wayland-texture-sharing patch
  qtwayland: drop the plugins-decorations patch
  qtwayland: add comment about why this append exists
  glfw: convert to append and drop patches

 meta-arago-distro/conf/distro/arago.conf      |  4 +-
 ...land-texture-sharing-custom-composit.patch | 52 -------------------
 ...ons-bradient-display-window-icon-onl.patch | 42 ---------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  9 ++--
 ...xt-remove-check-for-Wayland-Egl-prov.patch | 27 ----------
 .../recipes-graphics/glfw/glfw_%.bbappend     |  6 +++
 .../recipes-graphics/glfw/glfw_git.bb         | 24 ---------
 7 files changed, 10 insertions(+), 154 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_git.bb

-- 
2.40.0


