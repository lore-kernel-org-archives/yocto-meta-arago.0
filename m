Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8348C52A9A
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 19:19:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RJJdKA026060
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:19:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJJcV5013179
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:19:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 14:19:38 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJJcRw026562;
	Mon, 27 Apr 2015 14:19:38 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YmoZ8-0007yH-65; Mon, 27 Apr 2015 15:19:38 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Apr 2015 15:19:36 -0400
Message-ID: <1430162376-30609-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] image proc demo: remove Matrix GUI V2 apps specific installations
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
X-List-Received-Date: Mon, 27 Apr 2015 19:19:40 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

The patch removes all the Matrix GUI V2 specific image processing
apps installations from the recipe and move the master image processing
executable file to /usr/bin in the root filesystem.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../demo-image-proc/demo-image-proc_git.bb         |   18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
index 963abbd..90aabc8 100644
--- a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
@@ -15,18 +15,12 @@ PV = "1.0.0.2"
 
 S = "${WORKDIR}/git"
 
-MATRIX_BASE_DIR = "${datadir}/matrix-gui-2.0"
-MATRIX_WEB_DIR = "${MATRIX_BASE_DIR}"
-MATRIX_APP_DIR = "${MATRIX_WEB_DIR}/apps"
-MATRIX_IPD_DIR = "${MATRIX_APP_DIR}/demo_imageproc"
-MATRIX_CGI_DIR = "${MATRIX_IPD_DIR}/cgi-bin"
-
-FILES_${PN} = "${MATRIX_IPD_DIR}/demo_imageproc.html"
-FILES_${PN} += "${MATRIX_CGI_DIR}/image_processing_master.out"
+FILES_${PN} = "${bindir}/image_processing_master"
 
 do_install() {
-	install -d ${D}${MATRIX_IPD_DIR}
-	install -d ${D}${MATRIX_CGI_DIR}
-	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${MATRIX_CGI_DIR}
-	install -c -m 755 ${S}/webpage/demo_imageproc.html ${D}${MATRIX_IPD_DIR}
+	if [ ! -d ${D}/${bindir} ]
+	then
+		install -d ${D}${bindir}
+	fi
+	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${bindir}/image_processing_master
 }
-- 
1.7.9.5


