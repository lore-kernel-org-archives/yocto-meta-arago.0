Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 359BF5299F
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 18:43:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FIhIAb026549
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:43:18 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIhIh6002864
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:43:18 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 12:43:18 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIhIMR021765;
	Mon, 15 Feb 2016 12:43:18 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aVO7C-0000aM-0i; Mon, 15 Feb 2016 13:43:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Feb 2016 13:43:14 -0500
Message-ID: <1455561794-2206-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
References: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-addons*: Add opencv
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
X-List-Received-Date: Mon, 15 Feb 2016 18:43:20 -0000
Content-Type: text/plain

* Add opencv-apps to the filesystem addons
  (packagegroup-arago-tisdk-addons)
* Add opencv-dev to the target devkit
  (packagegroup-arago-tisdk-addons-sdk-target)

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb   | 4 +++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 6322ee8..0165c6d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -119,11 +119,13 @@ EXTRA_LIBS_append_k2e-evm = "\
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
+UTILS_append_omap-a15 = " opencv-dev"
 UTILS_append_dra7xx = " canutils-dev \
                         opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
+UTILS_append_keystone = " opencv-dev"
 UTILS_append_k2hk-evm = " opencl-staticdev"
 UTILS_append_k2l-evm = " opencl-staticdev"
 UTILS_append_k2e-evm = " opencl-staticdev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 3ab3bf8..9f941ad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -102,10 +102,16 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
 "
+EXTRA_PACKAGES_append_omap-a15 = " \
+    opencv-apps \
+"
 EXTRA_PACKAGES_append_dra7xx = " \
     opencl-staticdev \
     opencl-examples-dev \
 "
+EXTRA_PACKAGES_append_keystone = " \
+    opencv-apps \
+"
 EXTRA_PACKAGES_append_k2hk-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
-- 
1.9.1


