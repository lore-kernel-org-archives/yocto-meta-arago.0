Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id F3B4C52961
	for <meta-arago@arago-project.org>;
	Thu, 30 Nov 2017 13:44:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAUDiXK4013717
	for <meta-arago@arago-project.org>; Thu, 30 Nov 2017 07:44:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512049473;
	bh=0irmJjLrww+T9L0uOdn2TW/Mro1cge0nyc/Lu7zGOy4=;
	h=From:To:Subject:Date;
	b=GbjsWkO2NUqoshH2P660kPUXwbdT5Iu5IxGEmkiyLDauS9ae9vQe2kOpP4wePbXSC
	J476ZUOJQ28yzSwCsyab/9/XcTG3MbiyjGE71wuQLHLbxNlPiOjprUONGSvJftaM7A
	MPPh6jAXCLRisUN8qK9xp2EI664lwauTe6ysYlww=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAUDiXPS017692
	for <meta-arago@arago-project.org>; Thu, 30 Nov 2017 07:44:33 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 30 Nov 2017 07:44:32 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 30 Nov 2017 07:44:32 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAUDiWRV019629
	for <meta-arago@arago-project.org>; Thu, 30 Nov 2017 07:44:32 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Nov 2017 08:44:07 -0500
Message-ID: <1512049447-64434-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: bump SRCREV to pick up the libpng fixes for AM5
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
X-List-Received-Date: Thu, 30 Nov 2017 13:44:34 -0000
Content-Type: text/plain

- restore the libpng libraries as symbolic links for AM5
- update the SYSROOT_DIRS_BLACKLIST_append list with libpng* instead of libpng12

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
index 6434869..8bdf4bd 100644
--- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
+++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
-SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
+SRCREV = "bc642ce08c6056906eac4c7e257e856bb22d8cbb"
 
 SRC_URI += " file://xorg"
 
@@ -33,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r1"
+PR = "r2"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
 
 DEPENDS += "udev"
@@ -71,7 +71,7 @@ FILES_${PN}-plugins += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/mo
 FILES_${PN}-staticdev += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
 RDEPENDS_${PN} += "${PN}-plugins"
 
-SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng12.a /usr/local/XSGX/lib/libpng12.so /usr/local/XSGX/lib/libpng12.so.0  /usr/local/XSGX/lib/libpng12.so.0.56.0"
+SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng.a /usr/local/XSGX/lib/libpng.so"
 
 
 ALLOW_EMPTY_${PN}-plugins = "1"
-- 
1.9.1


