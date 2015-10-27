Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ABB2852A1E
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2015 19:05:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RJ5UU0012136
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:30 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5UnL023781
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 14:05:30 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5Tbo025735;
	Tue, 27 Oct 2015 14:05:29 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zr9Yn-0000xY-J3; Tue, 27 Oct 2015 15:05:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2015 15:05:20 -0400
Message-ID: <1445972723-3625-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
References: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] packagegroup-arago-tisdk-matrix: Add opencl matrix demos
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
X-List-Received-Date: Tue, 27 Oct 2015 19:05:31 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a6d1b39..c487d46 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r45"
+PR = "r46"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -113,6 +113,11 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
+MATRIX_APPS_append_dra7xx = "        \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
+"
+
 MATRIX_APPS_append_beagleboard = "  \
     matrix-gui-display-control      \
 "
-- 
1.9.1


