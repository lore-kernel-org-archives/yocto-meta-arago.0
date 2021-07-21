Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4D2DE52A09
	for <meta-arago@arago-project.org>;
	Wed, 21 Jul 2021 16:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DD7D40C4E;
	Wed, 21 Jul 2021 16:53:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZVQyyV6ji9U6; Wed, 21 Jul 2021 16:53:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 099A840A46;
	Wed, 21 Jul 2021 16:53:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BD47917463E; Wed, 21 Jul 2021 12:53:23 -0400 (EDT)
Date: Wed, 21 Jul 2021 12:53:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <20210721165323.GJ1528@denix.org>
References: <20210721152853.21534-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210721152853.21534-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [dunfell][PATCH] ethtool: upgrade to 5.10
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
X-List-Received-Date: Wed, 21 Jul 2021 16:53:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2021 at 06:28:53PM +0300, Grygorii Strashko wrote:
> Upgrade ethtool to 5.10

If this is being backported from master of later release of oe-core, might 
want to mention that in the commit log, so can be dropped when migrating to 
the new LTS next year.


> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  .../ethtool/avoid_parallel_tests.patch        | 29 +++++++++++++++
>  .../ethtool/ethtool/run-ptest                 |  2 +
>  .../ethtool/ethtool_5.10.bb                   | 37 +++++++++++++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
>  create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
> 
> diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
> new file mode 100644
> index 00000000..54aec012
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
> @@ -0,0 +1,29 @@
> +From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
> +From: Tudor Florea <tudor.florea@enea.com>
> +Date: Wed, 28 May 2014 18:59:54 +0200
> +Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
> +
> +ptest needs buildtest-TESTS and runtest-TESTS targets.
> +serial-tests is required to generate those targets.
> +
> +Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> +Upstream-Status: Inappropriate
> +(default automake behavior incompatible with ptest)
> +
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 13c2bc0..0b6ca1d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
> + AC_INIT(ethtool, 5.10, netdev@vger.kernel.org)
> + AC_PREREQ(2.52)
> + AC_CONFIG_SRCDIR([ethtool.c])
> +-AM_INIT_AUTOMAKE([gnu subdir-objects])
> ++AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
> + AC_CONFIG_HEADERS([ethtool-config.h])
> + 
> + AM_MAINTAINER_MODE
> diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
> new file mode 100644
> index 00000000..1e245da1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +make -k runtest-TESTS
> diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb b/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
> new file mode 100644
> index 00000000..5c0df3ac
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "Display or change ethernet card settings"
> +DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
> +HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
> +
> +SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
> +           file://run-ptest \
> +           file://avoid_parallel_tests.patch \
> +           "
> +
> +SRC_URI[sha256sum] = "4b86adb3ed913c1ef14a276301981f696ab4ec360c19f0a5b68235c4756abae5"
> +
> +UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
> +
> +inherit autotools ptest bash-completion pkgconfig
> +
> +RDEPENDS_${PN}-ptest += "make"
> +
> +PACKAGECONFIG ?= "netlink"
> +PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
> +
> +do_compile_ptest() {
> +   oe_runmake buildtest-TESTS
> +}
> +
> +do_install_ptest () {
> +   cp ${B}/Makefile                 ${D}${PTEST_PATH}
> +   install ${B}/test-cmdline        ${D}${PTEST_PATH}
> +   if ${@bb.utils.contains('PACKAGECONFIG', 'netlink', 'false', 'true', d)}; then
> +       install ${B}/test-features       ${D}${PTEST_PATH}
> +   fi
> +   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
> +   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
> +}
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

