Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2F3CD52A95
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:14:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIE4dt101776
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862445;
	bh=zQ8XNqYLH32hFAmJaG+TRd1zTP1JkXq1mkeyJwUgcjc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xFUODTiSWPhJkveOq4hlDq4ud68hnWyMtQHy/uQVY948XXbj4bD6ds1l0iGZf97F2
	cyKwdoVtyqp/bgFSp/A03kwD0+usIXkfkXPexbHPVuaj4SCs09ZnZ2eteEM+UMeNv3
	6NSbje1Pg8e8oyLAfG9EnP45Edr/pcvfUTssI0yM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIE4BB001633
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:14:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:14:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:14:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIE4Ji002528;
	Thu, 13 Sep 2018 13:14:04 -0500
Date: Thu, 13 Sep 2018 14:12:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180913181239.GB12296@beryl>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
	<1536861387-7418-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536861387-7418-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH v6 2/5] arm-compute-library: Machine Learning library for ARM.
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
X-List-Received-Date: Thu, 13 Sep 2018 18:14:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 01:56:24PM -0400, Jacob Stiffler wrote:
> From: Qin Su <qsu@ti.com>
> 
> The ARM Computer Vision and Machine Learning library is a set of functions
> optimised for both ARM CPUs and GPUs using SIMD technologies.
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> Changes from previous versions:
> * Add "_git" suffix to recipe name.
> * Add version.
> * Add branch option for SRC_URI.
> * For installation, use install by looping over libraries.
> * Remove unnecessary checksums for SRC_URI.
> * Set armv7a as COMPATIBLE_MACHINE as this is hardcoded in
>   EXTRA_OESCONS.

^^^ Thanks a lot for all the fixes!

BTW, is this recipe available in any other layer?


>  .../arm-compute-library/arm-compute-library_git.bb | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> new file mode 100644
> index 0000000..23e31cd
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
> +
> +COMPATIBLE_MACHINE = "armv7a"
> +
> +SRC_URI = " \
> +    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
> +"
> +
> +PV  = "18.05"
> +
> +BRANCH = "master"
> +SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile_prepend() {
> +    unset CC CXX
> +}
> +
> +inherit scons
> +
> +EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
> +
> +LIBS += "-larmpl_lp64_mp"
> +
> +do_install() {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +    install -d ${D}${libdir}
> +    for lib in ${S}/build/*.so
> +    do
> +        install -m 0644 $lib ${D}${libdir}
> +    done
> +
> +    install -d ${D}${datadir}/${PN}
> +    cp $CP_ARGS ${S}/. ${D}${datadir}/${PN}
> +}
> +
> +INSANE_SKIP_${PN}-dev = "dev-elf"
> +
> +PACKAGES =+ "${PN}-source"
> +FILES_${PN}-source = "${datadir}/${PN}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

