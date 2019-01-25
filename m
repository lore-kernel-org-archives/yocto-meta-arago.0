Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0868A529E6
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2019 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85E0040B7F;
	Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nxKFwYWOhK0M; Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2390D40B5C;
	Fri, 25 Jan 2019 20:03:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 51276169B47;
	Fri, 25 Jan 2019 15:03:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2019 15:03:23 -0500
Message-Id: <1548446604-5460-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548446604-5460-1-git-send-email-denis@denix.org>
References: <1548446604-5460-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/3] meta: use dummy perl dependencies for ASSUME_PROVIDED="nativesdk-perl" to work
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
X-List-Received-Date: Fri, 25 Jan 2019 20:03:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

ASSUME_PROVIDED only covers build dependencies, while package manager will
still try to install necessary packages if they are in the dependency chain.
Since nativesdk-autoconf depends on nativesdk-perl, use dummy provider from
OE-Core with few extra nativesdk-perl-modules to satisfy package manager.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb         |  4 +++-
 .../meta/nativesdk-buildtools-perl-dummy.bbappend     | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 3ea63ec..3d827a7 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,16 +1,18 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
+TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
 TOOLCHAIN_HOST_TASK += "packagegroup-arago-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
 TOOLCHAIN_CLEANUP_PACKAGES ?= ""
 SDKIMAGE_FEATURES = "package-management"
+SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
 inherit toolchain-scripts
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r34"
+PR = "r35"
 
 XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
new file mode 100644
index 0000000..26d6ddb
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
@@ -0,0 +1,19 @@
+DUMMYPROVIDES += "\
+    nativesdk-perl-module-bytes \
+    nativesdk-perl-module-carp \
+    nativesdk-perl-module-constant \
+    nativesdk-perl-module-data-dumper \
+    nativesdk-perl-module-errno \
+    nativesdk-perl-module-exporter \
+    nativesdk-perl-module-file-basename \
+    nativesdk-perl-module-file-compare \
+    nativesdk-perl-module-file-copy \
+    nativesdk-perl-module-file-find \
+    nativesdk-perl-module-file-glob \
+    nativesdk-perl-module-file-stat \
+    nativesdk-perl-module-getopt-long \
+    nativesdk-perl-module-io-file \
+    nativesdk-perl-module-posix \
+    nativesdk-perl-module-thread-queue \
+    nativesdk-perl-module-threads \
+"
-- 
2.7.4


