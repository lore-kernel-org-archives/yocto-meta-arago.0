Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1E46A52A6D
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 01:59:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7M1x5Wr029292
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7M1x5hT023597
	for <meta-arago@arago-project.org>; Thu, 21 Aug 2014 20:59:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 20:59:04 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7M1x31i016295;	Thu, 21 Aug 2014 20:59:04 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7M1wqCo002753;	Fri, 22 Aug 2014 07:29:02 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Aug 2014 20:58:50 -0500
Message-ID: <1408672731-19277-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408672731-19277-1-git-send-email-fcooper@ti.com>
References: <1408672731-19277-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 8/9] packagegroup-arago-tisdk-matrix: Add PM governor Matrix App
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
X-List-Received-Date: Fri, 22 Aug 2014 01:59:06 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 11ebb65..8a2eb56 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r31"
+PR = "r32"
 
 inherit packagegroup
 
@@ -64,6 +64,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
+    matrix-gui-pm-demos-governor    \
                                     \
     matrix-gui-wifi-demos           \
     ts-calibrate-init \
@@ -83,6 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-wifi-demos           \
+    matrix-gui-pm-demos-governor    \
     ts-calibrate-init \
 "
 
-- 
1.7.9.5


