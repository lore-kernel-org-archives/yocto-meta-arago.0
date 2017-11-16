Return-Path: <x0038811@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5280152A30
	for <meta-arago@arago-project.org>;
	Thu, 16 Nov 2017 09:25:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAG9PxCf026182
	for <meta-arago@arago-project.org>; Thu, 16 Nov 2017 03:25:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510824359;
	bh=z+NjrbXIgezNO7cskvmftFplw395a6W7qHkrD5A4nRY=;
	h=From:To:CC:Subject:Date;
	b=pccQK4XQQFb3aAQibDWASWYw9Z82k1mw0RrU3BHdmvbeOj1dAbYZAxEMA0dPkJWud
	FYdhC2D+Oq224r7OR2GrGmj0bU562Zdx9vNG6VWaVV1C1e49IC/zRNJ/ZiDapwJ57B
	56nMmIYsTL9dQugJ3Zed/CLTwbUCo83yti3faCLw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAG9Pxc9010950
	for <meta-arago@arago-project.org>; Thu, 16 Nov 2017 03:25:59 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 16 Nov 2017 03:25:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 16 Nov 2017 03:25:59 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAG9PvY3004104;
	Thu, 16 Nov 2017 03:25:57 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Nov 2017 14:55:55 +0530
Message-ID: <1510824355-26185-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty PATCH V5] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Thu, 16 Nov 2017 09:26:00 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
new file mode 100644
index 0000000..1af90c1
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
@@ -0,0 +1,33 @@
+From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Fri, 13 Oct 2017 15:48:06 +0530
+Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
+
+v4l2src plugin allocates 4 buffers for the pipeline.
+To capture video in realtime the pipeline without frameloss,
+four buffers are not sufficient. Increase the
+number of buffers by 4 more.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 549e06f..773f46d 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+      * to fill the pipeline, the minimum required to decoder according to the
+      * driver and 1 more, so we don't endup up with everything downstream or
+      * held by the decoder. */
+-    own_min = min + obj->min_buffers + 1;
++    /* Increase the number of buffers required by 4 more to capture video in
++     * realtime. With default number of 4 buffers, frame loss is observed */
++    own_min = min + obj->min_buffers + 5;
+ 
+     /* If no allocation parameters where provided, allow for a little more
+      * buffers and enable copy threshold */
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
new file mode 100644
index 0000000..29a07b2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
+      "
+
-- 
1.9.1


