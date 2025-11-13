Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26BECDB463
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 23:10:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6061.1763075402505917405
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 15:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8929040B66;
	Thu, 13 Nov 2025 23:10:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B50u6PiYTJec; Thu, 13 Nov 2025 23:10:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C8AE40800;
	Thu, 13 Nov 2025 23:09:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E8B2175403; Thu, 13 Nov 2025 18:09:57 -0500 (EST)
Date: Thu, 13 Nov 2025 18:09:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH 09/10] libyang: Do the version
 bump in a yocto-check-layer compliant manner
Message-ID: <20251113230957.GZ3125@denix.org>
References: <20251113225017.22994-1-reatmon@ti.com>
 <20251113225017.22994-9-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113225017.22994-9-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 23:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16766

On Thu, Nov 13, 2025 at 04:50:16PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Yocto Project Compatibility requires that including a layer in a build
> not change recipes in other layers.  In this case, we were providing a
> newer version of a recipe that another layer provides.
> 
> The proper way of doing this is to create a bbappend and only change the
> minimal things needed to perform your changes.  Additionally, to pass
> the yocto-check-layer the bbappend needs to be wrapped in a manner that
> only applies your changes in the event that you are making use of your
> layer.  For Arago, that means only if we are building Arago.

Thanks for this descriptive commit message - it captures reasoning and a 
proper solution! It is a great example we can refer to in the future.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../sysrepo/libyang-arago.inc                 |  9 ++++
>  .../sysrepo/libyang_%.bbappend                |  5 +++
>  .../recipes-extended/sysrepo/libyang_3.7.8.bb | 45 -------------------
>  3 files changed, 14 insertions(+), 45 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
>  delete mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
> 
> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
> new file mode 100644
> index 00000000..b76701a8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
> @@ -0,0 +1,9 @@
> +PV = "3.7.8"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"

May want to explicitly mention why the checksum is different vs. upstream.


> +SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
> +
> +do_install:append () {
> +    oe_multilib_header  libyang/ly_config.h
> +}
> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
> index 608377e3..60d1258e 100644
> --- a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
> +++ b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
> @@ -1 +1,6 @@
> +LIBYANG_ARAGO = ""
> +LIBYANG_ARAGO:arago = "libyang-arago.inc"
> +
> +require ${LIBYANG_ARAGO}
> +
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb b/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
> deleted file mode 100644
> index 3bea9bc2..00000000
> --- a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -SUMMARY = "YANG data modeling language library"
> -DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
> -HOMEPAGE = "https://github.com/CESNET/libyang"
> -SECTION = "libs"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
> -
> -SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
> -
> -SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
> -           file://0001-test_context-skip-test-case-test_searchdirs.patch \
> -           file://run-ptest \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
> -# Main dependencies
> -inherit cmake pkgconfig lib_package ptest multilib_header
> -DEPENDS = "libpcre2"
> -DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
> -
> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> -EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
> -
> -do_compile:prepend () {
> -    if [ ${PTEST_ENABLED} = "1" ]; then
> -        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
> -        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
> -    fi
> -}
> -
> -do_install:append () {
> -        oe_multilib_header  libyang/ly_config.h
> -}
> -
> -do_install_ptest () {
> -    install -d ${D}${PTEST_PATH}/tests
> -    cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
> -    cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
> -    install -d ${D}${PTEST_PATH}/tests/plugins
> -    cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
> -}
> -
> -FILES:${PN} += "${datadir}/yang/*"
> -- 
> 2.17.1

