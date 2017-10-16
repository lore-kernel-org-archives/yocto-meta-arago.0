Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 49E125299D
	for <meta-arago@arago-project.org>;
	Mon, 16 Oct 2017 04:56:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9G4uPhl021622
	for <meta-arago@arago-project.org>; Sun, 15 Oct 2017 23:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508129785;
	bh=J18ZL5YsEsDaaBHCvGvGONRchlJxbQv+X8/GaKY1UnQ=;
	h=From:To:CC:Subject:Date;
	b=j4vB8xTPkB84Pg7yyAE5pkTp0IegxdnuaswDWor37X0VFnCewuirwwZip0tgES6Fy
	ByIL6EhKekR7BVrv3ug2Y9DUOGRch/kzAuSgFfJBX8UUscXjBHXPEK9OErRuTUu6Hd
	B6z2zlGbP0nodUfI0cAcpRPhkDqkGdaMvIw8tLn8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9G4uPQq021001
	for <meta-arago@arago-project.org>; Sun, 15 Oct 2017 23:56:25 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Sun, 15 Oct 2017 23:56:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Sun, 15 Oct 2017 23:56:24 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9G4uNjX024049;
	Sun, 15 Oct 2017 23:56:23 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 10:26:16 +0530
Message-ID: <1508129776-2922-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] gstreamer1.0-*vpe: Update SRCREV
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
X-List-Received-Date: Mon, 16 Oct 2017 04:56:26 -0000
Content-Type: text/plain

The latest master on the gst-plugins-vpe has kernel 4.9 dependent
changes, so this breaks the VPE functionality on kernel 4.4.

This patch is a partial revert, the below fix will be part of the
recipe.
 * Change NV12 buffer to use one plane instead of two

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...gstvpe-Increase-number-of-buffers-in-pool.patch | 30 ++++++++++++++++++++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Increase-number-of-buffers-in-pool.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Increase-number-of-buffers-in-pool.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Increase-number-of-buffers-in-pool.patch
new file mode 100644
index 0000000..8ce3c67
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Increase-number-of-buffers-in-pool.patch
@@ -0,0 +1,30 @@
+From 4fe4beaa1498e27878bf04020aef0099c17f2262 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Mon, 29 May 2017 14:21:03 +0530
+Subject: [PATCH 3/3] gstvpe: Increase number of buffers in pool
+
+The number of buffers in pool calculation has been
+changed in ducati decoder as part of bug fix.
+Make the change in vpe to match the calculation.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ src/gstvpe.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gstvpe.c b/src/gstvpe.c
+index aab3af1..d795d4c 100644
+--- a/src/gstvpe.c
++++ b/src/gstvpe.c
+@@ -556,7 +556,7 @@ gst_vpe_init_input_bufs (GstVpe * self, GstCaps * input_caps)
+   if (self->num_input_buffers) {
+     min_num_input_buffers = self->num_input_buffers;
+   } else if (self->input_max_ref_frames) {
+-    min_num_input_buffers = MAX (4, self->input_max_ref_frames);
++    min_num_input_buffers = MAX (6, self->input_max_ref_frames);
+   } else {
+     min_num_input_buffers = DEFAULT_NUM_INBUFS;
+   }
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index d33b646..eedecc9 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.15"
-SRCREV = "4fe4beaa1498e27878bf04020aef0099c17f2262"
+PR = "${INC_PR}.16"
+SRCREV = "6ec1a9c9fc17e0cae781aed067a2a6f2c1f92d68"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
+           file://0001-gstvpe-Increase-number-of-buffers-in-pool.patch \
 "
 
 do_install_append() {
-- 
1.9.1


