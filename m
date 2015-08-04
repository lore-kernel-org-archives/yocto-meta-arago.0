Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B1C205299C
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 16:03:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74G34AU013796
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:03:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74G34ZB015410
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 11:03:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 11:03:04 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74G34co020548;
	Tue, 4 Aug 2015 11:03:04 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMegB-0005UD-Vn; Tue, 04 Aug 2015 12:03:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 12:03:02 -0400
Message-ID: <1438704182-21056-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config for ti-vip and ti-vpe
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
X-List-Received-Date: Tue, 04 Aug 2015 16:03:06 -0000
Content-Type: text/plain

* The module ti-vip and ti-vpe will use the device node /dev/video0
  and /dev/video1
* Which module gets which device node depends on the order they are
  inserted.
* The vpe gstreamer plugin has the assumption that ti-vpe is connected
  to /dev/video0
* This conf file will ensure that ti-vpe is inserted first, and gets
  node /dev/video0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf     |  1 +
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf
new file mode 100644
index 0000000..339a0c1
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf
@@ -0,0 +1 @@
+install ti-vip /sbin/modprobe ti-vpe; /sbin/modprobe --ignore-install ti-vip
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index e549b3b..73a7723 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,7 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 SRCREV = "876d28b2de5fa02d0f5fa836cba7be9a14b819eb"
 
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
+           file://ti-video.conf \
+"
+
+do_install_append() {
+    install -d ${D}/etc/modprobe.d
+    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d
+}
-- 
1.9.1


