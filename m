Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id AAC8A52A7D
	for <meta-arago@arago-project.org>;
	Fri,  6 May 2016 01:32:10 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6Q00J0MEXMA920@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 05 May 2016 20:32:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=lRxpQPx1AAAA:8
	a=FzpBgB-txtDuZA4BB98A:9
Received: by 100.15.86.14 with SMTP id 5404236c; Fri, 06 May 2016 01:32:10 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0E171161FEB;	Thu,
	5 May 2016 21:32:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 05 May 2016 21:32:09 -0400
Message-id: <1462498329-27441-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: matrix-gui-3d-demos: disable another instance of omapdrmtest dependency
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
X-List-Received-Date: Fri, 06 May 2016 01:32:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

omapdrmtest fails building against ffmpeg, which has replaced previous libav.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index f9d3f30..1e88084 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -64,7 +64,8 @@ RDEPENDS_matrix-3d-demo-vase      = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-navigation    = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-exampleui     = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-kmscube       = "${3D_DEMOS_RDEPENDS_MATRIX} kmscube"
-RDEPENDS_matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX} omapdrmtest"
+#RDEPENDS_matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX} omapdrmtest"
+RDEPENDS_matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX}"
 
 # Split the matrix files by 3d demos
 FILES_matrix-3d-demo-chameleon = "${MATRIX_APP_DIR}/3d_chameleon/*"
-- 
2.2.0


