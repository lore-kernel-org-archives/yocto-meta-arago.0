Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1FBA852AB9
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYhMG030216
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:43 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYhZ3012797
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:42 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOP003617;	Thu, 30 Jan 2014 12:34:41 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:14 -0600
Message-ID: <1391106857-17112-9-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] update nativesdk-linux-libc-headers version
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:44 -0000
Content-Type: text/plain

* Update the linux-libc-headers version which depends on the
  settings of SDKLINUXLIBCVERSION and LINUXLIBCVERSION

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../conf/distro/include/toolchain-gcc.inc          |    2 +-
 .../conf/distro/include/toolchain-linaro.inc       |    4 ++--
 .../conf/distro/include/tcmode-external-arago.inc  |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 28e9859..f7c8032 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.23%"
 SDKEGLIBCVERSION ?= "2.17%"
-SDKLINUXLIBCVERSION ?= "3.8%"
+SDKLINUXLIBCVERSION ?= "3.10%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index cc12f08..ba68bfd 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -31,8 +31,8 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.23%"
 SDKEGLIBCVERSION ?= "2.17%"
-SDKLINUXLIBCVERSION ?= "3.8%"
-LINUXLIBCVERSION ?= "3.8%"
+SDKLINUXLIBCVERSION ?= "3.10%"
+LINUXLIBCVERSION ?= "3.10%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
index 3ff235f..ddfee64 100644
--- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
+++ b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
@@ -38,7 +38,7 @@ GCCVERSION ?= "4.5%"
 SDKGCCVERSION ?= "4.5%"
 BINUVERSION ?= "2.20%"
 EGLIBCVERSION ?= "2.12%"
-LINUXLIBCVERSION ?= "3.8"
+LINUXLIBCVERSION ?= "3.10"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
-- 
1.7.9.5


