Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 476B3529CF
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWt6031609
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWJ7022555
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWWh017720;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAi-0007FF-4U; Wed, 27 Jan 2016 14:54:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:28 -0500
Message-ID: <1453924469-27790-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] packagegroup-arago-tisdk-matrix: Add OpenCL matrix demos for keystone
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:33 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb    | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index fde7c8f..52e006b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r47"
+PR = "r48"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -162,6 +162,21 @@ MATRIX_APPS_append_keystone = " \
     matrix-gui-mc-demos	\
 "
 
+MATRIX_APPS_append_k2hk-evm = "      \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
+"
+
+MATRIX_APPS_append_k2l-evm = "       \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
+"
+
+MATRIX_APPS_append_k2e-evm = "       \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
+"
+
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_GUI}         \
-- 
1.9.1


