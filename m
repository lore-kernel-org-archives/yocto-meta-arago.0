Return-Path: <x0038811@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5F399529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:07:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M470mn028583
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691620;
	bh=ziX7Pnvljl5l4FOUaQp45slSYMvgZn6okL6+cOdHby0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v9Dt2mU/unxFPheoaqoHLEs9Ia1J/d2h6/Ry5lxmuIiC79SjHQPWIzu4xt5Bm9S2e
	brMwMt1DRgf4gFiEBYyxcO1Suu9f1o5gxl2Gi1puYQCzB6bWUuQKLQxbiNZS4Rocrl
	5YnaMwGysiXSpuwLbyrfU+tgGMTY2G5hu9iKG4bE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M470lF002757
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:07:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:07:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:07:00 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAS028035;
	Wed, 21 Mar 2018 23:06:59 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:44 +0530
Message-ID: <1521691605-49259-9-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 8/9] gstvpe: Fix frame-copy issue with playbin
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
X-List-Received-Date: Thu, 22 Mar 2018 04:07:02 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...late-the-output-structure-with-progressiv.patch | 33 ++++++++++++++++++++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
new file mode 100644
index 0000000..3f35302
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
@@ -0,0 +1,33 @@
+From 4a8ae45e17e1e2d6299353cc871e9427617fa12d Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Tue, 20 Mar 2018 19:05:18 +0530
+Subject: [PATCH] gstvpe: Populate the output structure with progressive
+
+playbin shows performance drop with waylandsink due
+to frame-copy of frame buffers. The caps between vpe and
+videoconverter don't match hence this results in frame-copy.
+By setting the interlace-mode capabilities match and
+all components will be configured to pass through mode.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ src/gstvpe.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/gstvpe.c b/src/gstvpe.c
+index d795d4c..219e5e3 100644
+--- a/src/gstvpe.c
++++ b/src/gstvpe.c
+@@ -237,6 +237,9 @@ gst_vpe_set_output_caps (GstVpe * self)
+       "width", G_TYPE_INT, self->output_width,
+       "height", G_TYPE_INT, self->output_height, NULL);
+ 
++  gst_structure_set (out_s, "interlace-mode", G_TYPE_STRING,
++                   "progressive", NULL);
++
+   if (gst_structure_get_fraction (s, "pixel-aspect-ratio",
+           &par_width, &par_height))
+     gst_structure_set (out_s, "pixel-aspect-ratio", GST_TYPE_FRACTION,
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 00a6232..4e1543b 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.16"
+PR = "${INC_PR}.17"
 SRCREV = "4fe4beaa1498e27878bf04020aef0099c17f2262"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
+           file://0001-gstvpe-Populate-the-output-structure-with-progressiv.patch \
 "
 
 do_install_append() {
-- 
1.9.1


