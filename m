Return-Path: <x0038811@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A681052987
	for <meta-arago@arago-project.org>;
	Wed,  6 Mar 2019 10:35:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26AZIn7055508
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551868518;
	bh=MY5Fq0Taw7e1n0hYEbbCtyHE14kIFxIaglTusL7QAUM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IGZcQy+YzuViToKqD6Jwq5hCFgWl+yTIwQD9hPkryhR6ncCAk7ze3bfqK6YyPxpQs
	PloSfb8lrIXIVtmyH5P8zh5B33GzkQBn3fj5APK2bYIU6wx3Xs3JD1HtJ8exsiAV49
	7ydb58N0k1AmhnXwURTtDBHFoTJyymRxOB82SEvY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26AZI4Q128624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:18 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 04:35:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 04:35:17 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26AZFxb010172;
	Wed, 6 Mar 2019 04:35:17 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Mar 2019 16:05:11 +0530
Message-ID: <1551868512-30142-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551868512-30142-1-git-send-email-x0038811@ti.com>
References: <1551868512-30142-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 1/2] gstreamer1.0*-good: Clean up the failing patch
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
X-List-Received-Date: Wed, 06 Mar 2019 10:35:27 -0000
Content-Type: text/plain

Remove gstreamer good failing patch as this is not applyable on 1.14.4.
New rebased patch will be created instead of overwriting on the existing patch

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ----------------------
 .../gstreamer1.0-plugins-good_1.12.4.bbappend      |  7 -----
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
deleted file mode 100644
index 1af90c1..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Fri, 13 Oct 2017 15:48:06 +0530
-Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
-
-v4l2src plugin allocates 4 buffers for the pipeline.
-To capture video in realtime the pipeline without frameloss,
-four buffers are not sufficient. Increase the
-number of buffers by 4 more.
-
-Signed-off-by: Ramprasad N <x0038811@ti.com>
----
- sys/v4l2/gstv4l2object.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 549e06f..773f46d 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
-      * to fill the pipeline, the minimum required to decoder according to the
-      * driver and 1 more, so we don't endup up with everything downstream or
-      * held by the decoder. */
--    own_min = min + obj->min_buffers + 1;
-+    /* Increase the number of buffers required by 4 more to capture video in
-+     * realtime. With default number of 4 buffers, frame loss is observed */
-+    own_min = min + obj->min_buffers + 5;
- 
-     /* If no allocation parameters where provided, allow for a little more
-      * buffers and enable copy threshold */
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend
deleted file mode 100644
index ba306a4..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = ".arago0"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
-      "
-- 
1.9.1


