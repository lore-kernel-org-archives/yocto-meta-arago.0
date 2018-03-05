Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D3A9A52994
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 08:16:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w258FK7Z031992
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 02:15:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520237720;
	bh=cSGz1CryxJzPkP2QTc8A6gH2gpOVrCATWKjHxIjdmI0=;
	h=From:To:CC:Subject:Date;
	b=T+sk1BpE367YfZF6bnjQ6e5ugz0aTlph+1CFrrmyTmlxH7J1J2gdtkab5MNPQOSLr
	RW3ClPb0muJjYpgeXXQt2dyS5lfc0jIcduK+XHW6ilOyNjjKjVOYPsO9scRFJ8Ppbf
	YCO3T2IEv9C7igxB8OOnP8KOi1uQ+i7Lo24LoHHY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w258FKXt001506
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 02:15:20 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 02:15:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 02:15:20 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w258FIfO005743;
	Mon, 5 Mar 2018 02:15:19 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Mar 2018 13:45:16 +0530
Message-ID: <1520237716-56580-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] gstreamer1.0-*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Mon, 05 Mar 2018 08:16:01 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>

(from meta-arago/morty commit 43d224b0c06bbc553a74b2f5f005500e6a80f53f)

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.6.3.bbappend       |  7 +++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
new file mode 100644
index 0000000..8b7a098
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
@@ -0,0 +1,33 @@
+From 8101057275d0384ce5bffece082046781a8d9331 Mon Sep 17 00:00:00 2001
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
+index f7d315a..cc8d8f7 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -3738,7 +3738,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
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
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bbappend
new file mode 100644
index 0000000..55aab25
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bbappend
@@ -0,0 +1,7 @@
+PR_append = "_arago_2"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+         file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
+      "
-- 
1.9.1


