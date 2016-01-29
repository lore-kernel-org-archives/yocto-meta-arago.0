Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C0AD35296D
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 14:35:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TEZMkq014042
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:35:22 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEZMLJ026448
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:35:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 08:35:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEZL4j003196;
	Fri, 29 Jan 2016 08:35:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPA8v-00015d-PZ; Fri, 29 Jan 2016 09:35:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 09:35:19 -0500
Message-ID: <1454078119-4150-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454078119-4150-1-git-send-email-j-stiffler@ti.com>
References: <1454078119-4150-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-matrix: Fix for matrix-gui-mc-demos split
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
X-List-Received-Date: Fri, 29 Jan 2016 14:35:23 -0000
Content-Type: text/plain

* The package "matrix-gui-mc-demos" was split into one package for
  each demo: "matrix-mc-demo-ipc" and "matrix-mc-demo-imageproc"
* Remove "matrix-gui-mc-demos" and add "matrix-mc-demo-ipc"
* Leave out "matrix-mc-demo-imageproc" as it requires updates

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 52e006b..a007f6d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r48"
+PR = "r49"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -158,8 +158,8 @@ MATRIX_APPS_append_am180x-evm = "   \
 "
 
 MATRIX_APPS_append_keystone = " \
-    matrix-gui-utility-demos	\
-    matrix-gui-mc-demos	\
+    matrix-gui-utility-demos    \
+    matrix-mc-demo-ipc          \
 "
 
 MATRIX_APPS_append_k2hk-evm = "      \
-- 
1.9.1


