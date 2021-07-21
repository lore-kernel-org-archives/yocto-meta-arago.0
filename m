Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id DB768529A9
	for <meta-arago@arago-project.org>;
	Wed, 21 Jul 2021 20:41:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16LKg3XX075085;
	Wed, 21 Jul 2021 15:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626900123;
	bh=+pqKRNiQyGh7rKjQRRyYvgreVaEfYZAIibyxExZV1Xk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=b+EpXz4CInl6CR+O1JxyCT0Ygz63iaDwr1qelHl04ABl61geXskOmJlwnj+TbR7yQ
	hy8WmA5OCgTpIp2owrZHOZkrebkSPGRlggwZMr0nl8kvLjU6OLJ/5tVDYaxY45bWaD
	LU6ySQdkFyP58KLJtNB+POifMIlCprk3AoX71vQA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16LKg2kO073817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jul 2021 15:42:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 21 Jul 2021 15:42:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 21 Jul 2021 15:42:02 -0500
Received: from [10.250.66.214] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16LKg2ad108613;
	Wed, 21 Jul 2021 15:42:02 -0500
To: Grygorii Strashko <grygorii.strashko@ti.com>,
	<meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>, Denys
	Dmytriyenko <denis@denix.org>
References: <20210721180548.26052-1-grygorii.strashko@ti.com>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <271c51ba-aff3-db83-0862-a88a4b44c368@ti.com>
Date: Wed, 21 Jul 2021 15:42:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721180548.26052-1-grygorii.strashko@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [dunfell][PATCH v2] ethtool: upgrade to 5.10
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
X-List-Received-Date: Wed, 21 Jul 2021 20:41:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Merged to dunfell-next.

On 7/21/2021 1:05 PM, Grygorii Strashko wrote:
> Upgrade ethtool to 5.10
> 
> This is being backported from master oe-core, so it can be dropped when
> migrating to the new LTS.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>   .../ethtool/avoid_parallel_tests.patch        | 29 +++++++++++++++
>   .../ethtool/ethtool/run-ptest                 |  2 +
>   .../ethtool/ethtool_5.10.bb                   | 37 +++++++++++++++++++
>   3 files changed, 68 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
>   create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
>   create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
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
> 

