Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0A2585298B
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A6F6B40C15;
	Sat, 11 Apr 2020 22:32:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RlwhKwzyNiM9; Sat, 11 Apr 2020 22:32:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 86B18409DE;
	Sat, 11 Apr 2020 22:32:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5733D172011;
	Sat, 11 Apr 2020 18:32:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:32:40 -0400
Message-Id: <1586644369-16268-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 01/10] packagegroups-*-sdk*: require dsp, gpu machine and opencl, opencv, opengl distro features for qt-opencv-opencl-opengl-multithreaded
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
X-List-Received-Date: Sat, 11 Apr 2020 22:35:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb       | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 0d5fa73..5433a79 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -27,7 +27,7 @@ MULTIMEDIA_append_omap-a15 = " \
 MULTIMEDIA_append_am65xx = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_dra7xx = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
+    ${@['','qt-opencv-opencl-opengl-multithreaded-src'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 
 MULTIMEDIA_append_keystone = " ${BARCODE_PKG}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 72d7740..dd4c715 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -13,7 +13,7 @@ MULTIMEDIA = ""
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
+    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
-- 
2.7.4


