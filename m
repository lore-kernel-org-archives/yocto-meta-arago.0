Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B91D4529B0
	for <meta-arago@arago-project.org>;
	Fri, 18 Aug 2017 22:59:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7IMxTZE019462
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 17:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503097169;
	bh=Y8jsgOuvvl/GDwKkv6pLiBFn+7lLyAjADKF33AWVTwE=;
	h=From:To:CC:Subject:Date;
	b=Hi6GhOJ3TyuBzQrXuLT5XGwa3PGcs972vs1ZfkQE5RzYd+OJbQmXfMAv451PTlufY
	ZAZWsPPb6rA7VodSm1EgUsHECa3/vbHv+J9tcSwdZGfR3hxAshbat21+TRmuduRPgv
	g4L9NLxXMHhdWOx+OmTf4jTzpBQULtJx/KmsORDw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IMxT3D030595
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 17:59:29 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 17:59:29 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 17:59:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 18 Aug 2017 17:59:29 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IMxScD029624;
	Fri, 18 Aug 2017 17:59:29 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Aug 2017 18:59:24 -0400
Message-ID: <1503097164-20985-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Fri, 18 Aug 2017 22:59:30 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 change: simplify the check as suggested by Denys

 meta-arago-extras/recipes-core/matrix/matrix-gui/init       | 7 ++-----
 meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs | 7 ++-----
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb     | 2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
index 3ec0a55..5124c38 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
@@ -5,11 +5,8 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 # Important System Environment Variables
-SCRIPTS=/etc/profile.d/*.sh
-
-for f in $SCRIPTS
-do
-    source $f
+for sh in /etc/profile.d/*.sh ; do
+    [ -r "$sh" ] && . "$sh"
 done
 
 test -x "$matrixgui" || exit 0
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
index 213f859..df07c05 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
@@ -5,11 +5,8 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 # Important System Environment Variables
-SCRIPTS=/etc/profile.d/*.sh
-
-for f in $SCRIPTS
-do
-    source $f
+for sh in /etc/profile.d/*.sh ; do
+    [ -r "$sh" ] && . "$sh"
 done
 
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


