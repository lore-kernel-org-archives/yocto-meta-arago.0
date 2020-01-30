Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 106EA52995
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 05:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B7E640A52;
	Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5yvXVQHHVlft; Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37E6A40C06;
	Thu, 30 Jan 2020 05:12:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EEC3F16FE4C;
	Thu, 30 Jan 2020 00:12:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2020 00:12:46 -0500
Message-Id: <1580361172-41124-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361172-41124-1-git-send-email-denis@denix.org>
References: <1580361172-41124-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/8] external-arm-toolchain: update linux-libc-headers to 5.4
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
X-List-Received-Date: Thu, 30 Jan 2020 05:14:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  2 +-
 .../recipes-core/meta/external-arm-toolchain.bbappend          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index b9cd55a..3ce56e3 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -51,7 +51,7 @@ SDKGCCVERSION ?= "arm-9.2%"
 SDKGDBVERSION ?= "8.3%"
 SDKBINUVERSION ?= "2.32%"
 SDKGLIBCVERSION ?= "2.30%"
-SDKLINUXLIBCVERSION ?= "4.19%"
+SDKLINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 635b13d..4a57fad 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -3,21 +3,21 @@
 # on linux-libc-headers creates circular dependencies now. Mostly
 # duplication of code from corresponding recipe.
 
-BRANCH = "ti-linux-4.19.y"
-SRCREV = "50ceb3c6e7f2d5f54d66d4999e79d3c4e09796df"
+BRANCH = "ti-linux-5.4.y"
+SRCREV = "c65c87b98f8d1b647c13b5bb36e5ffbad5805ff1"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
-PKGV_linux-libc-headers-dev = "4.19"
-PKGV_linux-libc-headers = "4.19"
+PKGV_linux-libc-headers-dev = "5.4"
+PKGV_linux-libc-headers = "5.4"
 
 inherit kernel-arch pkgconfig multilib_header
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
-DEPENDS += "bison-native"
+DEPENDS += "bison-native rsync-native"
 
 do_configure_append() {
 	cd ${WORKDIR}/git
-- 
2.7.4


