Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B7767529F3
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvPx126907
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465357;
	bh=zIwdOg+tmlXLbOZbQiiRzS9SkgmUlX3oSOkIleAaS6g=;
	h=From:To:Subject:Date;
	b=e3MkC5K37Eg52H3brz6ANiHQcirBypLSyYxOaZuJQ5aN65rjX7qlhdizve5pLv3St
	O05DmRA4um6xnhCd+zU2VFfiVbjW7T9z//kmnB60fRQ2jJNTdw7aP4/T1nz3Qs7d86
	KKjuJ426rPWdk9I0tLLMebFaxWzDGmJkcfGaJ53g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvkn031251
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:44 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwl112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:56 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:43 -0400
Message-ID: <20191030195550.17767-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:18 -0000
Content-Type: text/plain

These are the corresponding patches with Mesa-based EGL/GLES including
- re-enable qtwebengine for AM3/4/5
- several hacks to resolve compiling issues triggered by  mesa-based EGL
  header files
- Add DRM(GBM)-based 3D demos
- Makefile cleanup per Mesa-based EGL library names 

V2 changes:
- Add Upstream-Status to Weston and qtWebkit patches

Eric Ruei (7):
  packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for
    AM3/4/5
  qtbase-conf: set the default EGLFS mode to kms
  HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
  HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
  img-pvr-sdk: Add DRM(GBM)-based GPU demos
  omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
  HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer

 .../packagegroups/packagegroup-arago-qte.bb   |  9 +--
 .../packagegroup-arago-tisdk-qte.bb           |  7 +-
 ...rm-undef-HAVE_GBM_MODIFIERS-explicit.patch | 31 ++++++++
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ++++++++
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
 .../matrix-gui-machinevision-demos_2.0.bb     |  6 +-
 ...packagegroup-arago-qte-toolchain-target.bb | 12 ++--
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
 ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
 13 files changed, 161 insertions(+), 50 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch

-- 
2.17.1


