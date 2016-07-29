Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 22B0B52A87
	for <meta-arago@arago-project.org>;
	Fri, 29 Jul 2016 17:05:02 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB300JNL63TCA10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Jul 2016 12:04:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=qRy-9fwmtXAQWgijTVcA:9
Received: by 100.15.86.14 with SMTP id 2a4d72b5; Fri, 29 Jul 2016 17:04:45 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 60BA71620BD;	Fri, 29 Jul 2016 13:04:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Jul 2016 13:04:39 -0400
Message-id: <1469811879-2068-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup-*-amsdk-sdh-host: adjust for kerner src based on its suffix
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
X-List-Received-Date: Fri, 29 Jul 2016 17:05:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Kernel source packages differ between variants (production, rt, systest),
due to different configs used and potentially different source branches or
even trees used. Hence kernel source ipk uses the full name of corresponding
kernel recipe with variant encoded in the name - e.g. linux-ti-staging-rt.

"amsdk-sdk-host" packagegroup is the one that packages kernel source ipk for
the host side of the devkit. But it doesn't depend on the actual kernel itself,
so sstate can't invalidate the cache when switching variants (i.e. changing
PREFERRED_PROVIDER). When building from sources, this packagegroup always gets
rebuilt, but when built from sstate, the packagegroup for the wrong variant
can be picked up. And since kernel source ipk uses recipe name, it leads to
errors like "cannot find rt kernel sources for production build".

By naming "amsdk-sdk-host" packagegroup with the variant name (conveniently
provided by ARAGO_KERNEL_SUFFIX variable), we can force this packagegroup to
have different output for different variant and package the correct kernel
source ipk.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc      | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb          | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index c2e318a..c8afb0e 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -52,6 +52,6 @@ IMAGE_INSTALL = "\
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-amsdk-sdk-host \
+    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
     ${IMAGE_INSTALL_QT} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index c5b7ddc..8020bb8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r27"
+PR = "r28"
+
+PN = "packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.7.4


