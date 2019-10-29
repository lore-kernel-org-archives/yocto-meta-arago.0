Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4FB5C529D3
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 13:55:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrwj8082771
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572357238;
	bh=UbLG5qjx5+PdIrDNeAILZ9NzRClkRcEMY/VsMavjEQ0=;
	h=From:To:Subject:Date;
	b=sJYgV1PvSd9O99s62VZI2lyibx2wxmePIc6N8xlJGDBkEypZbY5iSKu9Cfj8yozjZ
	78FHw2itCvarhxo9Pk3MOD56DZoAOROyFS/b1ylr4FyYk2Vf7LQp4Z3JBAho6qrPbE
	mEKJwlglkIa0YCihRy0AsiKs6MLw/LprCB/zcJ6U=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TDrwZb095962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 08:53:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 08:53:45 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrvlX002718
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Oct 2019 09:53:42 -0400
Message-ID: <20191029135349.31792-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/7] Mesa-based EGL/GLES
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
X-List-Received-Date: Tue, 29 Oct 2019 13:55:19 -0000
Content-Type: text/plain

These are the corresponding patches with Mesa-based EGL/GLES including
- re-enable qtwebengine for AM3/4/5
- several hacks to resolve compiling issues triggered by  mesa-based EGL 
  header files
- Add DRM(GBM)-based 3D demos
- Makefile cleanup per Mesa-based EGL library names 

Eric Ruei (7):
  packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for
    AM3/4/5
  qtbase-conf: set the  default EGLFS mode to kms
  HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
  HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
  img-pvr-sdk: Add DRM(GBM)-based GPU demos
  omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
  HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer

 .../packagegroups/packagegroup-arago-qte.bb   |  9 +--
 .../packagegroup-arago-tisdk-qte.bb           |  7 +-
 ...mposito-drm-undef-HAVE_GBM_MODIFIERS.patch | 29 ++++++++
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 28 ++++++++
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
 .../matrix-gui-machinevision-demos_2.0.bb     |  6 +-
 ...packagegroup-arago-qte-toolchain-target.bb | 12 ++--
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
 ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
 13 files changed, 157 insertions(+), 50 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch

-- 
2.17.1


