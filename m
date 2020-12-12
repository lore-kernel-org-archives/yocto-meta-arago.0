Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 98925529D4
	for <meta-arago@arago-project.org>;
	Sat, 12 Dec 2020 04:18:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BC4IEKS104580
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 22:18:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607746694;
	bh=Vi9On7upfIEcZR/WImO9LtyTKvjZd6BUSG9sJ7Ll6SQ=;
	h=From:To:CC:Subject:Date;
	b=PWtnpxZinUIVurMb2ktGCXXj9L9Hr6e7/q3MZgbPlTVE5KX5e9NHP/7VJ3m3FDLpV
	pEvgMf+RuT6RufIBWDNk1R8ZRYW8NRIAZfZdkea8EcybW+R7PsrkLwJqq427cZfj63
	VER6LkKDukj+wleTf6tSTJBrN/POm2KvJQJDG2vE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BC4IDjJ029554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 22:18:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 11 Dec 2020 22:18:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 11 Dec 2020 22:18:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BC4IDWU000938;
	Fri, 11 Dec 2020 22:18:13 -0600
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
Date: Fri, 11 Dec 2020 22:18:13 -0600
Message-ID: <20201212041813.16398-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell PATCH] optee-os: update recipe to pick 3.11
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
X-List-Received-Date: Sat, 12 Dec 2020 04:18:20 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

meta-arm where the optee-os_git.bb recipe is present,
still is on 3.8 version on dunfell branch.

This patch is to upgrade SRCREV to pick 3.11 from
repo: ti-optee-os.git
branch: ti-optee-os

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...ide-empty-__getauxval-implementation.patch | 62 +++++++++++++++++++
 ...t-support-for-libnames-after-libgcc-.patch | 55 ++++++++++++++++
 ...ke-sure-that-libutils-is-linked-seco.patch | 44 +++++++++++++
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 ++++++++++
 ...0007-allow-setting-sysroot-for-clang.patch | 29 +++++++++
 .../optee/optee-os_git.bbappend               | 13 +++-
 6 files changed, 235 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch

diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
new file mode 100644
index 00000000..0120f5c2
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Tue, 13 Oct 2020 22:45:39 +0300
+Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementation
+
+Never version of libgcc are built with LSE implementation in mind. To
+determine if LSE is available on platform it calls __getauxval(), so in
+some cases we can get undefined reference to __getauxval() error.
+
+Prominent case is libgcc_eh.a library, which is used by C++ TAs. Exception
+handler depends on atomic operations, so it tries to call
+init_have_lse_atomics() first. This function in turn calls __getauxval(),
+which causes linking error.
+
+In the future we can make __getauxval() to return actual platform
+capabilities.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
+ lib/libutils/ext/arch/arm/sub.mk   |  1 +
+ 2 files changed, 13 insertions(+)
+ create mode 100644 lib/libutils/ext/arch/arm/auxval.c
+
+diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/arch/arm/auxval.c
+new file mode 100644
+index 00000000..98bca850
+--- /dev/null
++++ b/lib/libutils/ext/arch/arm/auxval.c
+@@ -0,0 +1,12 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2020, EPAM Systems
++ */
++
++#include <compiler.h>
++
++unsigned long int __getauxval (unsigned long int type);
++unsigned long int __getauxval (unsigned long int type __unused)
++{
++	return 0;
++}
+diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch/arm/sub.mk
+index dc5eed67..2e779066 100644
+--- a/lib/libutils/ext/arch/arm/sub.mk
++++ b/lib/libutils/ext/arch/arm/sub.mk
+@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) += aeabi_unwind.c
+ endif
+ srcs-$(CFG_ARM32_$(sm)) += atomic_a32.S
+ srcs-$(CFG_ARM64_$(sm)) += atomic_a64.S
++srcs-y += auxval.c
+ ifneq ($(sm),ldelf) # TA, core
+ srcs-$(CFG_ARM32_$(sm)) += mcount_a32.S
+ srcs-$(CFG_ARM64_$(sm)) += mcount_a64.S
+-- 
+2.25.1
+
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch b/meta-arago-distro/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
new file mode 100644
index 00000000..11296c8c
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Tue, 13 Oct 2020 22:54:13 +0300
+Subject: [PATCH 2/3] link.mk: implement support for libnames-after-libgcc
+ variable
+
+Newer versions of libgcc depend on external __getauxval() symbol, which is
+now provided by libutils. But libgcc is linked after libutils, so linker
+can't resolve that symbol. We can't include libgcc into linking group with
+libtutils, because libgcc provides symbols that conflict with libutil's
+ones, like __aeabi_idiv with friends for instance.
+
+So, to resolve libgcc dependency on libutils we need to link with libutils
+second time. To make things more generic, we will introduce
+$(libnames-after-libgcc) variable for libraries that should be linked after
+libgcc.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ ta/arch/arm/link.mk | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
+index 445c285d..3025acb1 100644
+--- a/ta/arch/arm/link.mk
++++ b/ta/arch/arm/link.mk
+@@ -55,8 +55,11 @@ link-ldflags += --eh-frame-hdr
+ link-ldadd += $(libstdc++$(sm)) $(libgcc_eh$(sm))
+ endif
+ link-ldadd += --end-group
+-ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) $(libgcc$(sm))
+ 
++link-ldadd-after-libgcc += $(addprefix -l,$(libnames-after-libgcc))
++
++ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) \
++				$(libgcc$(sm)) $(link-ldadd-after-libgcc)
+ 
+ link-script-cppflags-$(sm) := \
+ 	$(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
+@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-file) $(link-script-pp-makefi
+ 		$(link-script-cppflags-$(sm)) $$< -o $$@
+ 
+ $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
++					  $(libdeps-after-libgcc) \
+ 					  $(link-script-pp$(sm)) \
+ 					  $(dynlistdep) \
+ 					  $(additional-link-deps)
+-- 
+2.25.1
+
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch b/meta-arago-distro/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
new file mode 100644
index 00000000..88ba5f85
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Fri, 16 Oct 2020 16:36:08 +0300
+Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked second
+ time
+
+libgcc depends on __getauxval symbol from libuils. As, generally libutils
+is linked before libgcc, we will get "unresolved symbol" error. To resolve
+this dependency we need to link libutils second time - after libgcc.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ ta/mk/ta_dev_kit.mk | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
+index e28be677..d0e66317 100644
+--- a/ta/mk/ta_dev_kit.mk
++++ b/ta/mk/ta_dev_kit.mk
+@@ -78,6 +78,16 @@ endif
+ libnames += dl
+ libdeps += $(ta-dev-kit-dir$(sm))/lib/libdl.a
+ 
++# libutils provides __getauxval symbol which is needed by libgcc 10.x. We can't
++# link libutils after libgcc, because libgcc will replace some symbols provided
++# by libutils, which will cause further linking issues.
++#
++# But if we place libutils before libgcc, linker will not be able to resolve
++# __getauxval. So we need to link with libutils twice: before and after libgcc.
++# Hence it included both in $(libnames) and in $(libnames-after-libgcc)
++libnames-after-libgcc += utils
++libdeps-after-libgcc += $(ta-dev-kit-dir$(sm))/lib/libutils.a
++
+ # Pass config variable (CFG_) from conf.mk on the command line
+ cppflags$(sm) += $(strip \
+ 	$(foreach var, $(filter CFG_%,$(.VARIABLES)), \
+-- 
+2.25.1
+
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..17005396
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,34 @@
+From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries as there's no easy way to reliably pass --sysroot
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libgcc_eh.a 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
new file mode 100644
index 00000000..5c0d0a56
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
@@ -0,0 +1,29 @@
+From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index 0f48c836..47465523 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
+ 
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
+ # libgcc for clang
+-libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
+ 
+ # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 677c6dd0..e5708f3e 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,7 +1,16 @@
 PR_append = ".arago0"
 
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
+
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
-           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+	   file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+	   file://0007-allow-setting-sysroot-for-clang.patch \
+	   file://0001-libutils-provide-empty-__getauxval-implementation.patch \
+	   file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch \
+	   file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch \
 "
+
+PV = "3.11"
 BRANCH = "ti-optee-os"
-SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
+SRCREV = "36905c9566936f7502e3741b48015c1f147b3bd3"
-- 
2.17.1


