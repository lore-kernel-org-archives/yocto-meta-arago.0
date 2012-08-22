Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6219352A6F
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 13:48:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MDmRTY023253
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:48:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MDmRov023491
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:48:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 08:48:27 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MDmRwd022966;	Wed, 22 Aug 2012 08:48:27 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4BU2-0001BI-HG; Wed, 22 Aug 2012 09:00:34 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 09:00:32 -0500
Message-ID: <1345644032-4498-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] matrix-gui-v4l2-demos: Add dependency to av-examples
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
X-List-Received-Date: Wed, 22 Aug 2012 13:48:28 -0000
Content-Type: text/plain

* The v4l2 demos depends on the applications that are built by av-examples.
  Adding av-examples as a RDEPENDS to reflect that dependency.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-v4l2-demos_2.0.bb            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
index 01742b5..a35467c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
@@ -4,13 +4,13 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
 S = "${WORKDIR}/git/v4l2_apps"
 
 # Make sure display submenu and app images has been installed
-RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-display"
+RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-display av-examples"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


