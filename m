Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EDDC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:11:12 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.13125.1739459466263706326
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 07:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fS06ocD4;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DFB5EK4136738
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Feb 2025 09:11:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739459465;
	bh=zTj4cj7psPe4jNlfrte4vZrfGIAkmAmSdjwo9wyHYOg=;
	h=From:To:Subject:Date;
	b=fS06ocD4+21zQL/SBBBBKwyIm3CL5XGXKxJvmYZQv4h/5kn7NHgQ38rQQqAAHaZtY
	 MyHOFxJj8R3ADOuObXqkyZdzcTMPPRaEZvV7t6StvP5lWCTU6vfuYpga0cP0rzNE7N
	 Z1g0okD/kzz/E/A7hMHE1VBZzmqJwS1Q9l9nHSvQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DFB5WD129225;
	Thu, 13 Feb 2025 09:11:05 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 09:11:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 09:11:04 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DFB4XY003966;
	Thu, 13 Feb 2025 09:11:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tiaro-0007GE-NZ; Thu, 13 Feb 2025 09:11:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-test: ltp-ddt: Update to 20250130
Date: Thu, 13 Feb 2025 09:11:03 -0600
Message-ID: <20250213151104.27858-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Feb 2025 15:11:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15846

In order to work towards Yocto compliance for this repository we need to
address the manner in which ltp-ddt was setup.  Copying in the ltp
recipe can create a situation where we are providing an alternative and
maybe newer version of ltp that would violate the compliance checks.  We
also do not want to copy all of the settings from the ltp recipe.  So we
can change it from a .bb to a .inc file which we can still require and
maintain the ltp-ddt recipe as an overlay on top the ltp settings.

Additionally, remove the PROVIDES for ltp since technically we are not
ltp proper.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...tp-ddt_20240129.bb => ltp-ddt_20250130.bb} |   8 +-
 .../recipes-devtools/ltp-ddt/ltp_20250130.inc | 143 ++++++++++++++++++
 2 files changed, 146 insertions(+), 5 deletions(-)
 copy meta-arago-test/recipes-devtools/ltp-ddt/{ltp-ddt_20240129.bb => ltp-ddt_20250130.bb} (88%)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
similarity index 88%
copy from meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
copy to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index f6861e0c..6ddbfbe4 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -1,21 +1,19 @@
 FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
 FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
 
-require recipes-extended/ltp/ltp_${PV}.bb
+require ltp_${PV}.inc
 
 SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
 HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
 
-PROVIDES += "ltp"
-
 DEPENDS += "alsa-lib"
 
 PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "34602e4308a8c276bddfc0b4984b387037574f5c"
-BRANCH ?= "master"
+SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
+BRANCH ?= "cicd"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
 SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
new file mode 100644
index 00000000..1a353a19
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
@@ -0,0 +1,143 @@
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
+SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
+
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
+           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+# Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
+# SORT_NONE in linker script which isn't supported by gold:
+# https://sourceware.org/bugzilla/show_bug.cgi?id=18097
+# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=bfd', '', d)}"
+
+# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
+# it fails with lld also a bit later when trying to use *-payload.bin
+# http://errors.yoctoproject.org/Errors/Details/663094/
+# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTRO_FEATURES
+KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
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
+    findutils \
+    gawk \
+    gdb \
+    gzip \
+    iproute2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
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
+RRECOMMENDS:${PN} += "kernel-module-loop"
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


