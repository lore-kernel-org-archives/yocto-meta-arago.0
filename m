Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 89F3D52981
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 02:58:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0G2wpdM021658
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 20:58:51 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0G2wphb006979
	for <meta-arago@arago-project.org>; Thu, 15 Jan 2015 20:58:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 20:58:51 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0G2wpd2026463;	Thu, 15 Jan 2015 20:58:51 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jan 2015 21:58:48 -0500
Message-ID: <1421377128-14295-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] demo-image-proc: Add recipe for TI Image processing demo for keystone 2
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
X-List-Received-Date: Fri, 16 Jan 2015 02:58:52 -0000
Content-Type: text/plain

- Provides Binaries for Image processing demo
- Demo Plugs into Matrix gui

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../demo-image-proc/demo-image-proc_git.bb         |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
new file mode 100644
index 0000000..60b5d17
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "TI Image Processing Demo for KeyStone 2"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/image-proc.git"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=29;md5=ada2acff673fad7c53cbfd2598525f2a"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "ti-ipc"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
+#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.01
+SRCREV = "1745725128929f6d57a3e8e8ed0ca02fe4b28b51"
+PV = "1.0.0.1"
+
+S = "${WORKDIR}/git"
+
+MATRIX_BASE_DIR = "${datadir}/matrix-gui-2.0"
+MATRIX_WEB_DIR = "${MATRIX_BASE_DIR}"
+MATRIX_APP_DIR = "${MATRIX_WEB_DIR}/apps"
+MATRIX_IPD_DIR = "${MATRIX_APP_DIR}/demo_imageproc"
+MATRIX_CGI_DIR = "${MATRIX_IPD_DIR}/cgi-bin"
+
+FILES_${PN} = "${MATRIX_IPD_DIR}/demo_imageproc.html"
+FILES_${PN} += "${MATRIX_CGI_DIR}/image_processing_master.out"
+
+do_install() {
+	install -d ${D}${MATRIX_IPD_DIR}
+	install -d ${D}${MATRIX_CGI_DIR}
+	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${MATRIX_CGI_DIR}
+	install -c -m 755 ${S}/webpage/demo_imageproc.html ${D}${MATRIX_IPD_DIR}
+}
-- 
1.7.9.5


