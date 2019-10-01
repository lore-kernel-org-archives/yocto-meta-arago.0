Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 30B45520DF
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 20:05:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91K3n2i090320
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 15:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569960229;
	bh=Q3uy0Dbv/MURynswgqMD4GJ33IqjpLd69+K+ci+XrSU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AyYPbONqdiBqaLqRwFxXoDA77iIV0+OjOvkV/4YBX8XfJtOmDFPKLRlpvSXpvmXNs
	b/LofHlNY3VwFX5LeSiw5r+TPAC5lS9WGcOE8R6JE62doH/VxPHeGLOUFSXr3thY/1
	mVG8R1v2t6GZ5YVEotRwIKalhTEwz1YIDmRGG3q0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91K3nKM053666
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 15:03:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 15:03:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 15:03:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91K3n6E088263;
	Tue, 1 Oct 2019 15:03:49 -0500
Date: Tue, 1 Oct 2019 16:03:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20191001200348.GC18229@beryl>
References: <20190923192121.29814-1-a0271529@ti.com>
	<20190923192121.29814-2-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190923192121.29814-2-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com,
	Djordje Senicic <x0157990@ti.com>
Subject: Re: [master/thud/ti2019.03 2/4] tiovx-lib-host: add recipe for TI OpenVX library, host side
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
X-List-Received-Date: Tue, 01 Oct 2019 20:05:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 23, 2019 at 03:21:19PM -0400, Hongmei Gou wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  ...r-Yocto-build-and-add-RTOS-build-var.patch | 133 ++++++++++++++++++
>  .../recipes-ti/tiovx/tiovx-lib-host.bb        |  41 ++++++
>  2 files changed, 174 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
>  create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb

[...]


> diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> new file mode 100644
> index 00000000..6115b195
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "TI OpenVX HOST (Linux A15) side library"
> +DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. This package creates necessary libraries and header files for Linux Host side only. "
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX_manifest.html;md5=edd4fbfc6c1f01c20d49def4670efac0"
> +
> +require recipes-ti/includes/tisdk-paths.inc

ERROR: ParseError at .../meta-arago/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb:7: Could not include required file recipes-ti/includes/tisdk-paths.inc


> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PV = "01.00.00.00"
> +PR = "r1"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
> +SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
> +SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
> +
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = " tiovx-sys-iface "
> +
> +EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} "
> +EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=no "
> +
> +do_install () {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${includedir}/VX
> +    install -d ${D}${includedir}/VX/TI
> +    install -d ${D}${libdir}
> +    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
> +    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
> +    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
> +}
> +
> +FILES_${PN}-staticdev = "${libdir}"
> +FILES_${PN}-dev = "${includedir}"
> +
> +ALLOW_EMPTY_${PN} = "1"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

