Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ABEA552A72
	for <meta-arago@arago-project.org>;
	Fri, 23 Jan 2015 03:37:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0N3bnN5025904
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:49 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0N3bm3p021993
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 21:37:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 21:37:48 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0N3bmoB021861;	Thu, 22 Jan 2015 21:37:48 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 22:37:39 -0500
Message-ID: <1421984265-11173-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/7] matrix-gui-apps: Add handling of .cgi files
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
X-List-Received-Date: Fri, 23 Jan 2015 03:37:51 -0000
Content-Type: text/plain

- .cgi files will be copied to cgi-bin  in application directory.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps.inc        |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
index 4d3b609..cba6337 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
@@ -16,7 +16,7 @@ do_install_append(){
         install -d ${D}${MATRIX_APP_DIR}/$appdir
 
         # Get the non-script files which are the matrix metadata
-        matrix_apps=`find $appdir -type f ! -name "*\.sh"`
+        matrix_apps=`find $appdir -type f ! -name "*\.sh" -or -name "*\.cgi"`
         for m in $matrix_apps
         do
             install -m 0644 ${MATRIX_FILES_DIR}/$m ${D}${MATRIX_APP_DIR}/$appdir/
@@ -32,6 +32,15 @@ do_install_append(){
             fi
             install -m 0755 ${MATRIX_FILES_DIR}/$s ${D}${bindir}/
         done
+
+        # Put the cgi files in cg-bin directory
+        matrix_cgi=`find $appdir -type f -name "*\.cgi"`
+
+        for c in $matrix_cgi
+        do
+            install -d ${D}${MATRIX_APP_DIR}/$appdir/cgi-bin
+            install -m 0755 ${MATRIX_FILES_DIR}/$c ${D}${MATRIX_APP_DIR}/$appdir/cgi-bin/
+        done
     done
 
     # Go back to the directory we started from in case there are
-- 
1.7.9.5


