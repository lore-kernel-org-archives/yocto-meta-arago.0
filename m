Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E10F452998
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFp0eC024122
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:00 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFp0nw010009
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:50:59 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFoujv009147;
	Mon, 25 Nov 2013 09:50:58 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:53:56 -0600
Message-ID: <1385398442-24668-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/7] qtbase: Fix runtime issues
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:01 -0000
Content-Type: text/plain

* Insure that Qt is built with touchscreen/tslib support.
* Insure that that proper display plugin is used by default.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt5/qtbase_5.1.1.bbappend           |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
index d35a948..cd935d7 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
@@ -2,9 +2,17 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG_GL = "icu linuxfb"
 
+# Enable SGX support
+DEPENDS += "${@base_contains('MACHINE_FEATURES','sgx','virtual/egl','',d)}"
+
+# Select default platform plugin
+QT_CONFIG_FLAGS += "-qpa ${@base_contains('MACHINE_FEATURES','sgx','eglfs','linuxfb',d)}"
+
+PACKAGECONFIG_DISTRO = "tslib"
+
 SRC_URI += " \
 	file://0001-qeglfswindow.cpp.patch \
 	file://0002-qeglfswindow.cpp.patch \
 "
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.7.0.4


