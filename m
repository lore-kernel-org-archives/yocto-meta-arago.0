Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A18C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 15:50:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.49021.1681141833270227076
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 08:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u1LzNIDD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AFoWNM025001;
	Mon, 10 Apr 2023 10:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681141832;
	bh=JAlFXKWyBhgMBEVOZUXlEP2iEWMGkEmQ9tSFJofl9vo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=u1LzNIDDwqXC7BlujfdCteuYxUf+MYdfG91ad8oUncTurLiTBeMyrd5yThIixsrkl
	 rMKJUXsN9Qvm0SQGPb1kcfSnLDCxgC9LCDb0qz1Qk6rvP74ZIXg71LlS3DIZC7M3yx
	 OwcnJUYZyvSlCg83YoyvKMvewIF3y6yvtxVYwP9Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AFoWKr087038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 10:50:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 10:50:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 10:50:31 -0500
Received: from [10.250.32.15] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AFoVZG012335;
	Mon, 10 Apr 2023 10:50:31 -0500
Message-ID: <144867d3-a644-43d2-16ea-98d4bf53be39@ti.com>
Date: Mon, 10 Apr 2023 10:50:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-arago][master/kirkstone] ltp-ddt: Add support for version
 20230127
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <17549D29D8E639CC.13124@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17549D29D8E639CC.13124@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 15:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14300


For anyone looking at this patch, it likely cannot be applied to 
kirkstone and built correctly.  This patch is going through our CICD 
process and requires the branch to be set to "cicd" to find the SRCREV 
listed within.  This patch will not make it to kirkstone until the cicd 
branch of ltp-ddt has been merged to master.


On 4/10/2023 10:42, Ryan Eatmon via lists.yoctoproject.org wrote:
> The internal testing team would like to move to this version as the
> basis for our internal ltp-ddt.  So we need to capture the recipe
> settings for this version from oe-core master and provide a new version
> for us to overload.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../ltp-ddt/ltp-ddt_20230127.bb               |  44 ++++++
>   ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
>   .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
>   .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
>   4 files changed, 246 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> new file mode 100644
> index 00000000..b7c695f3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> @@ -0,0 +1,44 @@
> +FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
> +FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
> +
> +require recipes-extended/ltp/ltp_${PV}.bb
> +
> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> +HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
> +
> +PROVIDES += "ltp"
> +
> +DEPENDS += "alsa-lib"
> +
> +PE = "1"
> +PR = "r7"
> +PV:append = "+git${SRCPV}"
> +
> +SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
> +BRANCH ?= "master"
> +
> +SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
> +SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
> +
> +export prefix = "/opt/ltp"
> +export exec_prefix = "/opt/ltp"
> +
> +EXTRA_OEMAKE:append = " \
> +    KERNEL_USR_INC=${STAGING_INCDIR} \
> +    ALSA_INCPATH=${STAGING_INCDIR} \
> +    ALSA_LIBPATH=${STAGING_LIBDIR} \
> +"
> +
> +RDEPENDS:${PN} += "\
> +    acl \
> +    at \
> +    pm-qa \
> +    serialcheck \
> +    memtester \
> +"
> +
> +do_install:prepend() {
> +	# Upstream ltp recipe wants to remove this test case in do_install
> +	install -d ${D}${prefix}/runtest/
> +	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
> +}
> diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
> new file mode 100644
> index 00000000..6d945700
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
> @@ -0,0 +1,35 @@
> +From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
> +From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
> +Date: Wed, 29 Jul 2020 08:47:09 -0400
> +Subject: [PATCH] Remove OOM tests from runtest/mm
> +
> +Disable OOM tests, as they might cause oeqa ssh connection lost
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> +[ pvorel: rebased for 20210927 ]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> + runtest/mm | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/runtest/mm b/runtest/mm
> +index 6537666a9..e5a091a5a 100644
> +--- a/runtest/mm
> ++++ b/runtest/mm
> +@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
> +
> + cpuset01 cpuset01
> +
> +-oom01 oom01
> +-oom02 oom02
> +-oom03 oom03
> +-oom04 oom04
> +-oom05 oom05
> +-
> + swapping01 swapping01 -i 5
> +
> + thp01 thp01 -I 120
> +--
> +2.33.0
> +
> diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
> new file mode 100644
> index 00000000..f25a692d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
> @@ -0,0 +1,27 @@
> +This patch disables tests which we've found "hang" on our infrastructure.
> +
> +proc01:
> +https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
> +https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
> +https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/2782 (arm)
> +(was trying to read /proc/kmsg, looks like a horrible test anyway)
> +
> +Upstream-Status: Inappropriate [OE Configuration]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: git/runtest/fs
> +===================================================================
> +--- git.orig/runtest/fs
> ++++ git/runtest/fs
> +@@ -64,11 +64,6 @@ writetest01	writetest
> + #Also run the fs_di (Data Integrity tests)
> + fs_di fs_di -d $TMPDIR
> +
> +-# Read every file in /proc. Not likely to crash, but does enough
> +-# to disturb the kernel. A good kernel latency killer too.
> +-# Was not sure why it should reside in runtest/crashme and won't get tested ever
> +-proc01 proc01 -m 128
> +-
> + read_all_dev read_all -d /dev -p -q -r 3
> + read_all_proc read_all -d /proc -q -r 3
> + read_all_sys read_all -d /sys -q -r 3
> diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb b/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
> new file mode 100644
> index 00000000..570401ea
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
> @@ -0,0 +1,140 @@
> +SUMMARY = "Linux Test Project"
> +DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
> +HOMEPAGE = "https://linux-test-project.github.io/"
> +SECTION = "console/utils"
> +LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
> +    file://testcases/network/can/filter-tests/COPYING;md5=5b155ea7d7f86eae8e8832955d8b70bc \
> +"
> +
> +DEPENDS = "attr libaio libcap acl openssl zip-native"
> +DEPENDS:append:libc-musl = " fts "
> +EXTRA_OEMAKE:append:libc-musl = " LIBC=musl "
> +EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
> +
> +# since ltp contains x86-64 assembler which uses the frame-pointer register,
> +# set -fomit-frame-pointer x86-64 to handle cases where optimisation
> +# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
> +# earlier in CFLAGS, etc.
> +CFLAGS:append:x86-64 = " -fomit-frame-pointer"
> +TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
> +TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
> +
> +CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> +CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> +SRCREV = "dd2d61ac1a1e09797a6165f478abd4a9f4f43035"
> +
> +SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
> +           file://0002-Remove-OOM-tests-from-runtest-mm.patch \
> +           file://disable_hanging_tests.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
> +# SORT_NONE in linker script which isn't supported by gold:
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=18097
> +# https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
> +LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
> +
> +# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
> +# https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
> +# it fails with gold also a bit later when trying to use *-payload.bin
> +# http://errors.yoctoproject.org/Errors/Details/663094/
> +# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
> +KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +export prefix = "/opt/${PN}"
> +export exec_prefix = "/opt/${PN}"
> +
> +PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
> +EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
> +EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
> +# ltp network/rpc test cases ftbfs when libtirpc is found
> +EXTRA_OECONF += " --without-tirpc "
> +
> +do_compile() {
> +    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}" KVM_LD="${KVM_LD}"
> +}
> +
> +do_install(){
> +    install -d ${D}${prefix}/
> +    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install include-install
> +
> +    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
> +    # as it lacks dependency on some perl moudle such as LWP::Simple
> +    # And this script previously works as a tool for analyzing failures from LTP
> +    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
> +    # http://khack.osdl.org to retrieve ltp test results run on
> +    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
> +    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
> +
> +    # The controllers memcg_stree test seems to cause us hangs and takes 900s
> +    # (maybe we expect more regular output?), anyhow, skip it
> +    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
> +}
> +
> +RDEPENDS:${PN} = "\
> +    attr \
> +    bash \
> +    bc \
> +    coreutils \
> +    cpio \
> +    cronie \
> +    curl \
> +    e2fsprogs \
> +    e2fsprogs-mke2fs \
> +    expect \
> +    file \
> +    gawk \
> +    gdb \
> +    gzip \
> +    iproute2 \
> +    ldd \
> +    libaio \
> +    logrotate \
> +    net-tools \
> +    perl \
> +    python3-core \
> +    procps \
> +    quota \
> +    unzip \
> +    util-linux \
> +    which \
> +    tar \
> +"
> +
> +FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
> +
> +# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
> +INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
> +INSANE_SKIP:${PN} += "already-stripped staticdev"
> +
> +remove_broken_musl_sources() {
> +	[ "${TCLIBC}" = "musl" ] || return 0
> +
> +	cd ${S}
> +	echo "WARNING: remove unsupported tests (until they're fixed)"
> +
> +	# sync with upstream
> +	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
> +	rm -rfv \
> +		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
> +		testcases/kernel/syscalls/getcontext/getcontext01.c \
> +		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
> +		testcases/kernel/syscalls/timer_create/timer_create01.c \
> +		testcases/kernel/syscalls/timer_create/timer_create03.c
> +}
> +do_patch[postfuncs] += "remove_broken_musl_sources"
> +
> +# Avoid file dependency scans, as LTP checks for things that may or may not
> +# exist on the running system.  For instance it has specific checks for
> +# csh and ksh which are not typically part of OpenEmbedded systems (but
> +# can be added via additional layers.)
> +SKIP_FILEDEPS:${PN} = '1'

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

