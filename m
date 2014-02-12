Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A302E5299C
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 19:14:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CJEDc2027191
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 13:14:13 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CJED5w020985
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 13:14:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 13:14:13 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CJE4Qu018111;
	Wed, 12 Feb 2014 13:14:11 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Feb 2014 13:14:01 -0600
Message-ID: <1392232442-27754-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1392232442-27754-1-git-send-email-fcooper@ti.com>
References: <1392232442-27754-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] matrix-gui: Generate json.txt incase the file is empty
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
X-List-Received-Date: Wed, 12 Feb 2014 19:14:16 -0000
Content-Type: text/plain

* Json.txt may end up empty if the board isn't properly shutdown.
* Pull in commit that regenerates the file if it is empty.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 ++--
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 1e54444..7d47e5b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r5"
+PR = "r6"
 
-SRCREV = "ac2338295ccb4c6c2ffa58b5ad48659a5430"
+SRCREV = "8517ac2338295ccb4c6c2ffa58b5ad48659a5430"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index b96d67c..523cfe1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r15"
+PR = "r16"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit update-rc.d
 
 BRANCH ?= "master"
-SRCREV = "a67a9721134fcbf9017d2dd361079f67b10b0ace"
+SRCREV = "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://init \
-- 
1.7.0.4


