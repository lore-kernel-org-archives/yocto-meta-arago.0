Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 29C8652A4F
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2018 20:35:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7GKYwdL080286
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534451698;
	bh=ztWfiaVVotu+3WEB1ow1C8NSAQVA2P1HzzBJg/XMAU4=;
	h=From:To:Subject:Date;
	b=hFOG34P/K6TTXdmkghmNBYkd6YjZ/n2zpMLSmrM7jZwtmmC3yDlPprpuO4DsZlvoz
	7/ZEdM7ioUn+rDO1e9ma1WFlzB1k6tt4JaY81kndthtE96aaCvcPUC7XW+myQcede8
	WF6Mv0HT2w2z4abnGPg5bjHbiewJUss82fGw2CLw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKYw9n002687
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:34:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 16 Aug 2018 15:34:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 16 Aug 2018 15:34:57 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKYvWu030748
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:34:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2018 16:34:21 -0400
Message-ID: <1534451661-38358-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] gstreamer1.0-plugins-bad: add k3 support
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
X-List-Received-Date: Thu, 16 Aug 2018 20:35:06 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend    | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
index ecd87c8..0c9263d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
@@ -7,6 +7,7 @@ PACKAGECONFIG += "kms"
 PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_k3 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
 DEPENDS_append_omap-a15 = " \
     libdrm \
@@ -20,6 +21,10 @@ DEPENDS_append_ti33x = " \
     libdrm \
 "
 
+DEPENDS_append_k3 = " \
+    libdrm \
+"
+
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
@@ -40,6 +45,14 @@ SRC_URI_append_omap-a15 = " \
     file://0005-waylandsink-Add-input-device-support.patch  \
 "
 
+SRC_URI_append_k3 = " \
+    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
+    file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
+    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
+    file://0005-waylandsink-Add-input-device-support.patch  \
+"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r5"
+PR = "r6"
-- 
1.9.1


