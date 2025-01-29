Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE01DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 00:15:02 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2174.1738109695854027282
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 16:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NK5GRMiH;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50T0Ere31270647
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 18:14:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738109693;
	bh=bskp7JI4w1JG1dQdOg3lmXi+nU4/la7mvZe9BYc62Ew=;
	h=From:To:CC:Subject:Date;
	b=NK5GRMiHr8ANAhgptG/jbNJtWzxu93QG/XaI8ATFZiU59HTk7oHFxENyLHxsfZPvy
	 4y/Jx645oiNVJ8LLBYo6xY6pVXbAfNmClmrU6uoiD7qM2F8GqtfsoQ7kSR+eXdXHz6
	 TJpVKFCT6wrEG9dCveeJ7sWzn/BP0cA2l/XryQjA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50T0EruC014227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 18:14:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 18:14:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 18:14:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50T0Eqe6079301;
	Tue, 28 Jan 2025 18:14:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/2] Drop qt5 and enable qt6 in ti-test
Date: Tue, 28 Jan 2025 18:14:46 -0600
Message-ID: <20250129001448.2768568-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jan 2025 00:15:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15776

From: Randolph Sapp <rs@ti.com>

Since I haven't heard anything back on the previous discussion [1], here's a
potential implementation of Qt6 in a minimal form that satisfies only our
testing requirements.

It does not create any explicit dependencies in meta-arago-test, so this layer
can still be used in conjunction with other distros without breaking things.
Since it's a distro choice to pull in and configure Qt, we only configure the
bare essentials to run the related tests.

This currently allows people to run example applications like hellogles3 with
eglfs and wayland backends, which will be the first two backends being tested.

[1] https://lists.yoctoproject.org/g/meta-arago/topic/110799093

Randolph Sapp (2):
  meta-arago-*: remove all qt5 configs
  meta-arago-test: dynamic layer for qt6 support

 meta-arago-distro/README                      |   4 -
 meta-arago-distro/conf/distro/arago.conf      |  24 --
 meta-arago-distro/conf/layer.conf             |   2 -
 .../images/tisdk-default-image.bb             |   1 -
 .../meta/meta-toolchain-arago-qte.bb          |  54 ----
 .../meta/meta-toolchain-arago-tisdk.bb        |   2 +-
 .../packagegroups/packagegroup-arago-qte.bb   |  26 --
 .../packagegroup-arago-tisdk-qte.bb           |  21 --
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
 .../recipes-core/packagegroups/ti-world.bb    |   1 -
 .../qt5/qtbase-conf/eglfs_kms_cfg.json        |   5 -
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  16 -
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  14 -
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  23 --
 ...xit-button-for-non-window-environmen.patch |  62 ----
 ...01-deform-Fix-how-controls-are-shown.patch |  35 ---
 ...fs-Force-888-format-only-on-env-flag.patch |  44 ---
 ...latforms-eglfs_kms-fix-compiler-erro.patch |  29 --
 ...d-exit-button-for-non-window-environ.patch |  83 ------
 .../0002-deform-disable-opengl-button.patch   |  73 -----
 .../recipes-qt/qt5/qtbase/quit.png            | Bin 645 -> 0 bytes
 .../recipes-qt/qt5/qtbase_%.bbappend          |  46 ---
 ...touchinteraction.qml-Add-exit-button.patch |  62 ----
 .../recipes-qt/qt5/qtdeclarative_git.bbappend |  10 -
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch |  30 --
 ...e-to-use-GL_NoX-version-of-GraphicsS.patch |  31 --
 .../qtwebkit/GraphicsContext3DQt.cpp.patch    |  29 --
 .../qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch  | 273 ------------------
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch |  36 ---
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch |  20 --
 .../qt5/qtwebkit/qttestbrowser.cpp.patch      |  27 --
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  18 --
 meta-arago-extras/README                      |   4 -
 ...k-packagegroup-arago-qte-toolchain-host.bb |  12 -
 ...packagegroup-arago-qte-toolchain-target.bb |  35 ---
 .../cmake/extra-cmake-modules.bb              |   1 -
 ..._QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch |  28 --
 meta-arago-test/conf/layer.conf               |   4 +
 .../packagegroups/ti-test.bbappend            |   7 +
 .../recipes-qt/qt6/qtbase_%.bbappend          |   3 +
 40 files changed, 15 insertions(+), 1181 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb
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
2.47.1


