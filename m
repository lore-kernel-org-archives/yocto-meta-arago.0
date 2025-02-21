Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB640C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 22:03:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.35278.1740175431433262591
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 14:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8AF0440D59;
	Fri, 21 Feb 2025 22:03:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6FnBA4sLcPQ; Fri, 21 Feb 2025 22:03:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F03940D32;
	Fri, 21 Feb 2025 22:03:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 89000164287; Fri, 21 Feb 2025 17:03:47 -0500 (EST)
Date: Fri, 21 Feb 2025 17:03:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH v4 1/2] meta-arago-test: add
 recipe opencl-cts
Message-ID: <20250221220347.GB1879@denix.org>
References: <20250221204153.428129-1-a-christidis@ti.com>
 <20250221204153.428129-2-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221204153.428129-2-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 22:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15892

On Fri, Feb 21, 2025 at 02:41:52PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Adding recipe for opencl-cts, v2024-08-08 is a pre-release version.
> I have tested it to work with opencl-headers version v2024.05.08 . This version
> is picked due to incompatibility issues with other versions of headers.
> 
> This is a backport from meta-openembedded, they rejected to move opencl-cts to
> scarthgap due to their LTS procedure. New packages do not get merged into LTS
> branches after 7 months of the branch creation.
> 
> This recipe also comes with a patch.
> 
> Within the cmake build system, the compiler -Werror flag is enabled.  This
> turns all warnings into errors and doesn't allow the system to compile
> correctly.  Change the system to ignore the 3 warning rules that show up when
> compiling.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> 
> v4:
> -merged the patch patch and recipe patch into one patch, this is it 

I believe it was already mentioned not once, that any backport of an existing 
recipe from upstream should be in 2 stages - first copy the recipe as is 
verbatim w/o any modifications, and then make any changes need.

Moreover, this is NOT how your patch got accepted upstream:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch

Here's the corresponding discussion on the meta-oe mailing list:
https://lists.openembedded.org/g/openembedded-devel/topic/110839841


> v3:
> - Changed from adress, it was wrong. 
> 
> v2:
> - Added explanation on why this patch is a backport from
>   meta-openembedded 
> 
> 
>  .../files/0001-Ignore-Compiler-Warnings.patch | 18 +++++++++++++
>  .../opencl/opencl-cts_2024.08.08.bb           | 27 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
>  create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
> new file mode 100644
> index 00000000..067cffa1
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
> @@ -0,0 +1,18 @@

This is not a proper compliant patch - it should not be a bare diff, but 
rather a proper git patch with a header, plus Upstream-Status: tag.

So, Khem had modified your patch upstream to be compliant before merging, 
but you still submit the old one here - why?


> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cfef6b3..71b6ddb4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
> +     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
> +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> +     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
> +-
> ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> +     # -msse -mfpmath=sse to force gcc to use sse for float math,
> +     # avoiding excess precision problems that cause tests like int2float
> +     # to falsely fail. -ffloat-store also works, but WG suggested
> +-- 
> +2.34.1
> +
> diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
> new file mode 100644
> index 00000000..60bc3c6a
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "OpenCL CTS"
> +DESCRIPTION = "OpenCL CTS test suite"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +inherit pkgconfig cmake
> +
> +DEPENDS += "opencl-headers opencl-icd-loader"
> +RDEPENDS:${PN} += "python3-core python3-io"
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
> +           file://0001-Ignore-Compiler-Warnings.patch"
> +
> +
> +SRCREV = "a406b340913f622da089b00f284a597656c10239"
> +
> +EXTRA_OECMAKE:append = " -DCMAKE_BUILD_TYPE=Debug -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
> +
> +do_install() {
> +        install -d ${D}${bindir}/opencl_test_conformance
> +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
> +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
> +	find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
> +        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
> +}
> -- 
> 2.34.1

