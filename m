Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E8C77B7E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:07:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.17437.1682201244799631321
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 15:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q52Ng58k;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MM7MF8077351;
	Sat, 22 Apr 2023 17:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682201242;
	bh=3vHlFNxaaTW+0NSWq5x4KYqF1SutMQUseGSzp+abM0s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=q52Ng58kIrDIEj+hLOlOUr1JpUHsWueTo1HJ1zNqW49srfmlGS6gtZFNf2FIGH+IL
	 E3E0FO62ZX0dhKOq0AC6KLfv3ZDHbEJOg9evVemma7lG8/rwhFQBRlC8jA/x3qJPD5
	 oKmf1nGlLGS6aqHF8l4xB1qwcGQWP5zTqke9Bc0Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MM7MXS108687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 17:07:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 17:07:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 17:07:22 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MM7MiN002728;
	Sat, 22 Apr 2023 17:07:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pqLO6-0002hr-Ct; Sat, 22 Apr 2023 17:07:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 1/2] ltp: Add version 20230127 from oe_core master
Date: Sat, 22 Apr 2023 17:07:21 -0500
Message-ID: <20230422220722.10360-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230422220722.10360-1-reatmon@ti.com>
References: <20230422220722.10360-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 22:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14333

This is a verbatim backport of the ltp_20230127.bb recipe and patches
from the oe-core master branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
 .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
 .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
 3 files changed, 202 insertions(+)
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb

diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 00000000..6d945700
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,35 @@
+From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+[ pvorel: rebased for 20210927 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 6537666a9..e5a091a5a 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
+ 
+ cpuset01 cpuset01
+ 
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+ 
+ thp01 thp01 -I 120
+-- 
+2.33.0
+
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
new file mode 100644
index 00000000..f25a692d
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
@@ -0,0 +1,27 @@
+This patch disables tests which we've found "hang" on our infrastructure.
+
+proc01:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/2782 (arm)
+(was trying to read /proc/kmsg, looks like a horrible test anyway)
+
+Upstream-Status: Inappropriate [OE Configuration]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/runtest/fs
+===================================================================
+--- git.orig/runtest/fs
++++ git/runtest/fs
+@@ -64,11 +64,6 @@ writetest01	writetest
+ #Also run the fs_di (Data Integrity tests)
+ fs_di fs_di -d $TMPDIR
+ 
+-# Read every file in /proc. Not likely to crash, but does enough
+-# to disturb the kernel. A good kernel latency killer too.
+-# Was not sure why it should reside in runtest/crashme and won't get tested ever
+-proc01 proc01 -m 128
+-
+ read_all_dev read_all -d /dev -p -q -r 3
+ read_all_proc read_all -d /proc -q -r 3
+ read_all_sys read_all -d /sys -q -r 3
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb b/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
new file mode 100644
index 00000000..570401ea
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
@@ -0,0 +1,140 @@
+SUMMARY = "Linux Test Project"
+DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
+HOMEPAGE = "https://linux-test-project.github.io/"
+SECTION = "console/utils"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
+    file://testcases/network/can/filter-tests/COPYING;md5=5b155ea7d7f86eae8e8832955d8b70bc \
+"
+
+DEPENDS = "attr libaio libcap acl openssl zip-native"
+DEPENDS:append:libc-musl = " fts "
+EXTRA_OEMAKE:append:libc-musl = " LIBC=musl "
+EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
+
+# since ltp contains x86-64 assembler which uses the frame-pointer register,
+# set -fomit-frame-pointer x86-64 to handle cases where optimisation
+# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
+# earlier in CFLAGS, etc.
+CFLAGS:append:x86-64 = " -fomit-frame-pointer"
+TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
+TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
+
+CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
+SRCREV = "dd2d61ac1a1e09797a6165f478abd4a9f4f43035"
+
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
+           file://0002-Remove-OOM-tests-from-runtest-mm.patch \
+           file://disable_hanging_tests.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
+# SORT_NONE in linker script which isn't supported by gold:
+# https://sourceware.org/bugzilla/show_bug.cgi?id=18097
+# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+
+# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
+# it fails with gold also a bit later when trying to use *-payload.bin
+# http://errors.yoctoproject.org/Errors/Details/663094/
+# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
+KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+export prefix = "/opt/${PN}"
+export exec_prefix = "/opt/${PN}"
+
+PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
+EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
+EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
+# ltp network/rpc test cases ftbfs when libtirpc is found
+EXTRA_OECONF += " --without-tirpc "
+
+do_compile() {
+    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}" KVM_LD="${KVM_LD}"
+}
+
+do_install(){
+    install -d ${D}${prefix}/
+    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install include-install
+
+    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
+    # as it lacks dependency on some perl moudle such as LWP::Simple
+    # And this script previously works as a tool for analyzing failures from LTP
+    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
+    # http://khack.osdl.org to retrieve ltp test results run on
+    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
+    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
+
+    # The controllers memcg_stree test seems to cause us hangs and takes 900s
+    # (maybe we expect more regular output?), anyhow, skip it
+    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
+}
+
+RDEPENDS:${PN} = "\
+    attr \
+    bash \
+    bc \
+    coreutils \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs \
+    e2fsprogs-mke2fs \
+    expect \
+    file \
+    gawk \
+    gdb \
+    gzip \
+    iproute2 \
+    ldd \
+    libaio \
+    logrotate \
+    net-tools \
+    perl \
+    python3-core \
+    procps \
+    quota \
+    unzip \
+    util-linux \
+    which \
+    tar \
+"
+
+FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
+
+# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
+INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
+INSANE_SKIP:${PN} += "already-stripped staticdev"
+
+remove_broken_musl_sources() {
+	[ "${TCLIBC}" = "musl" ] || return 0
+
+	cd ${S}
+	echo "WARNING: remove unsupported tests (until they're fixed)"
+
+	# sync with upstream
+	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
+	rm -rfv \
+		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+		testcases/kernel/syscalls/getcontext/getcontext01.c \
+		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+		testcases/kernel/syscalls/timer_create/timer_create01.c \
+		testcases/kernel/syscalls/timer_create/timer_create03.c
+}
+do_patch[postfuncs] += "remove_broken_musl_sources"
+
+# Avoid file dependency scans, as LTP checks for things that may or may not
+# exist on the running system.  For instance it has specific checks for
+# csh and ksh which are not typically part of OpenEmbedded systems (but
+# can be added via additional layers.)
+SKIP_FILEDEPS:${PN} = '1'
-- 
2.17.1


