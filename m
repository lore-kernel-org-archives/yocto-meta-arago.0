Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27689C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 20:49:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.57097.1681159741658904112
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 13:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rAY1xwX2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AKn05B053375;
	Mon, 10 Apr 2023 15:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681159740;
	bh=SBvrHf14c/RN4mTFG84GHzFw1xamlOUNqCpkaOK483I=;
	h=From:To:CC:Subject:Date;
	b=rAY1xwX2mO2yV+vl4CZvNKRRxLygVmbBCB9505ZDpt/coQ2xOy/qcNrbgmLHE4EU2
	 IUcw6MwonnAWDwuR5dnWlFZFxcf3Q81vEPc0ya/Itpj6YtF/FrLOcAj8Ui7xvVBspE
	 /J5EtI8RgH+B5AMKTDiTBCerZUjut0RC1sOubVLw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AKn0nA059024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 15:49:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 15:49:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 15:49:00 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AKmxSv033246;
	Mon, 10 Apr 2023 15:49:00 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] linux-libc-headers: Remove custom Linux libc headers
Date: Mon, 10 Apr 2023 15:48:59 -0500
Message-ID: <20230410204859.30707-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 20:49:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14304

We do not need nor want a custom libc as the base for our packages.
Using our own Linux UAPI includes creates this situation and will
cause issues for packages that make use of the custom kernel headers
when moving from kernel to kernel.

If we do have some package that does need some custom header then
it should be listed in the package itself so this dependency can
be tracked correct. This is all described in the base recipe here[0].

As recommended, let's not create a custom linux-libc-headers. Remove
this recipe and references to specific versions.

[0] https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#n7

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/toolchain-gcc.inc     |  4 ----
 .../linux-libc-headers_5.10.bb                | 20 -------------------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 5570594d..1c059a6f 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -16,7 +16,6 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "11%"
 SDKBINUVERSION ?= "2.38%"
 SDKGLIBCVERSION ?= "2.35%"
-SDKLINUXLIBCVERSION ?= "5.10%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -25,7 +24,6 @@ PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
@@ -35,11 +33,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 GCCVERSION ?= "11%"
 BINUVERSION ?= "2.38%"
 GLIBCVERSION ?= "2.35%"
-LINUXLIBCVERSION ?= "5.10%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
deleted file mode 100644
index 43493570..00000000
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
-
-PR:append = ".arago0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-BRANCH = "ti-linux-5.10.y"
-SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
-
-KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "https"
-SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-# below overrides the multilib list - can be dropped for the next LTS
-do_install_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
-	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
-}
-- 
2.39.2


