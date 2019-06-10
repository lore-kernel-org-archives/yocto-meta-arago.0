Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5DC6E52A1C
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 23:50:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo6aM085641
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560210606;
	bh=rI2l+91rxnBLgC6Xdlk/BNxYpabunm3U0r5xctUIIV4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ViXzFG3eKbmfdDGTu6CgtiQhVPqrne9i7OdK2SuU6P5MVuxZj9dEB0KBDPnKFVNkp
	+R8KpzGV3SWHyp3H7UeRxgruU4Qe3ycqxkA6+161kXP6RKrMCn2SgKTPl/VkQMD3Pj
	wyEa3EXz28YsN7zSKEEkLPX3HIZFsFIyWlNSko+Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANo6JC009600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:50:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:50:06 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo4wn077708;
	Mon, 10 Jun 2019 18:50:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Jun 2019 23:37:50 +0000
Message-ID: <20190610233750.31009-5-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610233750.31009-1-denys@ti.com>
References: <20190610233750.31009-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 4/4] arago-core-tisdk, matrix: add support for J7 building headless target for now
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
X-List-Received-Date: Mon, 10 Jun 2019 23:50:47 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc           | 5 +++++
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb      | 1 +
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 544f4e35..45a8c1bd 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -29,6 +29,7 @@ DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
 DTB_FILTER_omapl138 = "da850"
 DTB_FILTER_am65xx = "am65"
+DTB_FILTER_j7-evm = "j721e"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image arago-tiny-image"
@@ -39,6 +40,7 @@ TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
 TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
+TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
@@ -47,6 +49,8 @@ TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
 TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
+TISDK_TOOLCHAIN_j7-evm = "meta-toolchain-arago-tisdk-server"
+TOOLCHAIN_SUFFIX_j7-evm = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
@@ -54,6 +58,7 @@ IMAGE_INSTALL_QT = "\
 
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
+IMAGE_INSTALL_QT_j7-evm = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 82f9d07d..e14205a1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -58,6 +58,7 @@ do_install(){
 GUIDEPS = "matrix-gui-browser refresh-screen"
 GUIDEPS_keystone = ""
 GUIDEPS_omapl138 = ""
+GUIDEPS_j7-evm = ""
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.17.1


