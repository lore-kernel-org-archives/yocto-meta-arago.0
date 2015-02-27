Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 042B1529A7
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 14:39:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1REdGPN018520
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 08:39:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1REdFgP016174
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 08:39:15 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 08:39:14 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1REdE9m001129;
	Fri, 27 Feb 2015 08:39:14 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YRM4Q-0003IO-HQ;
	Fri, 27 Feb 2015 09:39:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Feb 2015 09:39:10 -0500
Message-ID: <1425047950-12638-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] image-gallery: Fix installation of matrix files.
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
X-List-Received-Date: Fri, 27 Feb 2015 14:39:17 -0000
Content-Type: text/plain

* matrix-files directory is not present in the build directory,
  so prefix with ${S}.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-qt/qt-apps/image-gallery_git.bb        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
index 6514df4..72c9389 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
@@ -8,7 +8,7 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
 SRCREV = "1f89d5e6c160e87e73a9c06933e50c3981bbf41d"
@@ -21,7 +21,7 @@ do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${B}/image-gallery ${D}/${bindir}/image-gallery
 	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
-	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
+	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
 }
 
 PACKAGES += "matrix-gui-apps-image-gallery"
-- 
1.7.9.5


