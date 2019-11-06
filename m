Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 31826529E2
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C712040C28;
	Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aWK0mc6pME6e; Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5AC340BF4;
	Wed,  6 Nov 2019 19:02:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B9FB3170527;
	Wed,  6 Nov 2019 14:02:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:17 -0500
Message-Id: <1573066944-48181-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573066944-48181-1-git-send-email-denys@ti.com>
References: <1573066944-48181-1-git-send-email-denys@ti.com>
Subject: [RFC][PATCH 2/9] nativesdk-packagegroup-arago-sdk-host: deprecate in favor of upstream nativesdk-packagegroup-sdk-host
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
X-List-Received-Date: Wed, 06 Nov 2019 19:03:55 -0000

Upstream nativesdk-packagegroup-sdk-host installs most host tools, but few more
that we require should be added in nativesdk-packagegroup-arago-tisdk-host

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb       |  2 +-
 .../nativesdk-packagegroup-arago-sdk-host.bb        | 21 ---------------------
 .../nativesdk-packagegroup-arago-tisdk-host.bb      |  5 ++++-
 3 files changed, 5 insertions(+), 23 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 03d18a3..ecd645c 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,4 +1,4 @@
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host"
 TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
 TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
deleted file mode 100644
index 4199c2e..0000000
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r18"
-LICENSE = "MIT"
-
-inherit packagegroup nativesdk
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-
-RDEPENDS_${PN} = "\
-    nativesdk-pkgconfig \
-    nativesdk-opkg \
-    nativesdk-libtool \
-    nativesdk-autoconf \
-    nativesdk-automake \
-    nativesdk-shadow \
-    nativesdk-makedevs \
-    nativesdk-python-distutils \
-    nativesdk-git \
-    nativesdk-cmake \
-    nativesdk-mtd-utils-ubifs \
-"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index ef54253..c24652b 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -20,6 +20,9 @@ EXTRA_TI_TOOLS = " \
 "
 
 RDEPENDS_${PN} = "\
-    nativesdk-packagegroup-arago-sdk-host \
+    nativesdk-packagegroup-sdk-host \
+    nativesdk-python-distutils \
+    nativesdk-git \
+    nativesdk-mtd-utils-ubifs \
     ${EXTRA_TI_TOOLS} \
 "
-- 
2.7.4


