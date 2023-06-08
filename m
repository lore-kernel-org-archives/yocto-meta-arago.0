Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17580C7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:12:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1434.1686247918133334425
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gOWx2XCN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: b-brnich@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358IBrHw004743;
	Thu, 8 Jun 2023 13:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686247913;
	bh=/V+c8vNvvKgzMmp++O3GT17jGOPe+LUep4AHPJmhbN0=;
	h=From:To:CC:Subject:Date;
	b=gOWx2XCNqphpAE9ez0N82Vv1qY67UgSdrKYhN8Pl58QHOYDWpoTtNYcU0JmK1cqFx
	 AH/a1sQlF7tGF1Rt3nCElFJ8pTG2KhFyzzbnvveB+1N4ZekVoetywLQzfOdNIeNvxR
	 QUrpMOoNpWSYsX2yumsW0UN4qtVp//BOyedOe/XI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358IBr57022149
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:11:53 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:11:53 -0500
Received: from udba0500997.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358IBrk1010364;
	Thu, 8 Jun 2023 13:11:53 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Darren Etheridge <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 0/2] gstreamer updates
Date: Thu, 8 Jun 2023 13:11:51 -0500
Message-ID: <20230608181153.1560497-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:12:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14542

Hello all,

This series addresses concerns in previous[0] thread.

Removing all of the old gstreamer patches as we are dropping support. As a
result, kmssink flag needs to be set in arago.conf

[0] https://lists.yoctoproject.org/g/meta-arago/topic/99070450#14497

Brandon Brnich (2):
  conf: arago: Add support for kmssink
  receipes-multimedia: gstreamer: Remove old gstreamer files

 meta-arago-distro/conf/distro/arago.conf      |    3 +
 ...emove-wayland-as-required-dependency.patch |   32 -
 ...mallocator-Add-DRM-allocator-support.patch |  469 --------
 ...s-add-support-for-meson-build-system.patch |  140 ---
 ...sink-Add-mouse-drag-and-drop-support.patch |  426 -------
 .../0002-parsers-bug-fixes-on-parsers.patch   |  145 ---
 ...drm-and-tidss-in-the-list-of-drivers.patch |  160 ---
 ...dsink-Add-drm-support-in-waylandsink.patch |  703 ------------
 ...waylandsink-Add-input-device-support.patch | 1022 -----------------
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |   37 -
 ...e-formats-table-to-include-YUV422-mu.patch |   61 -
 ...for-drm-memory-support-in-try_import.patch |   33 -
 ...rc-Increase-minimum-num-buffers-by-3.patch |   29 -
 ...Use-generic-dmabuf-import-in-v4l2src.patch |   43 -
 .../gstreamer1.0-plugins-good_1.18.%.bbappend |   12 -
 15 files changed, 3 insertions(+), 3312 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-add-support-for-meson-build-system.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend

-- 
2.34.1


