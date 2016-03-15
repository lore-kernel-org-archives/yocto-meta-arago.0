Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 53A1B52ABB
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsHn4027689
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:17 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsH2a015908
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGR9011105;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2m-0004aG-GD; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:12 -0400
Message-ID: <1458071653-17553-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 7/8] packagegroup-arago-tisdk-addons: k2hk-evm: Integrate linalg
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:19 -0000
Content-Type: text/plain

* Add linalg-examples to the filesystem
* Add linalg-dev to teh devkit
* Add linalg-examples-src to the SDK

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb          | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb        | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index a7b90fd..0306c1b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -39,6 +39,7 @@ UTILS_append_dra7xx = " \
 UTILS_append_k2hk-evm = " \
     opencl-examples-src \
     openmpacc-examples-src \
+    linalg-examples-src \
 "
 
 UTILS_append_k2l-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 6931150..062e8ce 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -127,6 +127,7 @@ UTILS_append_dra7xx = " canutils-dev \
 "
 UTILS_append_k2hk-evm = " opencl-staticdev \
                           openmpacc-dev \
+                          linalg-dev \
 "
 UTILS_append_k2l-evm = " opencl-staticdev \
                          openmpacc-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8af7fcc..dc0a927 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r42"
+PR = "r43"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -111,6 +111,7 @@ EXTRA_PACKAGES_append_k2hk-evm = " \
     opencl-staticdev \
     opencl-examples-dev \
     openmpacc-examples-dev \
+    linalg-examples \
 "
 EXTRA_PACKAGES_append_k2l-evm = " \
     opencl-staticdev \
-- 
1.9.1


