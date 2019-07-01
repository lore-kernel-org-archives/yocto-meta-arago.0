Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A027E52972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 19:55:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61JsM5T068865
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562010862;
	bh=mHRZXMkhwR5C3G6AGgsnBEAV8AkCeOofejdSI+toegk=;
	h=From:To:CC:Subject:Date;
	b=kgehToEP5nQRUqq05kctLTlo+4ly9/+bsUL7NFQ5sGpXRCL2wjz7AnkJpzAzof05A
	/MHrnjJQPjaKE7aR5M7Fjrfwc4inzoO2neSyBLprr/5ZdX4zOXFa2hYg5nkEN/XV1u
	u9c+RrnaQKJqOmcXGgBDzzpdOcELITOoDDC8LW+Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61JsMgQ046843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:54:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 14:54:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 14:54:22 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61JsLiM085940;
	Mon, 1 Jul 2019 14:54:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jul 2019 19:41:50 +0000
Message-ID: <20190701194150.28487-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] kmscube, omapdrmtest: change gbm to virtual provider
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
X-List-Received-Date: Mon, 01 Jul 2019 19:55:08 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb     | 2 +-
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index c19f5500..3ed0c167 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
 
-DEPENDS = "libdrm libgbm virtual/egl virtual/libgles2"
+DEPENDS = "libdrm virtual/libgbm virtual/egl virtual/libgles2"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 80207767..079663e7 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Test applications for OMAP DRM interface"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
 
-DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
+DEPENDS = "ffmpeg libdce libdrm virtual/libgbm ti-sgx-ddk-um wayland"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x"
 
-- 
2.17.1


