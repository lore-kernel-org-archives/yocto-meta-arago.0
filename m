Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5938852A2C
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDvBN054595
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139237;
	bh=tWMqjnaLrtlJGAXHo0CDnUHeEKBWg/LNWqzX4U1pDq0=;
	h=From:To:Subject:Date;
	b=ZLRkn0l2dKF0qXLPa7oeN4p9CIvwWzADmvSKIjaVBi/lTn1F5zFU6nmvo/zGKTGhj
	7xA3jzE53AVySNkoBigK/gzX1iZhIBZKLCJU3NGJXtBCMy7uavCNV3PH/ZTjuacaYE
	GwupYprDHx1Ow1x3qpe+6+45C4D1LmS1CkyS0TpQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AIDvUg100665
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDuns035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:56 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:22 -0400
Message-ID: <20190910181131.8808-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 0/9] Enable build with mesa-based EGL1.5
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:04 -0000
Content-Type: text/plain

These patches enable mesa-based EGL1.5 build with chromium-ozone-wayland v75
as an engineering release for early integration of chromium-based user
interface development.

An experimental or  engineering branch should be created for those patches.

Eric Ruei (9):
  chromium-ozone-wayland: remove virtual/libgl from DEPENDS list
  HACK: matrix-gui-machinevision-demos: remove point-cloud-viewer
  HACK: packagegroup-arago-test-addons: remove omapdrmtest
  packagegroup-arago-tisdk-multimedia: rename chromium-wayland
  HACK: weston: undefine HAVE_GBM_MODIFIERS unconditionally
  HACK: qtwebkit: sync up the khrplatform.h under ANGLE/include/KHR with
    the one provided by mesa-egl
  HACK: libepoxy: replace local definitions with khrplatform.h at
    gen_dispatch
  packagegroup-arago-tisdk-graphics: replace chromium-wayland with
    chromium-ozone-wayland
  HACK: ti-sgx-ddk-um: take AM5 binaries from mesa-egl based
    experimental branch

 .../chromium-ozone-wayland_%.bbappend         |  5 ++
 ...atrix-gui-machinevision-demos_2.0.bbappend |  5 ++
 .../packagegroup-arago-test-addons.bbappend   |  6 ++-
 ...packagegroup-arago-tisdk-graphics.bbappend | 18 ++++++-
 ...ckagegroup-arago-tisdk-multimedia.bbappend |  8 +--
 ...h-use-KHR-khrplatform.h-instead-of-l.patch | 50 +++++++++++++++++++
 .../libepoxy/libepoxy_1.5.2.bbappend          |  7 +++
 .../ti-sgx-ddk-um_1.17.4948957.bbappend       | 21 ++++++++
 ...mposito-drm-undef-HAVE_GBM_MODIFIERS.patch | 29 +++++++++++
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 28 +++++++++++
 recipes-qt/qt5/qtwebkit_%.bbappend            | 10 ++++
 12 files changed, 183 insertions(+), 7 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
 create mode 100644 recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bbappend
 create mode 100644 recipes-graphics/libepoxy/libepoxy/0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch
 create mode 100644 recipes-graphics/libepoxy/libepoxy_1.5.2.bbappend
 create mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bbappend
 create mode 100644 recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
 create mode 100644 recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 create mode 100644 recipes-qt/qt5/qtwebkit_%.bbappend

-- 
2.17.1


