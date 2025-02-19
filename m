Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925EFC021B1
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:42:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.25470.1739979720677503160
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 07:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X0gUop6V;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFfuU5328316
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 09:41:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739979716;
	bh=wFo9ABO6bGEzXeioxYs+c1DGGQHlwAhPbgmuR0nl+AU=;
	h=From:To:CC:Subject:Date;
	b=X0gUop6VE/1ytgJxMkramxHAuFd0C99CkX+xZEy8kPvpeeQePxP3D11HCmQ6fvNyu
	 DmWuyFib3WDNAaEU02k2MxuWV96UpiyGaHegU4nhg/QF8tQVgyTzuhHDt3HWu899G3
	 mEtO2EyM+Gmur6OCrD7WhlEtCi32HOn82tE2xtjM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFfuJI066019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 09:41:56 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 09:41:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 09:41:56 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JFfuZ5105866;
	Wed, 19 Feb 2025 09:41:56 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 0/3] Backport the qt5/qt6 specific patches
Date: Wed, 19 Feb 2025 09:41:45 -0600
Message-ID: <20250219154148.2733385-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 15:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15858

From: Randolph Sapp <rs@ti.com>

Now that the other components have been merged we can remove meta-arago-demos
and all the qt5 specific patches and roll forward with the same dynmaic layer
mechanism we are using in master.

Slightly modified backport to handle patch content changes and an issue with the
meta-toolchain-arago recipe path.

Randolph Sapp (3):
  meta-arago-demos: remove this layer due to qt5 dep
  meta-arago-*: remove all qt5 configs
  meta-arago-test: dynamic layer for qt6 support

 meta-arago-demos/COPYING.MIT                  |  17 --
 meta-arago-demos/README                       |  38 ---
 meta-arago-demos/SECURITY                     |  20 --
 meta-arago-demos/conf/layer.conf              |  26 --
 .../acontis-atemsys_3.0.1.28.bb               |  18 --
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     |  25 --
 .../mmwavegesture-hmi_git.bb                  |  25 --
 .../pdm-anomaly-detection_git.bb              |  29 --
 .../point-cloud-viewer_git.bb                 |  35 ---
 .../protection-relays-hmi_git.bb              |  25 --
 .../examples/qtwebbrowser_5.15.1.bb           |  49 ----
 meta-arago-distro/README                      |   4 -
 meta-arago-distro/conf/distro/arago.conf      |  24 --
 meta-arago-distro/conf/layer.conf             |   2 -
 .../images/tisdk-default-image.bb             |   1 -
 .../meta/meta-toolchain-arago-tisdk.bb        |   3 +-
 .../packagegroups/packagegroup-arago-qte.bb   |  26 --
 .../packagegroup-arago-tisdk-qte.bb           |  21 --
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
 .../recipes-core/packagegroups/ti-world.bb    |   1 -
 .../qt5/qtbase-conf/eglfs_kms_cfg.json        |   5 -
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  16 --
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  14 -
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  20 --
 ...xit-button-for-non-window-environmen.patch |  60 ----
 ...01-deform-Fix-how-controls-are-shown.patch |  33 ---
 ...fs-Force-888-format-only-on-env-flag.patch |  44 ---
 ...latforms-eglfs_kms-fix-compiler-erro.patch |  29 --
 ...d-exit-button-for-non-window-environ.patch |  81 ------
 .../0002-deform-disable-opengl-button.patch   |  71 -----
 .../recipes-qt/qt5/qtbase/quit.png            | Bin 645 -> 0 bytes
 .../recipes-qt/qt5/qtbase_%.bbappend          |  46 ---
 ...touchinteraction.qml-Add-exit-button.patch |  60 ----
 .../recipes-qt/qt5/qtdeclarative_git.bbappend |  10 -
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch |  30 --
 ...e-to-use-GL_NoX-version-of-GraphicsS.patch |  29 --
 .../qtwebkit/GraphicsContext3DQt.cpp.patch    |  26 --
 .../qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch  | 270 ------------------
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch |  33 ---
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch |  17 --
 .../qt5/qtwebkit/qttestbrowser.cpp.patch      |  24 --
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  18 --
 meta-arago-extras/README                      |   4 -
 ...k-packagegroup-arago-qte-toolchain-host.bb |  12 -
 ...packagegroup-arago-qte-toolchain-target.bb |  35 ---
 .../cmake/extra-cmake-modules.bb              |   1 -
 ..._QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch |  26 --
 meta-arago-test/conf/layer.conf               |   4 +
 .../packagegroups/ti-test.bbappend            |   7 +
 .../recipes-qt/qt6/qtbase_%.bbappend          |   3 +
 50 files changed, 16 insertions(+), 1402 deletions(-)
 delete mode 100644 meta-arago-demos/COPYING.MIT
 delete mode 100644 meta-arago-demos/README
 delete mode 100644 meta-arago-demos/SECURITY
 delete mode 100644 meta-arago-demos/conf/layer.conf
 delete mode 100644 meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
 delete mode 100644 meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
 delete mode 100755 meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend

-- 
2.48.1


