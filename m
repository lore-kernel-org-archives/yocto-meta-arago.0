Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C8F7952A5F
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 15:36:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78FVvI7020913
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 10:31:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78FaZVn031270
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 10:36:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 10:36:35 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78FaW06006746;	Mon, 8 Aug 2016 10:36:35 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 11:36:25 -0400
Message-ID: <1470670585-26473-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470670585-26473-1-git-send-email-h-gou@ti.com>
References: <1470670585-26473-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-matrix: add DSP C66x image processing demos
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
X-List-Received-Date: Mon, 08 Aug 2016 15:36:37 -0000
Content-Type: text/plain

* add dsp66imgproc for dra7xx to display the video output
* add dsp66imgproc-f2f for keystone to save the video output

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 73f4b0c..cc60c8e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r57"
+PR = "r58"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -101,9 +101,14 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
+MATRIX_APPS_append_dra7xx += " \
+    matrix-multimedia-demo-dsp66imgproc \
+"
+
 MATRIX_APPS_append_keystone = " \
     matrix-gui-utility-demos    \
     matrix-mc-demo-ipc          \
+    matrix-multimedia-demo-dsp66imgproc-f2f \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.9.1


