Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7838352A51
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8095140C43;
	Wed,  8 Apr 2020 00:45:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 37MGVkTv8XD8; Wed,  8 Apr 2020 00:45:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7047640C33;
	Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4C558171C3C;
	Tue,  7 Apr 2020 20:45:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:55 -0400
Message-Id: <1586306702-7953-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 17/24] tiovx-lib-host: cleanup
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
index 9baac78..16f2339 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
@@ -1,5 +1,7 @@
 SUMMARY = "TI OpenVX HOST (Linux A15) side library"
-DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. This package creates necessary libraries and header files for Linux Host side only. "
+DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. \
+Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. \
+This package creates necessary libraries and header files for Linux Host side only. "
 
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX_manifest.html;md5=edd4fbfc6c1f01c20d49def4670efac0"
@@ -17,10 +19,9 @@ SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH
 SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
 SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
 
-
 S = "${WORKDIR}/git"
 
-DEPENDS = " tiovx-sys-iface "
+DEPENDS = "tiovx-sys-iface"
 
 EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} "
 EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=no "
-- 
2.7.4


