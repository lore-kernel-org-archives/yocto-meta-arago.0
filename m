Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C1750529DC
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:06:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M46w72024802
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691618;
	bh=a027R06kO3PQi2zsUh9mREgEWbXwh1qVWXvxZAtmfTc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gMxuillTRF9HkNJTw2ovOjEBIRRQaoRzrZfsI75YOfc/+roPER/M1aEk86saapayQ
	QkHZOHFgc1FXrVCmpqV3l7n1f3MRIYuYYs5181ZYCwv29v7Oe07U39O9CznJQIiUB3
	XOSsMriaArwxjGIsDm6aV2S5DpbvtsqddAgy7ugo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46wu8002728
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:58 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:06:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:06:57 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAQ028035;
	Wed, 21 Mar 2018 23:06:57 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:42 +0530
Message-ID: <1521691605-49259-7-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 6/9] wayland-protocols: Add drm protocol to stable
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
X-List-Received-Date: Thu, 22 Mar 2018 04:07:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...nd-drm-Add-wayland-drm-protocol-to-stable.patch | 179 +++++++++++++++++++++
 .../wayland/wayland-protocols_1.10.bbappend        |  15 ++
 2 files changed, 194 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
new file mode 100644
index 0000000..7cb1750
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
@@ -0,0 +1,179 @@
+From aad79976f85fda12ade80a0bd760733a6ffb519e Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Mon, 26 Feb 2018 09:22:00 +0530
+Subject: [PATCH] wayland-drm: Add wayland-drm protocol to stable
+
+wayland-drm protocol is missing in the protocols list since this
+protocol is MESA specific. For waylandsink gstreamer support
+wayland-drm protocol is needed.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ stable/wayland-drm/wayland-drm.xml | 155 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 155 insertions(+)
+ create mode 100644 stable/wayland-drm/wayland-drm.xml
+
+diff --git a/stable/wayland-drm/wayland-drm.xml b/stable/wayland-drm/wayland-drm.xml
+new file mode 100644
+index 0000000..265d4f8
+--- /dev/null
++++ b/stable/wayland-drm/wayland-drm.xml
+@@ -0,0 +1,155 @@
++<?xml version="1.0" encoding="UTF-8"?>
++<protocol name="drm">
++
++  <copyright>
++    Copyright © 2008-2011 Kristian Høgsberg
++    Copyright © 2010-2011 Intel Corporation
++
++    Permission to use, copy, modify, distribute, and sell this
++    software and its documentation for any purpose is hereby granted
++    without fee, provided that\n the above copyright notice appear in
++    all copies and that both that copyright notice and this permission
++    notice appear in supporting documentation, and that the name of
++    the copyright holders not be used in advertising or publicity
++    pertaining to distribution of the software without specific,
++    written prior permission.  The copyright holders make no
++    representations about the suitability of this software for any
++    purpose.  It is provided "as is" without express or implied
++    warranty.
++
++    THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++    SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++    FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++    SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++    AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
++    ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
++    THIS SOFTWARE.
++  </copyright>
++
++  <!-- drm support. This object is created by the server and published
++       using the display's global event. -->
++  <interface name="wl_drm" version="1">
++    <enum name="error">
++      <entry name="authenticate_fail" value="0"/>
++      <entry name="invalid_format" value="1"/>
++      <entry name="invalid_name" value="2"/>
++    </enum>
++
++    <enum name="format">
++      <!-- The drm format codes match the #defines in drm_fourcc.h.
++           The formats actually supported by the compositor will be
++           reported by the format event. -->
++      <entry name="c8" value="0x20203843"/>
++      <entry name="rgb332" value="0x38424752"/>
++      <entry name="bgr233" value="0x38524742"/>
++      <entry name="xrgb4444" value="0x32315258"/>
++      <entry name="xbgr4444" value="0x32314258"/>
++      <entry name="rgbx4444" value="0x32315852"/>
++      <entry name="bgrx4444" value="0x32315842"/>
++      <entry name="argb4444" value="0x32315241"/>
++      <entry name="abgr4444" value="0x32314241"/>
++      <entry name="rgba4444" value="0x32314152"/>
++      <entry name="bgra4444" value="0x32314142"/>
++      <entry name="xrgb1555" value="0x35315258"/>
++      <entry name="xbgr1555" value="0x35314258"/>
++      <entry name="rgbx5551" value="0x35315852"/>
++      <entry name="bgrx5551" value="0x35315842"/>
++      <entry name="argb1555" value="0x35315241"/>
++      <entry name="abgr1555" value="0x35314241"/>
++      <entry name="rgba5551" value="0x35314152"/>
++      <entry name="bgra5551" value="0x35314142"/>
++      <entry name="rgb565" value="0x36314752"/>
++      <entry name="bgr565" value="0x36314742"/>
++      <entry name="rgb888" value="0x34324752"/>
++      <entry name="bgr888" value="0x34324742"/>
++      <entry name="xrgb8888" value="0x34325258"/>
++      <entry name="xbgr8888" value="0x34324258"/>
++      <entry name="rgbx8888" value="0x34325852"/>
++      <entry name="bgrx8888" value="0x34325842"/>
++      <entry name="argb8888" value="0x34325241"/>
++      <entry name="abgr8888" value="0x34324241"/>
++      <entry name="rgba8888" value="0x34324152"/>
++      <entry name="bgra8888" value="0x34324142"/>
++      <entry name="xrgb2101010" value="0x30335258"/>
++      <entry name="xbgr2101010" value="0x30334258"/>
++      <entry name="rgbx1010102" value="0x30335852"/>
++      <entry name="bgrx1010102" value="0x30335842"/>
++      <entry name="argb2101010" value="0x30335241"/>
++      <entry name="abgr2101010" value="0x30334241"/>
++      <entry name="rgba1010102" value="0x30334152"/>
++      <entry name="bgra1010102" value="0x30334142"/>
++      <entry name="yuyv" value="0x56595559"/>
++      <entry name="yvyu" value="0x55595659"/>
++      <entry name="uyvy" value="0x59565955"/>
++      <entry name="vyuy" value="0x59555956"/>
++      <entry name="ayuv" value="0x56555941"/>
++      <entry name="nv12" value="0x3231564e"/>
++      <entry name="nv21" value="0x3132564e"/>
++      <entry name="nv16" value="0x3631564e"/>
++      <entry name="nv61" value="0x3136564e"/>
++      <entry name="yuv410" value="0x39565559"/>
++      <entry name="yvu410" value="0x39555659"/>
++      <entry name="yuv411" value="0x31315559"/>
++      <entry name="yvu411" value="0x31315659"/>
++      <entry name="yuv420" value="0x32315559"/>
++      <entry name="yvu420" value="0x32315659"/>
++      <entry name="yuv422" value="0x36315559"/>
++      <entry name="yvu422" value="0x36315659"/>
++      <entry name="yuv444" value="0x34325559"/>
++      <entry name="yvu444" value="0x34325659"/>
++    </enum>
++
++    <!-- Call this request with the magic received from drmGetMagic().
++         It will be passed on to the drmAuthMagic() or
++         DRIAuthConnection() call.  This authentication must be
++         completed before create_buffer could be used. -->
++    <request name="authenticate">
++      <arg name="id" type="uint"/>
++    </request>
++
++    <!-- Create a wayland buffer for the named DRM buffer.  The DRM
++         surface must have a name using the flink ioctl -->
++    <request name="create_buffer">
++      <arg name="id" type="new_id" interface="wl_buffer"/>
++      <arg name="name" type="uint"/>
++      <arg name="width" type="int"/>
++      <arg name="height" type="int"/>
++      <arg name="stride" type="uint"/>
++      <arg name="format" type="uint"/>
++    </request>
++
++    <!-- Create a wayland buffer for the named DRM buffer.  The DRM
++         surface must have a name using the flink ioctl -->
++    <request name="create_planar_buffer">
++      <arg name="id" type="new_id" interface="wl_buffer"/>
++      <arg name="name" type="uint"/>
++      <arg name="width" type="int"/>
++      <arg name="height" type="int"/>
++      <arg name="format" type="uint"/>
++      <arg name="offset0" type="int"/>
++      <arg name="stride0" type="int"/>
++      <arg name="offset1" type="int"/>
++      <arg name="stride1" type="int"/>
++      <arg name="offset2" type="int"/>
++      <arg name="stride2" type="int"/>
++    </request>
++
++    <!-- Notification of the path of the drm device which is used by
++         the server.  The client should use this device for creating
++         local buffers.  Only buffers created from this device should
++         be be passed to the server using this drm object's
++         create_buffer request. -->
++    <event name="device">
++      <arg name="name" type="string"/>
++    </event>
++
++    <event name="format">
++      <arg name="format" type="uint"/>
++    </event>
++
++    <!-- Raised if the authenticate request succeeded -->
++    <event name="authenticated"/>
++  </interface>
++
++</protocol>
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend
new file mode 100644
index 0000000..eba62d8
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_1.10.bbappend
@@ -0,0 +1,15 @@
+PR_append = "_arago1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+      file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
+      "
+
+S = "${WORKDIR}/wayland-protocols-1.10"
+
+do_install_append() {
+	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
+	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-protocols/stable/wayland-drm/
+
+}
-- 
1.9.1


