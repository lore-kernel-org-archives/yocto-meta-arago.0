Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AC2E4529CF
	for <meta-arago@arago-project.org>;
	Fri, 19 Apr 2019 19:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D6FE40B81;
	Fri, 19 Apr 2019 19:09:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id q4dZkKXddZPQ; Fri, 19 Apr 2019 19:09:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0748040A3D;
	Fri, 19 Apr 2019 19:09:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 53ECB16E422;
	Fri, 19 Apr 2019 15:09:09 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 19 Apr 2019 15:09:08 -0400
Message-Id: <1555700948-43226-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] toolchain-arm: switch to building matching arm-8.3 compiler
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
X-List-Received-Date: Fri, 19 Apr 2019 19:09:34 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc             | 4 ++--
 meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 9e064af..8cab639 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -47,7 +47,7 @@ PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "arm-8.2%"
+SDKGCCVERSION ?= "arm-8.3%"
 SDKGDBVERSION ?= "8.2%"
 SDKBINUVERSION ?= "2.31%"
 SDKGLIBCVERSION ?= "2.28%"
@@ -69,7 +69,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "arm-8.2%"
+GCCVERSION ?= "arm-8.3%"
 GDBVERSION ?= "8.2%"
 BINUVERSION ?= "2.31%"
 GLIBCVERSION ?= "2.28%"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
index 1d71e03..d398ada 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
@@ -13,7 +13,7 @@ BPN = "external-arm-toolchain"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-TGT_VER_GCC = "8.2.1"
+TGT_VER_GCC = "${EAT_VER_GCC}"
 
 do_install() {
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${TGT_VER_GCC}/include/
-- 
2.7.4


