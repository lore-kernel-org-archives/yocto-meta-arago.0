Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0922A52ADC
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh28x000765
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1pP022377
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh11s012645;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006el-FE; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:56 -0500
Message-ID: <1455910978-25530-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] packagegroup-arago-tisdk-addons*: Integrate openmpacc into the SDK
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb           |  6 +++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 15 +++++++++++----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      |  6 +++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 3b97c18..a7b90fd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -33,18 +33,22 @@ UTILS_append_ti43x = " \
 
 UTILS_append_dra7xx = " \
     opencl-examples-src \
+    openmpacc-examples-src \
 "
 
 UTILS_append_k2hk-evm = " \
     opencl-examples-src \
+    openmpacc-examples-src \
 "
 
 UTILS_append_k2l-evm = " \
     opencl-examples-src \
+    openmpacc-examples-src \
 "
 
 UTILS_append_k2e-evm = " \
     opencl-examples-src \
+    openmpacc-examples-src \
 "
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 6322ee8..6931150 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -123,10 +123,17 @@ UTILS_append_dra7xx = " canutils-dev \
                         opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
+                        openmpacc-dev \
+"
+UTILS_append_k2hk-evm = " opencl-staticdev \
+                          openmpacc-dev \
+"
+UTILS_append_k2l-evm = " opencl-staticdev \
+                         openmpacc-dev \
+"
+UTILS_append_k2e-evm = " opencl-staticdev \
+                         openmpacc-dev \
 "
-UTILS_append_k2hk-evm = " opencl-staticdev"
-UTILS_append_k2l-evm = " opencl-staticdev"
-UTILS_append_k2e-evm = " opencl-staticdev"
 UTILS_append_k2g-evm = " canutils-dev"
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 3ab3bf8..8af7fcc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -105,18 +105,22 @@ EXTRA_PACKAGES = " \
 EXTRA_PACKAGES_append_dra7xx = " \
     opencl-staticdev \
     opencl-examples-dev \
+    openmpacc-examples-dev \
 "
 EXTRA_PACKAGES_append_k2hk-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
+    openmpacc-examples-dev \
 "
 EXTRA_PACKAGES_append_k2l-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
+    openmpacc-examples-dev \
 "
 EXTRA_PACKAGES_append_k2e-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
+    openmpacc-examples-dev \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


