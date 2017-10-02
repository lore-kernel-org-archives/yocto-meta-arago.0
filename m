Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id ED426529E3
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 13:44:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92DiJxK013023
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506951859;
	bh=O2MWX19dhIsCoPj4rJYB5O6NmACtcqOsn1vMirMlzrg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QOK3/3yewgF7DMpDIQv2iydvtfDhfKoR1Nrj7hXq7gc/XbxrVyjrXXAnKuoTzAtIO
	R3dRr/dZl+aXg/Fyy8i7VwXvscZAk3etOqTFCuqzZ/j3S4uc154JlpoRUSTQotUmrE
	5uBEwSx/Ws6k2bOYtFVPJPLf4+t3U5JLqSl5n6xM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92DiEB8029372
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:44:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 08:44:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 08:44:14 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92DiEj9005774;
	Mon, 2 Oct 2017 08:44:14 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
	<1506709407-16448-7-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <142ce6cb-7495-da1c-f6f4-9ae92a64b329@ti.com>
Date: Mon, 2 Oct 2017 09:44:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506709407-16448-7-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][morty-x11-experimen tal][PATCH 06/ti-xsgx-ddk-um: sgx ddk um recipe for X11 support
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
X-List-Received-Date: Mon, 02 Oct 2017 13:44:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/29/2017 2:23 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../libgles/ti-xsgx-ddk-um_1.15.4564147.bb         | 86 ++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
>
> diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> new file mode 100644
> index 0000000..c959e14
> --- /dev/null
> +++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> @@ -0,0 +1,86 @@
> +SUMMARY = "X11 Userspace libraries for PowerVR SGX chipset on TI SoCs"
> +HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BRANCH = "ti-img-sgx/${PV}"
> +
> +SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
> +
> +# There's only hardfp version available
> +python __anonymous() {
> +    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> +    if not tunes:
> +        return
> +    pkgn = bb.data.getVar("PN", d, 1)
> +    pkgv = bb.data.getVar("PV", d, 1)
> +    if "callconvention-hard" not in tunes:
> +        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> +}
> +
> +TARGET_PRODUCT_omap-a15 = "jacinto6evm"
> +TARGET_PRODUCT_ti33x = "ti335x"
> +TARGET_PRODUCT_ti43x = "ti437x"
> +
> +INITSCRIPT_NAME = "rc.pvr"
> +INITSCRIPT_PARAMS = "defaults 8"
> +
> +inherit update-rc.d
> +
> +PR = "r0"
> +PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
> +
> +DEPENDS += "udev"
> +RDEPENDS_${PN} += "libudev"
> +
> +
> +RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
> +RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
> +RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
> +
> +RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
> +RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
> +RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
> +
> +RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-xsgx-ddk-um-linux"
> +RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-xsgx-ddk-um-linux-dev"
> +RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-xsgx-ddk-um-linux-dbg"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> +}
> +
> +SYSROOT_DIRS_append = "/usr/local"
> +
> +FILES_${PN} +=  "/usr/local/*"
> +
> +FILES_${PN}-staticdev +=  "/usr/local/*"
> +
> +PACKAGES =+ "${PN}-plugins"
> +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
> +FILES_${PN}-plugins += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
> +FILES_${PN}-staticdev += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
> +RDEPENDS_${PN} += "${PN}-plugins"
> +
> +SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng12.a /usr/local/XSGX/lib/libpng12.so /usr/local/XSGX/lib/libpng12.so.0  /usr/local/XSGX/lib/libpng12.so.0.56.0"

Can you just prevent these from being installed by removing them in the 
do_install task. This will also prevent them from corrupting any packages.

> +
> +
> +ALLOW_EMPTY_${PN}-plugins = "1"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +
> +INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
> +INSANE_SKIP_${PN}-plugins = "dev-so"
> +INSANE_SKIP_${PN}-dev = "dev-so"
> +INSANE_SKIP_${PN}-staticdev = "dev-so"
> +INSANE_SKIP_${PN} += "already-stripped"
> +
> +CLEANBROKEN = "1"
> +


