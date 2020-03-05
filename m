Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B080252995
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 09:19:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0259H1el061049
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:17:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583399821;
	bh=h77/fjSmAdIHD0SVxVQ7OoMcw5Jxo6fsFVZ2YGSmkq4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gtyjQAHy5I0tTI4CirDW9RJs529FYYY8OlgsXNvM6CsurRBzLdgHdIhusGf4ihPsf
	bDBXWEY02vbA5gghaA2mGihvJ/lZmvXB76nJkQQQqYay4VdO+kIafFfOfOhiWWj1TE
	ErKhViSEGWygFaRHJ8Nczqk+xJEGOkyCV6Dkt8N0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0259H19r011448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:17:01 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 03:17:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 03:17:00 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0259GsTo020206;
	Thu, 5 Mar 2020 03:16:59 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2020 14:46:49 +0530
Message-ID: <1583399809-26608-4-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583399809-26608-1-git-send-email-x0038811@ti.com>
References: <1583399809-26608-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master 3/3] gstreamer1.0*-good: Check for drm memory support in try_format
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
X-List-Received-Date: Thu, 05 Mar 2020 09:19:05 -0000
Content-Type: text/plain

gstreamer1.0-plugins-good v1.16.1 v4l2src plugin tries to import
the dmabuf. This patch checks if the memory is drm.

This is required for dma_buf import support with v4l2src

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...heck-for-drm-memory-support-in-try_import.patch | 33 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend      |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch
new file mode 100644
index 0000000..81eceae
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch
@@ -0,0 +1,33 @@
+From 6cd7e4a3647b6000c03db008e9dc06a7dc52e875 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Fri, 21 Feb 2020 12:07:05 +0530
+Subject: [PATCH] v4l2src: Check for drm memory support in try_import
+
+In Gstreamer 1.16.1, if buffer pool is from a downstream
+element, v4l2 first tries to import.
+
+Check if the memory type is DRM memory.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 2d401a7..5143e2c 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -4768,7 +4768,9 @@ gst_v4l2_object_try_import (GstV4l2Object * obj, GstBuffer * buffer)
+     for (i = 0; i < n_mem; i++) {
+       GstMemory *mem = gst_buffer_peek_memory (buffer, i);
+ 
+-      if (!gst_is_dmabuf_memory (mem)) {
++      if (!gst_is_dmabuf_memory (mem) &&
++          !gst_memory_is_type (mem, GST_ALLOCATOR_DMABUF)) {
++
+         GST_DEBUG_OBJECT (obj->dbg_obj, "Cannot import non-DMABuf memory.");
+         return FALSE;
+       }
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
index 59347d9..c5a41ba 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -6,4 +6,5 @@ SRC_URI += " \
     file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
     file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
     file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
+    file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
 "
-- 
1.9.1


