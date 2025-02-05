Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2492AC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:07:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22681.1738786064999541271
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAD0A40C1C;
	Wed,  5 Feb 2025 20:07:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWnm3xE8txYY; Wed,  5 Feb 2025 20:07:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD3C8406B5;
	Wed,  5 Feb 2025 20:07:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DB024164218; Wed,  5 Feb 2025 15:07:38 -0500 (EST)
Date: Wed, 5 Feb 2025 15:07:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/4] meta-arago-extras:
 Add recipe for arm-compute-library
Message-ID: <20250205200738.GN21608@denix.org>
References: <20250203185953.269693-1-afd@ti.com>
 <20250203185953.269693-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203185953.269693-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:07:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15817

On Mon, Feb 03, 2025 at 12:59:50PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> The Compute Library is a collection of low-level machine learning
> functions optimized for Arm. This will be used for ARMNN and
> other machine learning applications and frameworks.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
>  ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
>  ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
>  ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
>  ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
>  ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
>  .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
>  ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
>  .../arm-compute-library_24.12.bb              |  89 ++++++++
>  9 files changed, 1032 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb

> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
> new file mode 100644
> index 00000000..383b02fb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
> @@ -0,0 +1,89 @@
> +SUMMARY = "The ARM Computer Vision and Machine Learning library"
> +DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=35f8944fae972976691f3483b0ac9dba"
> +
> +SRC_URI = " \
> +    git://github.com/ARM-software/ComputeLibrary.git;branch=main;protocol=https \
> +    file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
> +    file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch \
> +    file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch \
> +    file://0004-Add-source-files-at-library-definition-time.patch \
> +    file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
> +    file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch \
> +    file://0007-Allow-ARMv7-builds-using-CMake.patch \
> +    file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch \
> +"
> +SRCREV = "32bcced2af7feea6969dd1d22e58d0718dc488e3"
> +
> +S = "${WORKDIR}/git"
> +
> +# Only compatible with armv7, armv7ve, and aarch64
> +COMPATIBLE_MACHINE = "(^$)"
> +COMPATIBLE_MACHINE:aarch64 = "(.*)"
> +COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
> +COMPATIBLE_MACHINE:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"

Seems excessive...

Will this work:

COMPATIBLE_MACHINE = "(armv7a|aarch64)"

If you do want to specifically check for "neon" being enabled, you can still 
skip armv7ve, as armv7a check will also apply to armv7ve...


> +
> +inherit cmake
> +
> +PACKAGECONFIG ??= "examples tests cppthreads openmp"
> +
> +PACKAGECONFIG[Werror] = "-DARM_COMPUTE_WERROR=ON,-DARM_COMPUTE_WERROR=OFF"
> +PACKAGECONFIG[examples] = "-DARM_COMPUTE_BUILD_EXAMPLES=ON,-DARM_COMPUTE_BUILD_EXAMPLES=OFF"
> +PACKAGECONFIG[tests] = "-DARM_COMPUTE_BUILD_TESTING=ON,-DARM_COMPUTE_BUILD_TESTING=OFF"
> +PACKAGECONFIG[cppthreads] = "-DARM_COMPUTE_CPPTHREADS=ON,-DARM_COMPUTE_CPPTHREADS=OFF"
> +PACKAGECONFIG[openmp] = "-DARM_COMPUTE_OPENMP=ON,-DARM_COMPUTE_OPENMP=OFF"
> +
> +EXTRA_OECMAKE:append:aarch64 = " \
> +	-DARM_COMPUTE_ARCH=armv8-a \
> +	-DENABLE_NEON=ON \
> +	-DENABLE_SVE=OFF \
> +	-DENABLE_SVE2=OFF \
> +"
> +EXTRA_OECMAKE:append:arm = " \

And here, the override should probably be armv7a, not arm? I know you set 
COMPATIBLE_MACHINE above to prevent armv4/v5/v6 from even coming here, but 
still...


> +	-DARM_COMPUTE_ARCH=armv7-a \
> +	-DENABLE_NEON=ON \
> +	-DENABLE_SVE=OFF \
> +	-DENABLE_SVE2=OFF \
> +	-DARM_COMPUTE_ENABLE_BF16=OFF \
> +	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=OFF \
> +"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

