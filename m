Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C879C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 20:58:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.748.1741899521623339655
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 13:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H0nWj9Fo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DKwehY1490250
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 15:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741899520;
	bh=yiJwpSGUrbsFA0PUvQp93kKdN/lcQcomhRu+z2BVBxQ=;
	h=From:To:CC:Subject:Date;
	b=H0nWj9FolApAseI0mvgjHF+WIqq75GRrLaIOHpgWfkGZujmLQMWeLVV8mt9LnUDFc
	 2fcEccLIrlb0BzkbXX5tothXsExru4P7caEHIJNPvmmFcWw0YsL3ubzN/8VnF1PNuY
	 x0CZ9gDyARCh6PNI4l+jB5fSuJwVdBth2kjPNaFU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DKwefT115606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 15:58:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 15:58:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 15:58:39 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DKwdig087118;
	Thu, 13 Mar 2025 15:58:39 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] liboil: Remove this recipe
Date: Thu, 13 Mar 2025 15:58:38 -0500
Message-ID: <20250313205838.147197-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 20:58:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16048

This was added from meta-oe to deal with a dependency version mismatch
for gstreamer. This has not been needed for years. In fact, liboil was
removed from meta-oe with the message that it "was replaced by orc 10
years ago", and that message is now 5 years ago.. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../0001-Fix-enable-vfp-flag.patch            |  41 ----
 .../fix-unaligned-whitelist.patch             |  19 --
 .../liboil-0.3.17/liboil_fix_for_x32.patch    | 222 ------------------
 .../liboil/liboil-0.3.17/no-tests.patch       |  24 --
 .../recipes-support/liboil/liboil_0.3.17.bb   |  27 ---
 5 files changed, 333 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
 delete mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
 delete mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
 delete mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/no-tests.patch
 delete mode 100644 meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb

diff --git a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
deleted file mode 100644
index aff1cb18..00000000
--- a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
-From: David Schleef <ds@schleef.org>
-Date: Fri, 8 Apr 2011 10:05:49 -0700
-Subject: [PATCH 10/10] Fix --enable-vfp flag
-
-Patch from Christophe Lyon, fixes #36084.
----
- configure.ac           |    4 ++--
- liboil/arm/Makefile.am |    1 +
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 98c81fb..407d88c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,8 +188,8 @@ fi
- AC_ARG_ENABLE(vfp,
-   AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
-   enable_vfp=$enableval,enable_vfp=yes)
--if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
--  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
-+if test "x$enable_vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
-+  AS_COMPILER_FLAG(["-mfpu=vfp"],
-     [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
-     true)
-   #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
-diff --git a/liboil/arm/Makefile.am b/liboil/arm/Makefile.am
-index ead08ed..cd8d9fa 100644
---- a/liboil/arm/Makefile.am
-+++ b/liboil/arm/Makefile.am
-@@ -6,4 +6,5 @@ libarm_la_SOURCES = \
- 	math_vfp_asm.S
- 
- libarm_la_CFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
-+libarm_la_CCASFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
- 
--- 
-1.7.6
-
diff --git a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
deleted file mode 100644
index c8e3c1f7..00000000
--- a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream: https://bugs.freedesktop.org/show_bug.cgi?id=31358
-
-configure: fix whitelisting of x86_64 unaligned memory access
-
-Fix typo in whitelist so cross-compile works for x86_64.
-
-Upstream-Status: Inappropriate [configuration]
-
---- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
-+++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
-@@ -9,7 +9,7 @@
-         _AS_ECHO_N([(blacklisted) ])
-         as_cv_unaligned_access=no
- 	;;
--      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
-+      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
-         _AS_ECHO_N([(whitelisted) ])
-         as_cv_unaligned_access=yes
- 	;;
diff --git a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch b/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
deleted file mode 100644
index 473380e9..00000000
--- a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Upstream-Status: Pending
-
-Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/01
-
-
-Index: liboil-0.3.17/liboil/amd64/wavelet.c
-===================================================================
---- liboil-0.3.17.orig/liboil/amd64/wavelet.c
-+++ liboil-0.3.17/liboil/amd64/wavelet.c
-@@ -21,14 +21,14 @@ deinterleave2_asm (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  sub $2, %%rcx\n"
-       "1:\n"
--      "  movw (%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%0,%%rcx,2)\n"
--      "  movw 2(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%2,%%rcx,2)\n"
--      "  movw 4(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%0,%%rcx,2)\n"
--      "  movw 6(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%2,%%rcx,2)\n"
-+      "  movw (%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q0,%%rcx,2)\n"
-+      "  movw 2(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q2,%%rcx,2)\n"
-+      "  movw 4(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q0,%%rcx,2)\n"
-+      "  movw 6(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q2,%%rcx,2)\n"
-       "  sub $2, %%rcx\n"
-       "  jge 1b\n"
-       : "+r" (d1), "+r" (s_2xn), "+r" (d2), "+c" (n)
-@@ -53,20 +53,20 @@ deinterleave2_mmx (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  pslld $16, %%mm0\n"
-       "  pslld $16, %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -93,10 +93,10 @@ deinterleave2_mmx_2 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  pshufw $0xd8, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%0,%%rcx,2)\n"
--      "  pshufw $0x8d, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%2,%%rcx,2)\n"
-+      "  pshufw $0xd8, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q0,%%rcx,2)\n"
-+      "  pshufw $0x8d, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q2,%%rcx,2)\n"
-       "  add $2, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -123,16 +123,16 @@ deinterleave2_mmx_3 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
--      "  movq (%1,%%rcx,4), %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm2\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "  punpckhwd %%mm0, %%mm2\n"
-       "  movq %%mm1, %%mm0\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "  punpckhwd %%mm2, %%mm1\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -159,26 +159,26 @@ deinterleave2_mmx_4 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-       "  movq %%mm1, %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
--      "   movq 16(%1,%%rcx,4), %%mm5\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-+      "   movq 16(%q1,%%rcx,4), %%mm5\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "   movq %%mm5, %%mm6\n"
-       "  punpckhwd %%mm0, %%mm2\n"
--      "   movq 24(%1,%%rcx,4), %%mm4\n"
-+      "   movq 24(%q1,%%rcx,4), %%mm4\n"
-       "  movq %%mm1, %%mm0\n"
-       "   punpcklwd %%mm4, %%mm5\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "   punpckhwd %%mm4, %%mm6\n"
-       "  punpckhwd %%mm2, %%mm1\n"
-       "   movq %%mm5, %%mm4\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "   punpcklwd %%mm6, %%mm4\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "   punpckhwd %%mm6, %%mm5\n"
--      "   movq %%mm4, 8(%0,%%rcx,2)\n"
--      "   movq %%mm5, 8(%2,%%rcx,2)\n"
-+      "   movq %%mm4, 8(%q0,%%rcx,2)\n"
-+      "   movq %%mm5, 8(%q2,%%rcx,2)\n"
-       "  add $8, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -252,13 +252,13 @@ interleave2_mmx (int16_t *d_2xn, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-       "  movq %%mm0, %%mm2\n"
-       "  punpckhwd %%mm1, %%mm0\n"
-       "  punpcklwd %%mm1, %%mm2\n"
--      "  movq %%mm2, (%0,%%rcx,4)\n"
--      "  movq %%mm0, 8(%0,%%rcx,4)\n"
-+      "  movq %%mm2, (%q0,%%rcx,4)\n"
-+      "  movq %%mm0, 8(%q0,%%rcx,4)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -285,12 +285,12 @@ lift_add_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -317,13 +317,13 @@ lift_sub_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -350,12 +350,12 @@ lift_add_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -382,13 +382,13 @@ lift_sub_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
diff --git a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/no-tests.patch b/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/no-tests.patch
deleted file mode 100644
index 892d4413..00000000
--- a/meta-arago-extras/recipes-support/liboil/liboil-0.3.17/no-tests.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
---- liboil-0.3.9/liboil/liboilfunction.c.old	2006-09-18 13:03:20.000000000 +0100
-+++ liboil-0.3.9/liboil/liboilfunction.c	2006-09-18 13:04:10.000000000 +0100
-@@ -345,7 +345,9 @@
-     return;
-   }
- 
--  test = oil_test_new (klass);
-+  klass->chosen_impl = klass->reference_impl;
-+  klass->func = klass->reference_impl->func;
-+/*  test = oil_test_new (klass);
-   if (test == NULL) {
-     OIL_ERROR ("failed to test function class %s", klass->name);
-     return;
-@@ -385,7 +387,7 @@
-   klass->chosen_impl = min_impl;
-   klass->func = min_impl->func;
- 
--  oil_test_free (test);
-+  oil_test_free (test);*/
- }
- 
- static void
diff --git a/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb b/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb
deleted file mode 100644
index a9fb1098..00000000
--- a/meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Library of simple functions optimized for various CPUs"
-HOMEPAGE = "http://liboil.freedesktop.org/"
-BUGTRACKER = "https://bugs.freedesktop.org/"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
-                    file://liboil/liboil.h;endline=28;md5=95c794a66b88800d949fed17e437d9fb \
-                    file://liboil/liboilcpu.c;endline=28;md5=89da69a61d88eedcba066f42353fb75a \
-                    file://examples/example1.c;endline=29;md5=9d4dad9fcbbdf0441ee063f8af5170c9 \
-                    file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
-
-DEPENDS = "glib-2.0"
-PR = "r5"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
-           file://no-tests.patch \
-           file://fix-unaligned-whitelist.patch \
-           file://0001-Fix-enable-vfp-flag.patch \
-           file://liboil_fix_for_x32.patch \
-          "
-
-SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69"
-
-inherit autotools pkgconfig
-
-ARM_INSTRUCTION_SET = "arm"
-- 
2.39.2


