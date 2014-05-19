Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1F5EA529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKCpp012403
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKCNG020503
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:11 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8Bt001355;	Mon, 19 May 2014 14:20:10 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:48 -0500
Message-ID: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/19] Add GLSDK accelerated MM and GFX support
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
X-List-Received-Date: Mon, 19 May 2014 19:20:13 -0000
Content-Type: text/plain

The following patch set will add the MM and GFX support from the GLSDK
to meta-arago.  It depends on the corresponding patch set sent to
meta-ti which provides many of the drivers and dependencies used by
these recipes.

These patches were ported from meta-arago-glsdk and authorship was
preserved where possible.

Chase Maupin (8):
  ipc-test-fw: Update to not conflict with ipumm-fw
  packagegroup-arago-base-tiskd: Add base nfs-utils
  packagegroup-arago-gst: Add accelerated MM packages
  packagegroup-arago-tisdk-graphics: Add SGX and BLTsville packages
  packagegroup-arago-tisdk-addons: Add libdrm components
  packagegroup-arago-tisdk-multimedia: Add accelerator firmwares
  packagegroup-arago-test: Add drm and bltsville tests
  arago-prefs: Use omap5-sgx package for libgles dependencies

Mrinmayee Hingolikar (11):
  libdce: Add libdce version 2.0 support from glsdk
  gstreamer: Add append to use TI version
  gst-plugins-bad: Append with TI version of plugins
  gst-plugins-good: Add TI version of gst-plugins-good
  gst-plugins-base: Add TI version with bbappend
  gst-plugins-ducati: Add GStreamer elements that use ducati
  gst-plugins-vpe: Add TI VPE GStreamer plugins
  bvtest: Add bltsville test application
  omapdrmtest: Test application for OMAP DRM interface
  libgbm: Add TI specific version of libgbm
  kmscube: Add kmscube demo application

 .../conf/distro/include/arago-prefs.inc            |    4 +++
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          |   14 ++++++---
 .../packagegroups/packagegroup-arago-base-tisdk.bb |    3 +-
 .../packagegroups/packagegroup-arago-gst.bb        |    7 ++++-
 .../packagegroups/packagegroup-arago-test.bb       |    4 ++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    4 +--
 .../packagegroup-arago-tisdk-addons.bb             |    1 +
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb |   11 ++++++-
 .../packagegroup-arago-tisdk-graphics.bb           |   14 +++++++++
 .../packagegroup-arago-tisdk-multimedia.bb         |   17 ++++++++++-
 .../recipes-graphics/bvtest/bvtest_git.bb          |   30 ++++++++++++++++++++
 .../recipes-graphics/gbm/libgbm_9.0.0.bb           |   15 ++++++++++
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   19 +++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |   16 +++++++++++
 .../gst-plugins-ti/gst-plugins-ducati_git.bb       |   10 +++++++
 .../gst-plugins-ti/gst-plugins-ti.inc              |   19 +++++++++++++
 .../gst-plugins-ti/gst-plugins-vpe_git.bb          |   11 +++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   22 ++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   20 +++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   23 +++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bbappend           |   14 +++++++++
 .../recipes-multimedia/libdce/libdce_git.bb        |   16 +++++++++++
 22 files changed, 283 insertions(+), 11 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/bvtest/bvtest_git.bb
 create mode 100644 meta-arago-extras/recipes-graphics/gbm/libgbm_9.0.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/libdce/libdce_git.bb

-- 
1.7.9.5


