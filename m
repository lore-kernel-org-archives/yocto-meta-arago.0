Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B62C02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:13:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22684.1738786373313014087
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B368E40C1C;
	Wed,  5 Feb 2025 20:12:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2X45w38lmsU8; Wed,  5 Feb 2025 20:12:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77567406B5;
	Wed,  5 Feb 2025 20:12:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 34B76164218; Wed,  5 Feb 2025 15:12:48 -0500 (EST)
Date: Wed, 5 Feb 2025 15:12:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/4] meta-arago-extras:
 Add recipe for Arm NN
Message-ID: <20250205201248.GO21608@denix.org>
References: <20250203185953.269693-1-afd@ti.com>
 <20250203185953.269693-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203185953.269693-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:13:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15819

On Mon, Feb 03, 2025 at 12:59:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Arm NN is a performant machine learning inference engine for Linux,
> accelerating ML on Arm Cortex-A CPUs.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  ...01-Fix-type-casting-for-32bit-builds.patch | 40 +++++++++++
>  .../recipes-devtools/armnn/armnn_24.11.bb     | 70 +++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb

...

> diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> new file mode 100644
> index 00000000..e965382a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> @@ -0,0 +1,70 @@
> +SUMMARY = "ARM Neural Network SDK"
> +DESCRIPTION = "Linux software and tools to enable machine learning workloads on power-efficient devices"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

This is the default - why do you need to set it explicitly?


> +BRANCH = "branches/armnn_24_11"
> +SRC_URI = "git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https"
> +SRC_URI += "file://0001-Fix-type-casting-for-32bit-builds.patch"
> +
> +# v24.11
> +SRCREV = "3ed70c005559d409feff2c578a1a39cf8fec8804"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +inherit pkgconfig
> +
> +DEPENDS = " \
> +    boost \
> +    protobuf \
> +    xxd-native \
> +    arm-compute-library \
> +"
> +
> +RDEPENDS:${PN} = " \
> +    arm-compute-library \
> +    protobuf \
> +    boost \

All these are listed in the DEPENDS and will be carried over to RDEPENDS 
automatically, no need to list them explicitly, unless shlib logic is 
completely screwed, in which case you better mention that in the commit log.


> +"
> +
> +PACKAGECONFIG += "unit-tests tests ref"
> +PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
> +PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"
> +
> +PACKAGECONFIG[neon] = "-DARMCOMPUTENEON=1, -DARMCOMPUTENEON=0"
> +PACKAGECONFIG[unit-tests] = "-DBUILD_UNIT_TESTS=1, -DBUILD_UNIT_TESTS=0"
> +PACKAGECONFIG[tests] = "-DBUILD_TESTS=1, -DBUILD_TESTS=0"
> +PACKAGECONFIG[ref] = "-DARMNNREF=1, -DARMNNREF=0"
> +
> +EXTRA_OECMAKE += " \
> +    -DHALF_INCLUDE=${STAGING_DIR_TARGET} \
> +"
> +
> +do_install:append() {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
> +        install -d ${D}${bindir}/${P}
> +        find ${B}/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir}/${P} \;
> +    fi
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'unit-tests', 'true', 'false', d)}; then
> +        install -d ${D}${bindir}/${P}
> +        cp $CP_ARGS ${B}/UnitTests ${D}${bindir}/${P}
> +    fi
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'tensorflow-lite', 'false', 'true', d)}; then
> +        rm -rf ${D}${includedir}/armnnTfLiteParser
> +    fi
> +}
> +
> +CXXFLAGS += "-Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=nonnull"
> +
> +FILES:${PN} += "${libdir}/*"
> +FILES:${PN}-dev += "${includedir}/* ${libdir}/cmake/armnn/* ${libdir}/pkgconfig/*.pc ${bindir}/*"
> +
> +INSANE_SKIP:${PN} = "dev-so"
> +INSANE_SKIP:${PN}-dev += "buildpaths"
> -- 
> 2.39.2

