Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 40F86529E8
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 20:21:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97KJq7O122449
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 15:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570479592;
	bh=l+dfXNGQlbX9xl7+QoRJkVLCzL2zYlRq6eWrztaVwDU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZY/h4Qk5aTW0yV8MSR8ErfAnEEdmVwVQlkz4MiY1UwhUxlNdx1Ti57EIlFS8QwQux
	wkSs2/u1ubDrqlJekmXheDqE67c9NeG7iS1Ni9DYJV5P7nOwfLQTGzcjMtKf/W9SZ2
	eUh4qGATobp/BlTaW4iOYgIrXxG+QSkIEk6IjcZI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97KJqKP057154
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 15:19:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 7 Oct 2019 15:19:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 7 Oct 2019 15:19:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97KJpPO027310;
	Mon, 7 Oct 2019 15:19:51 -0500
Date: Mon, 7 Oct 2019 16:19:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20191007201951.GD2144@beryl>
References: <20190923192121.29814-1-a0271529@ti.com>
	<20190923192121.29814-2-a0271529@ti.com>
	<20191001200348.GC18229@beryl>
MIME-Version: 1.0
In-Reply-To: <20191001200348.GC18229@beryl>
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
X-List-Received-Date: Mon, 07 Oct 2019 20:21:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping?

On Tue, Oct 01, 2019 at 04:03:49PM -0400, Denys Dmytriyenko wrote:
> On Mon, Sep 23, 2019 at 03:21:19PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Djordje Senicic <x0157990@ti.com>
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  ...r-Yocto-build-and-add-RTOS-build-var.patch | 133 ++++++++++++++++++
> >  .../recipes-ti/tiovx/tiovx-lib-host.bb        |  41 ++++++
> >  2 files changed, 174 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
> >  create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> 
> [...]
> 
> 
> > diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> > new file mode 100644
> > index 00000000..6115b195
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> > @@ -0,0 +1,41 @@
> > +SUMMARY = "TI OpenVX HOST (Linux A15) side library"
> > +DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. This package creates necessary libraries and header files for Linux Host side only. "
> > +
> > +LICENSE = "TI-TSPA"
> > +LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX_manifest.html;md5=edd4fbfc6c1f01c20d49def4670efac0"
> > +
> > +require recipes-ti/includes/tisdk-paths.inc
> 
> ERROR: ParseError at .../meta-arago/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb:7: Could not include required file recipes-ti/includes/tisdk-paths.inc
> 
> 
> > +
> > +COMPATIBLE_MACHINE = "dra7xx"
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +PV = "01.00.00.00"
> > +PR = "r1"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
> > +SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
> > +SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
> > +
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS = " tiovx-sys-iface "
> > +
> > +EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} "
> > +EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=no "
> > +
> > +do_install () {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> > +    install -d ${D}${includedir}/VX
> > +    install -d ${D}${includedir}/VX/TI
> > +    install -d ${D}${libdir}
> > +    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
> > +    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
> > +    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
> > +}
> > +
> > +FILES_${PN}-staticdev = "${libdir}"
> > +FILES_${PN}-dev = "${includedir}"
> > +
> > +ALLOW_EMPTY_${PN} = "1"
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

