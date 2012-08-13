Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EDACE529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 15:48:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DFmRpK026866
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:48:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DFmRlq020301
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:48:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 10:48:26 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DFmQ13015081;	Mon, 13 Aug 2012 10:48:26 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0x0z-000219-Nf; Mon, 13 Aug 2012 10:57:13 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 10:57:07 -0500
Message-ID: <1344873428-7710-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1344873428-7710-1-git-send-email-fcooper@ti.com>
References: <1344873428-7710-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] matrix-gui-oprofile-demos: Update RDEPENDS
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
X-List-Received-Date: Mon, 13 Aug 2012 15:48:28 -0000
Content-Type: text/plain

* Replace the RDEPENDS from am-sysinfo to oprofile-example.
  The application oprofile-example use to be located within
  am-sysinfo but now is located in its own repository.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-oprofile-demos_2.0.bb        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
index e8aad0b..d3246f9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git/oprofile_apps"
 # Make sure profiling submenu and app images  has been installed
 # Include am-sysinfo because that package has the sample
 # executables for profiling.
-RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile am-sysinfo"
+RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile oprofile-example"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


