Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8AC7E52AC0
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17NrBPQ026821
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17NrAuI015484
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 17:53:10 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t17Nr9rh028746;	Sat, 7 Feb 2015 17:53:10 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t17NqxIg010769;	Sun, 8 Feb 2015 05:23:08 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 17:52:55 -0600
Message-ID: <1423353177-8325-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423353177-8325-1-git-send-email-fcooper@ti.com>
References: <1423353177-8325-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 7/9] packagegroup-arago-tisdk-matrix: Remove dual camera and image-gallery
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:13 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Remove image gallery and dual camera since they aren't support on 3.14 kernel

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 0fe7bc5..9e00619 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 inherit packagegroup
 
@@ -77,7 +77,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)} \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
@@ -85,6 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-governor    \
     ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
 "
+# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)}
 
 MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
-- 
1.7.9.5


