Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CCEC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 21:55:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.2868.1655243721733220009
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 14:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=naY8MbCQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25ELtHp3109698;
	Tue, 14 Jun 2022 16:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655243717;
	bh=seyqAQpYTrsYt3GAz6NlW+wBQ0wqJ5ZmfHJpyMJwIsk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=naY8MbCQDQpZkShSmLiy9a7W8NHwqTA2aw8OObIHePzXAOFsRS+Bzp5UXGXVaokQb
	 SKcm86J5++ggndIibT3Bx/geNDA/KEsgblmvSKB6oTrdRdvTnn/zHh47liQBBr/dyW
	 Cq3mMCEiyTFrFjCSaccTl+yTCMTD2RPuO7clJcBA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25ELtHWR018333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jun 2022 16:55:17 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 16:55:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 16:55:17 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25ELtGJJ080483;
	Tue, 14 Jun 2022 16:55:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v4 2/2] optee: Upgrade to upstream 3.17.0
Date: Tue, 14 Jun 2022 16:55:15 -0500
Message-ID: <20220614215515.30820-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614215515.30820-1-afd@ti.com>
References: <20220614215515.30820-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 21:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13900

Update to the latest upstream master which is 3.17.
We do this to add HUK and AM64x/AM62x support.
With this we need to also switch OPTEEMACHINE for AM64x/AM62x.

To build against the latest OP-TEE the support recipes need updated also.
Move these here into meta-ti so that builds will still work when not using
meta-arago-distro.

The fix patches do not look to be needed anymore.

While here switch to git checkout with https.

NOTE: The latest OP-TEE requires SYSFW 8.04+

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v3:
 - Added note about SYSFW version req
 - Updated optee-os SRCREV to newer commit

Changes from v2:
 - Switch OPTEEMACHINE
 - Update optee-examples

 conf/machine/include/am62xx.inc               |  2 +-
 conf/machine/include/am64xx.inc               |  2 +-
 .../optee/optee-client_%.bbappend             |  2 ++
 .../optee/optee-examples_%.bbappend           |  2 ++
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 -------------------
 ...0007-allow-setting-sysroot-for-clang.patch | 29 ----------------
 recipes-security/optee/optee-os_%.bbappend    | 14 +++-----
 recipes-security/optee/optee-test_%.bbappend  |  5 +++
 8 files changed, 15 insertions(+), 75 deletions(-)
 create mode 100644 recipes-security/optee/optee-client_%.bbappend
 create mode 100644 recipes-security/optee/optee-examples_%.bbappend
 delete mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 recipes-security/optee/optee-test_%.bbappend

diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index ff857b97..0364edd1 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -15,5 +15,5 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
-OPTEEMACHINE = "k3-am65x"
+OPTEEMACHINE = "k3-am62x"
 OPTEEOUTPUTMACHINE = "k3"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 7646c70a..60ffacd5 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -20,7 +20,7 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
-OPTEEMACHINE = "k3-am65x"
+OPTEEMACHINE = "k3-am64x"
 OPTEEOUTPUTMACHINE = "k3"
 
 # Set the list of device targets for ti-pdk class recipes
diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..5675570a
--- /dev/null
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,2 @@
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
new file mode 100644
index 00000000..19e32d9d
--- /dev/null
+++ b/recipes-security/optee/optee-examples_%.bbappend
@@ -0,0 +1,2 @@
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index 17005396..00000000
--- a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
-for the compiler libraries as there's no easy way to reliably pass --sysroot
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
- 			-print-file-name=include 2> /dev/null)
- 
- # Get location of libgcc from gcc
--libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libgcc_eh.a 2> /dev/null)
- 
- # Define these to something to discover accidental use
diff --git a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
deleted file mode 100644
index 5c0d0a56..00000000
--- a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index 0f48c836..47465523 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
- 
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
- # libgcc for clang
--libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
- 
- # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 4e01ea74..75bd28ea 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,14 +1,8 @@
-FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "bf9dfcc22a3c26edaba666d63cfaec0c3d1c5655"
+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
-PV_ti-soc = "3.12.0+git${SRCPV}"
-
-SRCREV_ti-soc = "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
-
-SRC_URI_ti-soc = " \
-    git://github.com/OP-TEE/optee_os.git \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
+DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
new file mode 100644
index 00000000..d81ae521
--- /dev/null
+++ b/recipes-security/optee/optee-test_%.bbappend
@@ -0,0 +1,5 @@
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
+
+DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.36.1


