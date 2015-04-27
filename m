Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F280752A9A
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 19:20:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RJKTL3000958
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:20:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJKSMN019520
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:20:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 14:20:28 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJKRtA027182;
	Mon, 27 Apr 2015 14:20:28 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YmoZv-0007zC-L6; Mon, 27 Apr 2015 15:20:27 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Apr 2015 15:20:26 -0400
Message-ID: <1430162426-30667-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 2/2] image proc demo: update SRCREV to 1.0.0.3
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
X-List-Received-Date: Mon, 27 Apr 2015 19:20:30 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../demo-image-proc/demo-image-proc_git.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
index 90aabc8..29d87ea 100644
--- a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
@@ -9,9 +9,9 @@ DEPENDS = "ti-ipc"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
-#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.02B
-SRCREV = "08d69947cea192328213bb91d52c43b403d3a36f"
-PV = "1.0.0.2"
+#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.03
+SRCREV = "d1f4014d28ecedf34dbd20f04d4277eb1c4b8ae0"
+PV = "1.0.0.3"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


