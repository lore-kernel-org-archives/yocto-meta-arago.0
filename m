Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 160C8529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:06:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M46oXh025496
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691610;
	bh=V0tJ2S3QchNR7B4/A/wewtlHzMyEfvbr7QUXNBltZfM=;
	h=From:To:CC:Subject:Date;
	b=KHX1GgoxkDXvzd3tOjmjFG47mtC1l1/93eOZ936ZpthjwxAB79y/mIQDCQPqnZJNH
	NZmhgVqiitUeCYHlVbeI33toDFlAz9FJqk8I4MJA2hqWjsKnL03Q/SWnzBVep/F5Ff
	D2JQI5ErXJMnwh2VongR8+t2l5OwR4KfdHu1AVmo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46oAx014147
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:06:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:06:50 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAK028035;
	Wed, 21 Mar 2018 23:06:49 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:36 +0530
Message-ID: <1521691605-49259-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/9] Gstreamer1.12.2 enablement for rocko
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 04:06:53 -0000
Content-Type: text/plain

This patchset enables the following features.
1) Gstreamer good plugin fix for v4l2src
2) kmssink and waylandsink support along with bugfixes.
3) Optimization in gstvpe to fix frame-copy issue

Ramprasad N (9):
  gstreamer1.0*-bad: Clean up gstreamer 1.8 bad patches
  gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
  gstreamer1.0*-bad: Add drmallocator support
  gstreamer1.0*-bad: Add parser specific fixes
  gstreamer1.0*-bad: Enable kmssink with gst 1.12
  wayland-protocols: Add drm protocol to stable
  gstreamer1.0*-bad: Add DRM support to waylandsink
  gstvpe: Fix frame-copy issue with playbin
  branding-{core, processor-sdk}: re-enable mmip

 .../conf/distro/include/branding-core.inc          |    4 -
 .../conf/distro/include/branding-processor-sdk.inc |    4 -
 ...nd-drm-Add-wayland-drm-protocol-to-stable.patch |  179 ++
 .../wayland/wayland-protocols_1.10.bbappend        |   15 +
 ...late-the-output-structure-with-progressiv.patch |   33 +
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |    3 +-
 ...-mouse-movement-for-videos-on-waylandsink.patch |  404 -----
 ...gstdrmallocator-Add-DRM-allocator-support.patch |   42 +-
 ...ylandsink-Add-mouse-drag-and-drop-support.patch |  408 -----
 ...waylandsink-add-input-format-I420-support.patch |   89 -
 .../0002-kmssink-remove-DCE-dependencies.patch     |   96 --
 ...tch => 0002-parsers-bug-fixes-on-parsers.patch} |   37 +-
 ...gstkmssink-Add-support-for-KMS-based-sink.patch | 1592 ------------------
 ...Add-omapdrm-in-the-list-of-driver-modules.patch |  165 ++
 .../0003-kmssink-add-YUYV-support.patch            |   81 -
 ...aylandsink-Add-DRM-support-on-waylandsink.patch | 1728 --------------------
 ...aylandsink-Add-drm-support-in-waylandsink.patch |  706 ++++++++
 ...ink-Implement-callbacks-for-version-5-of-.patch |   65 -
 ...aylandsink-Fix-scale-up-with-padded-video.patch |   39 -
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   42 +
 ...d => gstreamer1.0-plugins-good_1.12.2.bbappend} |    0
 21 files changed, 1181 insertions(+), 4551 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-remove-DCE-dependencies.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{0002-parsers-Pick-previos-bug-fixes-on-different-parsers.patch => 0002-parsers-bug-fixes-on-parsers.patch} (85%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-gstkmssink-Add-support-for-KMS-based-sink.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.3.bbappend => gstreamer1.0-plugins-good_1.12.2.bbappend} (100%)

-- 
1.9.1


