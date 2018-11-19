Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7D5FC5297E
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 20:19:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAJKIugs035905
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:18:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542658736;
	bh=ewx9s+qON/sMmKwD45av/2Y1snqXTUnAGS+7ccXilq4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PZtOkFaKRoleUvJWhYp+Mp6EdSjDp8LxEyYoGrsKopPFquG93H2NgHH2Mw6YC+ELc
	FHAbebZhARzqQc/z2YQX8VSO6dgDq0yhoAn+rlqHk0X4KmEI0WZ8v0AcweDHJ7sqDV
	Hd5l9O7xi+did7HUS+KpvnVjR1wAlROTrlRjvIe8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAJKIuDM065206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:18:56 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 19 Nov 2018 14:18:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 19 Nov 2018 14:18:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAJKItjE012616;
	Mon, 19 Nov 2018 14:18:55 -0600
Date: Mon, 19 Nov 2018 15:18:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20181119201855.GB2540@beryl>
References: <1542397342-28389-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1542397342-28389-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arm-compute-library: bump SRCREV and add benchmark test group.
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
X-List-Received-Date: Mon, 19 Nov 2018 20:19:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 16, 2018 at 02:42:22PM -0500, Qin Su wrote:
> updated to the latest version of 18.08
> updated to generate versioned library
> added benchmark preset group for squeezenet and inceptionnet

Upstream-Status is missing for all the new pathces.

Also see below.

> Signed-off-by: Qin Su <qsu@ti.com>
> ---
>  .../0001-add-ti-benchmark-test-group.patch         | 62 +++++++++++++++++++
>  .../0002-add-ti-benchmark-test-group.patch         | 72 ++++++++++++++++++++++
>  .../0003-add-ti-benchmark-test-group.patch         | 40 ++++++++++++
>  .../0004-add-ti-benchmark-test-group.patch         | 47 ++++++++++++++
>  .../0005-add-ti-benchmark-test-group.patch         | 44 +++++++++++++
>  .../0006-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
>  .../0007-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
>  .../0008-add-ti-benchmark-test-group.patch         | 29 +++++++++
>  .../0009-add-ti-benchmark-test-group.patch         | 42 +++++++++++++
>  .../0010-add-ti-benchmark-test-group.patch         | 48 +++++++++++++++
>  .../0011-add-ti-benchmark-test-group.patch         | 35 +++++++++++
>  .../arm-compute-library/arm-compute-library_git.bb | 32 ++++++----
>  12 files changed, 524 insertions(+), 11 deletions(-)

[snip]

> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index 8a65ade..fc038f9 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -1,18 +1,30 @@
>  SUMMARY = "The ARM Computer Vision and Machine Learning library"
>  DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"

Please explain license change.


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
> +    for lib in ${WORKDIR}/git/build/*.so*

Why this change?


>      do
>          install -m 0755 $lib ${D}${libdir}
>      done
> @@ -45,14 +58,11 @@ do_install() {
>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
>  }
>  
> -SOLIBS = ".so"
> -FILES_SOLIBSDEV = ""
> -INSANE_SKIP_${PN} = "ldflags"
> +INSANE_SKIP_${PN} = "ldflags dev-so"

Since you now have "versioned library", you don't need to force *.so into the 
main package.


>  INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
>  
> -PACKAGES =+ "${PN}-source"
>  FILES_${PN} += "${bindir}/*"
> -FILES_${PN} += "${libdir}/*.so"
> +FILES_${PN} += "${libdir}/*.so*"
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

