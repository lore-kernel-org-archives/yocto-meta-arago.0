Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8C15952AA6
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6280840C1F;
	Wed,  8 Apr 2020 00:45:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ltWSCvcN6ccE; Wed,  8 Apr 2020 00:45:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C83540C1D;
	Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5808E171C3D;
	Tue,  7 Apr 2020 20:45:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:56 -0400
Message-Id: <1586306702-7953-18-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 18/24] tiovx-sys-iface: require dsp machine feature, cleanup
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
index a60cbe5..80e3fa7 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -1,5 +1,6 @@
-SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
-DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
+SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation"
+DESCRIPTION = "Collection of header files needed to define interface between TIOVX library and HOST and DSP IPC side implementation. \
+In order to maintain source compatibility, directory structure follows VSDK source tree layout."
 
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
@@ -12,7 +13,9 @@ PR = "r1"
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit update-alternatives
+inherit update-alternatives features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
 
 SRC_URI_append += "\
      file://reload-dsp-fw.sh \
@@ -46,4 +49,3 @@ PACKAGES =+ "${PN}-firmware"
 FILES_${PN}-firmware = "${base_libdir}/firmware/*"
 
 INSANE_SKIP_${PN}-firmware = "arch"
-
-- 
2.7.4


