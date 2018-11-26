Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3DBE1529A8
	for <meta-arago@arago-project.org>;
	Mon, 26 Nov 2018 22:11:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAQMBjmE111787
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 16:11:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543270305;
	bh=GfKI79vEnF4l5F3sR5h7EK1famTWZe8ceH1CtXIVvls=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pQAI6rV/WdkkZ4HPyiIaf5paDzlAeC7KJx7InhWb2P5ocrp8TFkUmrcOVRHxkgyEh
	qpq2fwvtBPSoZvBvEZBrRSJZ3LwIWqQ7cGbTUy9Kn8QvNST13A6PKVQedSMVBpcMOJ
	xIQPGiPTP/9mbNZFraOYZdldYQ1eZYq/BYsRVbGk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAQMBjkF019700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 16:11:45 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 26 Nov 2018 16:11:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 26 Nov 2018 16:11:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAQMBiPP017227;
	Mon, 26 Nov 2018 16:11:44 -0600
Date: Mon, 26 Nov 2018 17:11:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20181126221144.GI21933@beryl>
References: <1542826913-4093-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1542826913-4093-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] arm-compute-library: bump SRCREV and add TI benchmark test group.
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
X-List-Received-Date: Mon, 26 Nov 2018 22:11:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 21, 2018 at 02:01:53PM -0500, Qin Su wrote:
> updated to the latest version of 18.08
> updated LIC_FILES_CHKSUM as Copyright time changed in LICENSE from 2017 to 2017-2018
> updated to generate versioned library
> added benchmark preset group for squeezenet and inceptionnet

Mostly looks good. 2 comments re: permissions and *.so below.


> Signed-off-by: Qin Su <qsu@ti.com>
> ---
>  .../0001-add-ti-benchmark-test-group.patch         | 64 +++++++++++++++++++
>  .../0002-add-ti-benchmark-test-group.patch         | 74 ++++++++++++++++++++++
>  .../0003-add-ti-benchmark-test-group.patch         | 42 ++++++++++++
>  .../0004-add-ti-benchmark-test-group.patch         | 49 ++++++++++++++
>  .../0005-add-ti-benchmark-test-group.patch         | 46 ++++++++++++++
>  .../0006-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>  .../0007-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>  .../0008-add-ti-benchmark-test-group.patch         | 31 +++++++++
>  .../0009-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>  .../0010-add-ti-benchmark-test-group.patch         | 50 +++++++++++++++
>  .../0011-add-ti-benchmark-test-group.patch         | 37 +++++++++++
>  .../arm-compute-library/arm-compute-library_git.bb | 32 ++++++----
>  12 files changed, 546 insertions(+), 11 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0001-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0002-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0003-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0004-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0005-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0006-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0007-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0008-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0009-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0010-add-ti-benchmark-test-group.patch
>  create mode 100755 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library/0011-add-ti-benchmark-test-group.patch

Please fix file permissions.

[snip]


> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index 8a65ade..3c6fae5 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -1,18 +1,30 @@
>  SUMMARY = "The ARM Computer Vision and Machine Learning library"
>  DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
>  
> -COMPATIBLE_MACHINE = "armv7a"
> +COMPATIBLE_MACHINE = "armv7a|aarch64"
>  
>  SRC_URI = " \
>      git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
> +    file://0001-add-ti-benchmark-test-group.patch \
> +    file://0002-add-ti-benchmark-test-group.patch \
> +    file://0003-add-ti-benchmark-test-group.patch \
> +    file://0004-add-ti-benchmark-test-group.patch \
> +    file://0005-add-ti-benchmark-test-group.patch \
> +    file://0006-add-ti-benchmark-test-group.patch \
> +    file://0007-add-ti-benchmark-test-group.patch \
> +    file://0008-add-ti-benchmark-test-group.patch \
> +    file://0009-add-ti-benchmark-test-group.patch \
> +    file://0010-add-ti-benchmark-test-group.patch \
> +    file://0011-add-ti-benchmark-test-group.patch \
>  "
>  
> -PV  = "18.05"
> +PV  = "18.08"
> +PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>  
>  BRANCH = "master"
> -SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
> +SRCREV = "52ba29e936b8e711e8acdfe819e36f884d4f3fe1"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -22,7 +34,8 @@ do_compile_prepend() {
>  
>  inherit scons
>  
> -EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
> +EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0 set_soname=1"
> +EXTRA_OESCONS_aarch64 = "arch=arm64-v8a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0 set_soname=1"
>  
>  LIBS += "-larmpl_lp64_mp"
>  
> @@ -30,7 +43,7 @@ do_install() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>  
>      install -m 0755 -d ${D}${libdir}
> -    for lib in ${S}/build/*.so
> +    for lib in ${S}/build/*.so*
>      do
>          install -m 0755 $lib ${D}${libdir}
>      done
> @@ -43,16 +56,13 @@ do_install() {
>      # Install built source package as expected by ARMNN
>      install -d ${D}${datadir}/${BPN}
>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
> +    # Remove unneeded symlink .so
> +    rm -f ${D}${datadir}/${BPN}/build/*.so

Why? They are useful for development and would automatically get packaged into 
${PN}-dev package...


>  }
>  
> -SOLIBS = ".so"
> -FILES_SOLIBSDEV = ""
>  INSANE_SKIP_${PN} = "ldflags"
>  INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
>  
> -PACKAGES =+ "${PN}-source"
> -FILES_${PN} += "${bindir}/*"
> -FILES_${PN} += "${libdir}/*.so"
>  FILES_${PN}-source = "${datadir}/${BPN}"
>  INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

