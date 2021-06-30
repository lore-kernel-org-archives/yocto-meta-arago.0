Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6611052AD8
	for <meta-arago@arago-project.org>;
	Wed, 30 Jun 2021 00:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B1F4A40C1E;
	Wed, 30 Jun 2021 00:36:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NdsAN3gxlzfb; Wed, 30 Jun 2021 00:36:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7EB1D40AB7;
	Wed, 30 Jun 2021 00:36:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 42ACC17461C; Tue, 29 Jun 2021 20:36:05 -0400 (EDT)
Date: Tue, 29 Jun 2021 20:36:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Yogesh Siraswar <yogeshs@ti.com>
Message-ID: <20210630003605.GE1528@denix.org>
References: <20210619034646.21654-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210619034646.21654-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell][PATCH v3] ltp-ddt:Update to 20210524
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
X-List-Received-Date: Wed, 30 Jun 2021 00:36:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yogesh,

Sorry for the delay - I was following along with your patches, but every time 
I was about to follow up, I got distracted. Yes, v3 looks good for dunfell, 
but you would need to do it differently for master.


On Sat, Jun 19, 2021 at 03:46:46AM +0000, Yogesh Siraswar wrote:
> Updated ltp-ddt to 20210524 on dunfell
> Back-ported ltp 20210524 ltp from master
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
> Changes from v2:
> 1) Moved the ltp folder to meta-arago-extras
> 2) Fixed the build issue by adding ltp path to FILESEXTRAPATHS
> 
> ---
>  ...tp-ddt_20200120.bb => ltp-ddt_20210524.bb} |   7 +-
>  ...001-Remove-OOM-tests-from-runtest-mm.patch |  31 ++++
>  .../recipes-extended/ltp/ltp_20210524.bb      | 139 ++++++++++++++++++
>  3 files changed, 174 insertions(+), 3 deletions(-)
>  rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210524.bb} (79%)
>  create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
>  create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> similarity index 79%
> rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> index 67ec1d74..3051b58c 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> @@ -1,4 +1,5 @@
>  FILESEXTRAPATHS_prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
> +FILESEXTRAPATHS_prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
>  
>  require recipes-extended/ltp/ltp_${PV}.bb
>  
> @@ -10,14 +11,14 @@ PROVIDES += "ltp"
>  DEPENDS += "alsa-lib"
>  
>  PE = "1"
> -PR = "r13"
> +PR = "r1"
>  PV_append = "+git${SRCPV}"
>  
> -SRCREV = "31f9cfa61ae4102da6fa87f624130096c09d63a2"
> +SRCREV = "21b2b2e3ce3d30a685cd64c05cfd5920eca9be21"
>  BRANCH ?= "master"
>  
>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> -SRC_URI_prepend = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} "
> +SRC_URI_prepend = "git://git.ti.com/test-automation/ltp-ddt.git;branch=${BRANCH} "
>  
>  export prefix = "/opt/ltp"
>  export exec_prefix = "/opt/ltp"
> diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> new file mode 100644
> index 00000000..e51950f1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> @@ -0,0 +1,31 @@
> +From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
> +From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
> +Date: Wed, 29 Jul 2020 08:47:09 -0400
> +Subject: [PATCH] Remove OOM tests from runtest/mm
> +
> +Disable OOM tests, as they might cause oeqa ssh connection lost
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> +
> +---
> + runtest/mm | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/runtest/mm b/runtest/mm
> +index 481d39691..cf207d10e 100644
> +--- a/runtest/mm
> ++++ b/runtest/mm
> +@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
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
> diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
> new file mode 100644
> index 00000000..3f6594fa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
> @@ -0,0 +1,139 @@
> +SUMMARY = "Linux Test Project"
> +DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
> +HOMEPAGE = "https://linux-test-project.github.io/"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
> +    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
> +    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> +    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +"
> +
> +DEPENDS = "attr libaio libcap acl openssl zip-native"
> +DEPENDS_append_libc-musl = " fts "
> +EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> +EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
> +
> +# since ltp contains x86-64 assembler which uses the frame-pointer register,
> +# set -fomit-frame-pointer x86-64 to handle cases where optimisation
> +# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
> +# earlier in CFLAGS, etc.
> +CFLAGS_append_x86-64 = " -fomit-frame-pointer"
> +
> +CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> +CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> +SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
> +
> +SRC_URI = "git://github.com/linux-test-project/ltp.git \
> +           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig
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
> +    # Copy POSIX test suite into ${D}${prefix}/testcases by manual
> +    cp -r testcases/open_posix_testsuite ${D}${prefix}/testcases
> +
> +    # Makefile were configured in the build system
> +    find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
> +         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
> +         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
> +         -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
> +         -e 's@[^ ]*--sysroot=[^ "]*@@g'
> +
> +    # The controllers memcg_stree test seems to cause us hangs and takes 900s
> +    # (maybe we expect more regular output?), anyhow, skip it
> +    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
> +}
> +
> +RDEPENDS_${PN} = "\
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
> +FILES_${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
> +
> +# Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
> +INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
> +INSANE_SKIP_${PN} += "already-stripped staticdev"
> +
> +remove_broken_musl_sources() {
> +	[ "${TCLIBC}" = "musl" ] || return 0
> +
> +	cd ${S}
> +	echo "WARNING: remove unsupported tests (until they're fixed)"
> +
> +	# sync with upstream
> +	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
> +	rm -rfv \
> +		testcases/kernel/sched/process_stress/process.c \
> +		testcases/kernel/syscalls/confstr/confstr01.c \
> +		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
> +		testcases/kernel/syscalls/getcontext/getcontext01.c \
> +		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
> +		testcases/kernel/syscalls/timer_create/timer_create01.c \
> +		testcases/kernel/syscalls/timer_create/timer_create03.c \
> +		utils/benchmark/ebizzy-0.3
> +}
> +do_patch[postfuncs] += "remove_broken_musl_sources"
> +
> +# Avoid file dependency scans, as LTP checks for things that may or may not
> +# exist on the running system.  For instance it has specific checks for
> +# csh and ksh which are not typically part of OpenEmbedded systems (but
> +# can be added via additional layers.)
> +SKIP_FILEDEPS_${PN} = '1'
> +
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

