Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92921C021BC
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 19:25:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.98482.1740425099473647640
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 11:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DzEB7gqc;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OJOw8t1007314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:24:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740425098;
	bh=Hu8IAyP2ZYOQbWF+hDU2G9865fDTn5K0PzxcByKB/KY=;
	h=From:To:Subject:Date;
	b=DzEB7gqcuSQcwskkW1EKLQ5mR32ejCyoFTu4s/qUiuwfSd4ImsRXkFBeWeEuLKNDe
	 S/1b6+tAGNZEinPZegWhcIW8ybJ//UcGx9s6IdwmLP9t43zsvk6SaCHmCgCA/ltaoJ
	 Wwqt/ztXvwOcLavSUiCZXfewlAD5Bc+dCCPwmPoU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OJOwv4007355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 13:24:58 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 13:24:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 13:24:58 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OJOwUs121416;
	Mon, 24 Feb 2025 13:24:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tme4Y-00078i-1v; Mon, 24 Feb 2025 13:24:58 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Remove version 20240129
Date: Mon, 24 Feb 2025 13:24:58 -0600
Message-ID: <20250224192458.27402-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Feb 2025 19:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15907

Now that we have moved to the 20250130 version we no longer need to
carry the previous version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ltp-ddt/ltp-ddt_20240129.bb               |  44 ------
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  35 -----
 ...rio_groups-default-remove-connectors.patch |  34 ----
 ...-Use-time_t-instead-of-long-for-type.patch |  54 -------
 .../recipes-extended/ltp/ltp_20240129.bb      | 146 ------------------
 5 files changed, 313 deletions(-)
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
 delete mode 100644 meta-arago-test/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
 delete mode 100644 meta-arago-test/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
 delete mode 100644 meta-arago-test/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
 delete mode 100644 meta-arago-test/recipes-extended/ltp/ltp_20240129.bb

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
deleted file mode 100644
index 528db999..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
-FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
-
-require recipes-extended/ltp/ltp_${PV}.bb
-
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
-
-PROVIDES += "ltp"
-
-DEPENDS += "alsa-lib"
-
-PE = "1"
-PR = "r1"
-PV:append = "+git"
-
-SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
-BRANCH ?= "master"
-
-SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
-
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
-
-EXTRA_OEMAKE:append = " \
-    KERNEL_USR_INC=${WORKDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-"
-
-RDEPENDS:${PN} += "\
-    acl \
-    at \
-    pm-qa \
-    serialcheck \
-    memtester \
-"
-
-do_install:prepend() {
-	# Upstream ltp recipe wants to remove this test case in do_install
-	install -d ${D}${prefix}/runtest/
-	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
-}
diff --git a/meta-arago-test/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-test/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
deleted file mode 100644
index cc980796..00000000
--- a/meta-arago-test/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
-From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
-Date: Wed, 29 Jul 2020 08:47:09 -0400
-Subject: [PATCH] Remove OOM tests from runtest/mm
-
-Disable OOM tests, as they might cause oeqa ssh connection lost
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-[ pvorel: rebased for 20210927 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- runtest/mm | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/runtest/mm b/runtest/mm
-index d859b331c..3c2962f44 100644
---- a/runtest/mm
-+++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm07 ksm07
- 
- cpuset01 cpuset01
- 
--oom01 oom01
--oom02 oom02
--oom03 oom03
--oom04 oom04
--oom05 oom05
--
- swapping01 swapping01 -i 5
- 
- thp01 thp01 -I 120
--- 
-2.43.0
-
diff --git a/meta-arago-test/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch b/meta-arago-test/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
deleted file mode 100644
index 4a50d1ae..00000000
--- a/meta-arago-test/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 14c710cae38aa96bd8d681e891b6a1d691f99988 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Thu, 14 Mar 2024 09:47:10 +0800
-Subject: [PATCH] scenario_groups/default: remove connectors
-
-runtest/connectors was removed in 9b642d89c, thus update scenario_groups/default.
-
-Fixes: 9b642d89c ("runtest: Merge runtest/connectors to kernel_misc")
-Closes: https://github.com/linux-test-project/ltp/pull/1144
-
-Upstream-Status: Backport from
-[https://github.com/linux-test-project/ltp/commit/14c710ca]
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- scenario_groups/default | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scenario_groups/default b/scenario_groups/default
-index f17b2061a..ec77d8fb8 100644
---- a/scenario_groups/default
-+++ b/scenario_groups/default
-@@ -16,7 +16,6 @@ controllers
- filecaps
- cap_bounds
- fcntl-locktests
--connectors
- power_management_tests
- hugetlb
- commands
--- 
-2.34.1
-
diff --git a/meta-arago-test/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta-arago-test/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
deleted file mode 100644
index ae8dc870..00000000
--- a/meta-arago-test/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 May 2024 11:43:20 -0700
-Subject: [PATCH] sched_stress: Use time_t instead of long for type
-
-This ensures it works across different architectures
-Fixes
-
-| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
-|   744 |         printf("\nend time = %s\n", ctime(&end_time));
-|       |                                           ^~~~~~~~~
-
-With gcc-14
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/0a682f1af42d8d261202821be580fe26d17ee9b7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
-index 61573d788..5b8c187fe 100644
---- a/testcases/kernel/sched/sched_stress/sched_driver.c
-+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
-@@ -136,7 +136,7 @@ int debug = 0;
- /*
-  * Function prototypes
-  */
--void startup(long);
-+void startup(time_t);
- int start_testcase(char *, char *, char *, char *, char *, char *);
- int process_slots_in_use();
- int available_user_process_slots();
-@@ -251,7 +251,7 @@ int main(int argc, char **argv)
-  * information to the screen and .  It also initializes the	 *
-  * process id list and other global variables.	 			 *
-  *-----------------------------------------------------------------------*/
--void startup(long start_time)
-+void startup(time_t start_time)
- {
- 	char tempbuffer[50];	/* temporary buffer to hold names */
- 
-@@ -734,7 +734,7 @@ void kill_short_term_testcases()
- void finishup(start_time)
- long start_time;		/* starting time to calculate elapsed time */
- {
--	long end_time;		/* time when program finished */
-+	time_t end_time;		/* time when program finished */
- 
- 	/*
- 	 * Get the end time and calculate elapsed time; write all this out
--- 
-2.45.0
-
diff --git a/meta-arago-test/recipes-extended/ltp/ltp_20240129.bb b/meta-arago-test/recipes-extended/ltp/ltp_20240129.bb
deleted file mode 100644
index f8e6d398..00000000
--- a/meta-arago-test/recipes-extended/ltp/ltp_20240129.bb
+++ /dev/null
@@ -1,146 +0,0 @@
-SUMMARY = "Linux Test Project"
-DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
-HOMEPAGE = "https://linux-test-project.github.io/"
-SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
-    file://testcases/network/can/filter-tests/COPYING;md5=5b155ea7d7f86eae8e8832955d8b70bc \
-"
-
-DEPENDS = "attr libaio libcap acl openssl zip-native"
-DEPENDS:append:libc-musl = " fts "
-EXTRA_OEMAKE:append:libc-musl = " LIBC=musl "
-EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
-
-# since ltp contains x86-64 assembler which uses the frame-pointer register,
-# set -fomit-frame-pointer x86-64 to handle cases where optimisation
-# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
-# earlier in CFLAGS, etc.
-CFLAGS:append:x86-64 = " -fomit-frame-pointer"
-TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
-TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
-
-CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
-CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
-
-SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
-           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-scenario_groups-default-remove-connectors.patch \
-           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig
-
-# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
-# SORT_NONE in linker script which isn't supported by gold:
-# https://sourceware.org/bugzilla/show_bug.cgi?id=18097
-# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
-
-# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
-# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
-# it fails with gold also a bit later when trying to use *-payload.bin
-# http://errors.yoctoproject.org/Errors/Details/663094/
-# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-export prefix = "/opt/${PN}"
-export exec_prefix = "/opt/${PN}"
-
-PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
-EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF += " --without-tirpc "
-
-do_compile() {
-    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}" KVM_LD="${KVM_LD}"
-}
-
-do_install(){
-    install -d ${D}${prefix}/
-    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install include-install
-
-    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
-    # as it lacks dependency on some perl moudle such as LWP::Simple
-    # And this script previously works as a tool for analyzing failures from LTP
-    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
-    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
-
-    # The controllers memcg_stree test seems to cause us hangs and takes 900s
-    # (maybe we expect more regular output?), anyhow, skip it
-    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
-}
-
-RDEPENDS:${PN} = "\
-    attr \
-    bash \
-    bc \
-    coreutils \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs \
-    e2fsprogs-mke2fs \
-    expect \
-    file \
-    findutils \
-    gawk \
-    gdb \
-    gzip \
-    iproute2 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
-    ldd \
-    libaio \
-    logrotate \
-    net-tools \
-    perl \
-    python3-core \
-    procps \
-    quota \
-    unzip \
-    util-linux \
-    which \
-    tar \
-"
-
-RRECOMMENDS:${PN} += "kernel-module-loop"
-
-FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
-
-# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
-INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
-INSANE_SKIP:${PN} += "already-stripped staticdev"
-
-remove_broken_musl_sources() {
-	[ "${TCLIBC}" = "musl" ] || return 0
-
-	cd ${S}
-	echo "WARNING: remove unsupported tests (until they're fixed)"
-
-	# sync with upstream
-	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
-	rm -rfv \
-		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
-		testcases/kernel/syscalls/getcontext/getcontext01.c \
-		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
-		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c
-}
-do_patch[postfuncs] += "remove_broken_musl_sources"
-
-# Avoid file dependency scans, as LTP checks for things that may or may not
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS:${PN} = '1'
-- 
2.17.1


