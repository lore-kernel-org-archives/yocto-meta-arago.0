Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0EE9652A1F
	for <meta-arago@arago-project.org>;
	Wed,  6 Mar 2019 10:35:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26AZJfQ079415
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551868519;
	bh=kDVT5S8GCOzTVbRUWrfGOvqyPIGL11BogjwqjujCDs8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lYasoPERgUcfq5sF/8CaUkGupc2kLUn/3yzlo9u7Dmk6YJzvXZxbzWG2sg+PmXq/N
	9mCOFJk6xGxElCCct5CcYozaHw2lapiw+9Ov+sy0wsAe1awfUFSb4OF/CZILyizaEN
	e6Idwf8JOmEtD+Qwlz830ZhCyFFEk/ClNC+9nNaE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26AZJ8d044244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:19 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 04:35:18 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 04:35:19 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26AZFxc010172;
	Wed, 6 Mar 2019 04:35:18 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Mar 2019 16:05:12 +0530
Message-ID: <1551868512-30142-3-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551868512-30142-1-git-send-email-x0038811@ti.com>
References: <1551868512-30142-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 2/2] gstreamer1.0*-good: Update the good patch for gst 1.14.4
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
X-List-Received-Date: Wed, 06 Mar 2019 10:35:28 -0000
Content-Type: text/plain

New rebased patches are created

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...v4l2src-Increase-minimum-num-buffers-by-3.patch | 31 +++++++++++++++
 ...2src-Use-generic-dmabuf-import-in-v4l2src.patch | 45 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.14.4.bbappend      |  8 ++++
 3 files changed, 84 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
new file mode 100644
index 0000000..b1fd548
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
@@ -0,0 +1,31 @@
+From b87857b69e7707e04ce8c0cb97e316d37d7fd297 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Mon, 28 Jan 2019 13:19:30 +0530
+Subject: [PATCH 1/2] v4l2src: Increase minimum num buffers by 3
+
+v4l2src plugin allocates 5 buffers for the pipeline.
+To capture video in realtime the pipeline without frameloss,
+four buffers are not sufficient. Increase the
+number of buffers by 3 more.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 124c778..211f835 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -4385,7 +4385,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+      * held by the decoder. We account 2 buffers for v4l2 so when one is being
+      * pushed downstream the other one can already be queued for the next
+      * frame. */
+-    own_min = min + obj->min_buffers + 2;
++    own_min = min + obj->min_buffers + 5;
+ 
+     /* If no allocation parameters where provided, allow for a little more
+      * buffers and enable copy threshold */
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
new file mode 100644
index 0000000..eb07e18
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
@@ -0,0 +1,45 @@
+From 4b46918c475040ae4218f2474e564accd953847a Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 22 Mar 2018 12:02:59 +0530
+Subject: [PATCH 2/2] v4l2src: Use generic dmabuf import in v4l2src
+
+In Gstreamer 1.12.2 dmabuf interpreation has got
+changed and it doesn't consider DRM Fds as dmabuf since
+they are not allocated from dmabuf allocator.
+Because of this dmabuf_import will fail for the usecase
+wher v4l2src imports drm buffers allocated from ducati.
+
+With earlier Gstreamer versions, gst_mem_is_dmabuf()
+used to consider if mem_type is DMABUF or not.
+
+Since both dmabuf and drmallocator are derived from
+fdallocator, a generic fd mechanism is used in this patch.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ sys/v4l2/gstv4l2allocator.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2allocator.c b/sys/v4l2/gstv4l2allocator.c
+index 7e0e7c2..21edd36 100644
+--- a/sys/v4l2/gstv4l2allocator.c
++++ b/sys/v4l2/gstv4l2allocator.c
+@@ -1073,12 +1073,13 @@ gst_v4l2_allocator_import_dmabuf (GstV4l2Allocator * allocator,
+     gint dmafd;
+     gsize size, offset, maxsize;
+ 
+-    if (!gst_is_dmabuf_memory (dma_mem[i]))
++    if (!gst_is_dmabuf_memory (dma_mem[i]) &&
++        !gst_memory_is_type (dma_mem[i], GST_ALLOCATOR_DMABUF))
+       goto not_dmabuf;
+ 
+     size = gst_memory_get_sizes (dma_mem[i], &offset, &maxsize);
+ 
+-    if ((dmafd = dup (gst_dmabuf_memory_get_fd (dma_mem[i]))) < 0)
++    if ((dmafd = dup (gst_fd_memory_get_fd (dma_mem[i]))) < 0)
+       goto dup_failed;
+ 
+     GST_LOG_OBJECT (allocator, "imported DMABUF as fd %i plane %d", dmafd, i);
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
new file mode 100644
index 0000000..edffa28
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+      file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
+      file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
+      "
-- 
1.9.1


