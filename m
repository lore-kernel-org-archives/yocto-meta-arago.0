Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6A4FD52995
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2019 05:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE59440BBE;
	Thu, 13 Jun 2019 05:57:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CqniGIk__AG9; Thu, 13 Jun 2019 05:57:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94B8240A89;
	Thu, 13 Jun 2019 05:57:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8070F170108;
	Thu, 13 Jun 2019 01:57:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 13 Jun 2019 01:57:40 -0400
Message-Id: <1560405460-31220-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560405460-31220-1-git-send-email-denys@ti.com>
References: <1560405460-31220-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] packagegroup-*-gtk: fixup packagegroups
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
X-List-Received-Date: Thu, 13 Jun 2019 05:58:24 -0000

* Unify the naming
* These don't need to be machine-specific

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...o-gtk-sdk-target.bb => packagegroup-arago-tisdk-gtk-sdk-target.bb} | 4 +---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb        | 4 +---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb        | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-gtk-sdk-target.bb => packagegroup-arago-tisdk-gtk-sdk-target.bb} (75%)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
similarity index 75%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index a72e425..24db604 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Task to install Gtk dev packages in SDK"
 LICENSE = "MIT"
-PR = "r0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r1"
 
 inherit packagegroup
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index f2f76bf..d6b9326 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Task to add Gtk embedded related packages"
 LICENSE = "MIT"
-PR = "r0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r1"
 
 inherit packagegroup
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 7db6c67..03c3f47 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -28,7 +28,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_j7-evm = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
-- 
2.7.4


