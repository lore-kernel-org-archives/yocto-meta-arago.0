Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 00A7A52A6D
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 15:28:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AFSUwf007112
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 10:28:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AFSTuY024469
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 10:28:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 10:28:28 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3AFSSge029502;	Fri, 10 Apr 2015 10:28:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 11:28:26 -0400
Message-ID: <1428679706-21061-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] demo-image-proc: Update to new version 1.0.0.2
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
X-List-Received-Date: Fri, 10 Apr 2015 15:28:31 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../demo-image-proc/demo-image-proc_git.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
index 60b5d17..963abbd 100644
--- a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
@@ -9,9 +9,9 @@ DEPENDS = "ti-ipc"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
-#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.01
-SRCREV = "1745725128929f6d57a3e8e8ed0ca02fe4b28b51"
-PV = "1.0.0.1"
+#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.02B
+SRCREV = "08d69947cea192328213bb91d52c43b403d3a36f"
+PV = "1.0.0.2"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


