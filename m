Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CC0AE52A19
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 02:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 399AD40AE2;
	Tue, 20 Nov 2018 02:56:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QBBy5h2sDClN; Tue, 20 Nov 2018 02:56:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D30A140A18;
	Tue, 20 Nov 2018 02:56:29 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2CD8E165BE9;
	Mon, 19 Nov 2018 21:56:29 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Nov 2018 21:56:28 -0500
Message-Id: <1542682588-2164-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gstreamer1.0-plugins-bad: disable failing patches
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
X-List-Received-Date: Tue, 20 Nov 2018 02:56:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.14.2.bbappend       | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
index 0c9263d..fea00ea 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
@@ -25,32 +25,32 @@ DEPENDS_append_k3 = " \
     libdrm \
 "
 
+#    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch
+#    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_ti43x = " \
-    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch  \
 "
 
 SRC_URI_append_ti33x = " \
     file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
+#    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch
+#    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_omap-a15 = " \
-    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch  \
 "
 
+#    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch
+#    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_k3 = " \
-    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch  \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


