Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9E24B52A45
	for <meta-arago@arago-project.org>;
	Mon, 22 Apr 2013 17:27:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MHRO0Z005717
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MHROlZ030202
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:24 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 12:27:24 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MHRGHC016775;
	Mon, 22 Apr 2013 12:27:22 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Apr 2013 12:27:12 -0500
Message-ID: <1366651633-27986-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366651633-27986-1-git-send-email-fcooper@ti.com>
References: <1366651633-27986-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 3/4] matrix-gui-2.0: Fix pidfile generation
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
X-List-Received-Date: Mon, 22 Apr 2013 17:27:26 -0000
Content-Type: text/plain

From: Jeff Lance <j-lance1@ti.com>

* The Pidfile empty and did not contain the PID. The start script was using
  pidof to find the PID, but since the matrix_browser is started from a
  script file the matrix_browser PID was not yet available. Instead use -m
  option with start-stop-daemon to create the PIDFILE.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 .../recipes-core/matrix/matrix-gui/init            |    5 ++---
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 6885f41..5e1f741 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -69,14 +69,13 @@ case "$1" in
     fi
 
     echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background --exec $matrixgui -- $GUI_OPTS
-	pidof ${matrixgui} > $PIDFILE
+    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE --exec $matrixgui -- $GUI_OPTS
     echo "."
     ;;
 
   stop)
     echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-2.0.pid
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
     echo "."
     ;;
   *)
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index eb8f018..f9fe85e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r11"
+PR = "r12"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
-- 
1.7.0.4


