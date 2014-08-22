Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DEC3352A6D
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 01:59:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7M1x658008989
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7M1x6FR023610
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 20:59:05 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7M1x5bA025612;	Thu, 21 Aug 2014 20:59:05 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7M1wqCp002753;	Fri, 22 Aug 2014 07:29:03 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Aug 2014 20:58:51 -0500
Message-ID: <1408672731-19277-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408672731-19277-1-git-send-email-fcooper@ti.com>
References: <1408672731-19277-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 9/9] packagegroup-arago-tisdk-matrix: Remove Wifi Matrix Apps
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
X-List-Received-Date: Fri, 22 Aug 2014 01:59:07 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Wifi Apps are no longer supported

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 8a2eb56..71f79e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r32"
+PR = "r33"
 
 inherit packagegroup
 
@@ -66,7 +66,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    matrix-gui-wifi-demos           \
     ts-calibrate-init \
 "
 
@@ -83,7 +82,6 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
-    matrix-gui-wifi-demos           \
     matrix-gui-pm-demos-governor    \
     ts-calibrate-init \
 "
-- 
1.7.9.5


