Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C45C77B7C
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:30:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4601.1682631012399443684
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nv90lwh3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU9Up035977;
	Thu, 27 Apr 2023 16:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682631009;
	bh=Xe83RbBALjNpzYEVfzbh+z5rGUrI/1YSt3GuSe2IBf0=;
	h=From:To:CC:Subject:Date;
	b=nv90lwh32xAOvzV6UaakOFsldHoDR3tOzTZiouFKLPIWn+/CqtsRKPeJrwB420tjF
	 l5Pd1wem+bofM9F/1bZ1hZAq9Ro8bIqHbo/NtWIGXPH0Y3e9wRFwp2xNRM2mMgzPH4
	 04dCN43tiJgabkAgWLQ7z2r+COzGk70T+YSjencM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RLU9YR069926
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:30:09 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:30:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:30:08 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU803128870;
	Thu, 27 Apr 2023 16:30:08 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCHv3 0/5] Vulkan prep and some cleanup
Date: Thu, 27 Apr 2023 16:29:55 -0500
Message-ID: <20230427213000.1923507-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14374

From: Randolph Sapp <rs@ti.com>

Enable limited x11 support to help with the Vulkan WSI layers. Adjust
PACKAGECONFIG strings for a few packages so they still prefer the Wayland
backend properly and still use GLES instead of GL.

Also attempt a little bit of patch cleanup. Expect a few more cleanup
patches with the non-root Weston patchset when that comes out.

This version has some light edits to address Andrews concerns. As far as
SGX compatibility goes, that will continue to be a thorn. I'm not sure
how we can address those properly moving forward, but we can tackle that
after Vulkan entablement. Machine specific overrides will be required,
but arguably those should live in meta-ti as they will be required for
any distro layer attempting to enable these features.

Also drops useless append in favor of using distro config.

Randolph Sapp (5):
  arago.conf: drop the explicit removal of x11, add vulkan
  qtwayland: override the packageconfig to prefer wayland
  qtwayland: drop the fix-wayland-texture-sharing patch
  qtwayland: drop the plugins-decorations patch
  glfw: convert to append and drop patches

 meta-arago-distro/conf/distro/arago.conf      |  5 +-
 ...land-texture-sharing-custom-composit.patch | 52 -------------------
 ...ons-bradient-display-window-icon-onl.patch | 42 ---------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  7 ---
 ...xt-remove-check-for-Wayland-Egl-prov.patch | 27 ----------
 .../recipes-graphics/glfw/glfw_%.bbappend     |  8 +++
 .../recipes-graphics/glfw/glfw_git.bb         | 24 ---------
 7 files changed, 10 insertions(+), 155 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_git.bb

-- 
2.40.0


