Return-Path: <angelabaker@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AD102520E2
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2019 21:10:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BL9aOg044834
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2019 16:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568236176;
	bh=mF2bTfAbe0LoXqw3K6EIupoW2LT8dt526V9F/BXSGXs=;
	h=From:To:CC:Subject:Date;
	b=Mow35kYpUWo4rPXU3+9R9e07iRDNAUC7S2Pl+6DPc6BGi2jKWNLhdoNmrOFQ9/ZDI
	gtBrx0SQa/1FcLUKwcvEmbBmOlpoo984bfN768OGME/H5xSJvFDkVdu3Az6UJfy1oQ
	DR+vyVt0tPZzoC94G8Aweq3jI7cOKwOS3F+6J9b8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BL9abj067292
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2019 16:09:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 11 Sep 2019 16:09:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 11 Sep 2019 16:09:35 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BL9ZMZ052014;
	Wed, 11 Sep 2019 16:09:35 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8BL9ZZ29333; Wed, 11 Sep 2019 16:09:35 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Sep 2019 16:09:07 -0500
Message-ID: <1568236147-17998-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] wayland-protocols: Update to version 2
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
X-List-Received-Date: Wed, 11 Sep 2019 21:10:42 -0000
Content-Type: text/plain

Update to version 2 for j7-evm as it supports version 2.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../0002-wayland-drm-Update-to-version-2.patch     | 75 ++++++++++++++++++++++
 .../wayland/wayland-protocols_%.bbappend           |  4 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
new file mode 100644
index 0000000..3c9da42
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
@@ -0,0 +1,75 @@
+From 4bfbb6c8236c648f7fd8090a540e3590674dbd81 Mon Sep 17 00:00:00 2001
+From: Angela Stegmaier <angelabaker@ti.com>
+Date: Fri, 19 Jul 2019 15:19:17 -0500
+Subject: [PATCH 2/2] wayland-drm: Update to version 2
+
+Update the wayland-drm protocol to version 2
+
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+---
+ stable/wayland-drm/wayland-drm.xml | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/stable/wayland-drm/wayland-drm.xml b/stable/wayland-drm/wayland-drm.xml
+index 265d4f8..83aa561 100644
+--- a/stable/wayland-drm/wayland-drm.xml
++++ b/stable/wayland-drm/wayland-drm.xml
+@@ -29,7 +29,7 @@
+ 
+   <!-- drm support. This object is created by the server and published
+        using the display's global event. -->
+-  <interface name="wl_drm" version="1">
++  <interface name="wl_drm" version="2">
+     <enum name="error">
+       <entry name="authenticate_fail" value="0"/>
+       <entry name="invalid_format" value="1"/>
+@@ -39,7 +39,8 @@
+     <enum name="format">
+       <!-- The drm format codes match the #defines in drm_fourcc.h.
+            The formats actually supported by the compositor will be
+-           reported by the format event. -->
++           reported by the format event. New codes must not be added,
++           unless directly taken from drm_fourcc.h. -->
+       <entry name="c8" value="0x20203843"/>
+       <entry name="rgb332" value="0x38424752"/>
+       <entry name="bgr233" value="0x38524742"/>
+@@ -150,6 +151,36 @@
+ 
+     <!-- Raised if the authenticate request succeeded -->
+     <event name="authenticated"/>
++
++    <enum name="capability" since="2">
++      <description summary="wl_drm capability bitmask">
++        Bitmask of capabilities.
++      </description>
++      <entry name="prime" value="1" summary="wl_drm prime available"/>
++    </enum>
++
++    <event name="capabilities">
++      <arg name="value" type="uint"/>
++    </event>
++
++    <!-- Version 2 additions -->
++
++    <!-- Create a wayland buffer for the prime fd.  Use for regular and planar
++         buffers.  Pass 0 for offset and stride for unused planes. -->
++    <request name="create_prime_buffer" since="2">
++      <arg name="id" type="new_id" interface="wl_buffer"/>
++      <arg name="name" type="fd"/>
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
+   </interface>
+ 
+ </protocol>
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
index b136826..7edd850 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -6,6 +6,8 @@ SRC_URI += " \
       file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
       "
 
+SRC_URI_append_j7-evm = "file://0002-wayland-drm-Update-to-version-2.patch"
+
 do_install_append() {
 	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
 	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-protocols/stable/wayland-drm/
-- 
1.9.1


