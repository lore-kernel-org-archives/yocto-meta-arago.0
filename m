Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 27D8C52987
	for <meta-arago@arago-project.org>;
	Mon, 18 May 2015 17:27:14 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOK00BWY3592X00@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 May 2015 12:27:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=E6x6fhYN c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=u7mJTo7H_ch1cTUy-aMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 02C1A200EB;	Mon,
	18 May 2015 13:27:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 18 May 2015 13:27:07 -0400
Message-id: <1431970028-25239-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1431970028-25239-1-git-send-email-denis@denix.org>
References: <1431970028-25239-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] gcc-common: expand vardepsexclude list to fix nativesdk deps on gcc-crosssdk
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
X-List-Received-Date: Mon, 18 May 2015 17:27:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Backported from newer oe-core. This fixes nativesdk packages inadvertently
depending on gcc-crosssdk due to different TUNEs and hence forcing them all
to be rebuilt, changing their md5sums as well as messing with PR server.

(From OE-Core rev: cbc41a573dd3a073e7b862ca9d763ce815e8f927)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 2 +-
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 2 +-
 meta-arago-distro/recipes-devtools/gcc/gcc-common.inc      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 0ed8bba..1f40a0a 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-ca
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-SDKGCCVERSION ?= "4.8%"
+SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.24%"
 SDKEGLIBCVERSION ?= "2.19%"
 SDKLINUXLIBCVERSION ?= "3.14%"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 4305146..cd2d3ce 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -28,7 +28,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 
-SDKGCCVERSION ?= "4.8%"
+SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.24%"
 SDKEGLIBCVERSION ?= "2.19%"
 SDKLINUXLIBCVERSION ?= "3.14%"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
index a5daa01..fad85cd 100644
--- a/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
@@ -60,7 +60,7 @@ def get_tune_parameters(tune, d):
     retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
     return retdict
 
-get_tune_parameters[vardepsexclude] = "AVAILTUNES"
+get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEATURES BASE_LIB BASELIB TUNE_ARCH ABIEXTENSION TARGET_FPU TUNE_PKGARCH PACKAGE_EXTRA_ARCHS"
 
 DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
 
-- 
2.2.0


