Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8FBD65297F
	for <meta-arago@arago-project.org>;
	Fri, 18 Aug 2017 19:49:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7IJnsof013810
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 14:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503085794;
	bh=HKH+BU0v1BDsdM2sJBxNqy271OiWr4O7q/y5lIKcokc=;
	h=From:To:CC:Subject:Date;
	b=bVMrlWA1G5OOYhGAryFgtzl1tqsc0OZRAxyhaXqyUJ2pvkzexMjR273++k7rNDAvD
	adD2zgXCEI4+zUgOYfWeGqnHFWj0S/Yp9N2lbObb5BOz22WFm/b4ZbmfRF1p4Cqlep
	jOpm9k32eCBpPKWdePPqjKQwnyJWvQat04TPoyPc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IJnsF3020895
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 14:49:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 14:49:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 18 Aug 2017 14:49:53 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IJnrMe011401;
	Fri, 18 Aug 2017 14:49:53 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Aug 2017 15:49:45 -0400
Message-ID: <1503085785-9443-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Fri, 18 Aug 2017 19:49:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui/init    | 16 ++++++++++------
 .../recipes-core/matrix/matrix-gui/init.eglfs            | 14 +++++++++-----
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb  |  2 +-
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 3ec0a55..4a002d1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -5,12 +5,16 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 # Important System Environment Variables
-SCRIPTS=/etc/profile.d/*.sh
-
-for f in $SCRIPTS
-do
-    source $f
-done
+DIR=/etc/profile.d
+SCRIPTS=$DIR/*.sh
+
+if [ "$(ls -A $DIR)" ];
+then
+    for f in $SCRIPTS
+    do
+        source $f
+    done
+fi
 
 test -x "$matrixgui" || exit 0
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
index 213f859..bc93cd3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
@@ -5,12 +5,16 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 # Important System Environment Variables
-SCRIPTS=/etc/profile.d/*.sh
+DIR=/etc/profile.d
+SCRIPTS=$DIR/*.sh
 
-for f in $SCRIPTS
-do
-    source $f
-done
+if [ "$(ls -A $DIR)" ];
+then
+    for f in $SCRIPTS
+    do
+        source $f
+    done
+fi
 
 test -x "$matrixgui" || exit 0
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index aecc3be..507a98c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r31"
+PR = "r32"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.9.1


