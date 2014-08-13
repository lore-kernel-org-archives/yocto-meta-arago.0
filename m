Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 916F352981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:46:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJkNj4021320
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJkNe3002346
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:46:23 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7DJkMWM005410;	Wed, 13 Aug 2014 14:46:23 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7DJkFTu012731;	Thu, 14 Aug 2014 01:16:21 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Aug 2014 14:46:11 -0500
Message-ID: <1407959172-16985-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407959172-16985-1-git-send-email-fcooper@ti.com>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/6] arago-qt4: Add global environment variable script
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
X-List-Received-Date: Wed, 13 Aug 2014 19:46:24 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* There are important Qt environment variables that needs to be set and those
  variables are only being set within Matrix's init script.
* This causes problems when your trying to manually run a Qt application
  outside of Matrix since you need to manually export the proper Qt specific
  environment variables again.
* Override the default qte.sh to add additional Arago specific Qt env variables
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc |    3 ++-
 meta-arago-distro/recipes-qt/qt4/files/qte.sh  |   11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/files/qte.sh

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index 715092e..0f5e117 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,7 +1,7 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago5"
+PR := "${PR}-arago7"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
@@ -16,4 +16,5 @@ LICENSE = "LGPLv2.1"
 
 SRC_URI += "file://0001-PATCH-make-demos-maximized-for-TISDK-use.patch \
             file://0002-qwslock-messages.patch \
+            file://qte.sh \
 "
diff --git a/meta-arago-distro/recipes-qt/qt4/files/qte.sh b/meta-arago-distro/recipes-qt/qt4/files/qte.sh
new file mode 100644
index 0000000..3d656f3
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/files/qte.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+### QT Environment Variables ###
+export QWS_MOUSE_PROTO=Auto
+
+
+# Set the QWS_MOUSE_PROTO for touchscreen if it exists
+if [ -e /dev/input/touchscreen0 ]
+then
+    export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+fi
-- 
1.7.9.5


