Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 57427529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 23:20:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LNKYda009614
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506036034;
	bh=8zVIZ3k3hLyhNETW/PETJItGDtuPao44D7Uvl5EA3y8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=veEGJ8NtYvF5VgvS1EGef7Q3IY4gxJcvOixk6bMWXK9calQ1ue7GQ/ZsDLCN22wNN
	b2JV7wwnUuwlYb40CGVLxbHSK/BjNcceEFYl7yU44vt06i8+rjRbamaNp1Yl4bPMH1
	0Yj16lBMoN+34zoqfTtrXbgESCdf/1lt9jrvphPM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNKTva001173
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:20:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 18:20:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 18:20:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNKSPC000698;
	Thu, 21 Sep 2017 18:20:28 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
	<1506033246-18916-2-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <efb9f0eb-23a1-f8fd-2cc3-7b10bd9eeaff@ti.com>
Date: Thu, 21 Sep 2017 19:20:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506033246-18916-2-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 1/5] tiovx-sys-iface: Add interface header files between TIOVX library and IPC implementation
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
X-List-Received-Date: Thu, 21 Sep 2017 23:20:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/21/2017 6:34 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-ti/includes/tisdk-paths.inc |  3 +++
>   recipes-ti/tiovx/tiovx-sys-iface.bb | 32 ++++++++++++++++++++++++++++++++
>   recipes-ti/tiovx/tiovx-sys.inc      |  5 +++++
>   3 files changed, 40 insertions(+)
>   create mode 100644 recipes-ti/tiovx/tiovx-sys-iface.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-sys.inc
>
> diff --git a/recipes-ti/includes/tisdk-paths.inc b/recipes-ti/includes/tisdk-paths.inc
> index e6c0e94..300f352 100644
> --- a/recipes-ti/includes/tisdk-paths.inc
> +++ b/recipes-ti/includes/tisdk-paths.inc
> @@ -1 +1,4 @@
>   require recipes-ti/includes/arago-paths.inc
> +
> +export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
> +export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
> new file mode 100644
> index 0000000..f4728d9
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
> +DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
> +
> +require recipes-ti/includes/ti-paths-append.inc
Now that you modified "tisdk-paths.inc", you need to update that here

> +require tiovx-sys.inc
> +
> +PR = "r1"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +#   Install the header files
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
> +    cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
> +    install -d ${D}/${base_libdir}/firmware
> +    install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx
> +    install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
> +}
> +
> +FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
> +PACKAGES =+ "${PN}-firmware"
> +FILES_${PN}-firmware = "${base_libdir}/firmware/*"
> +
> +INSANE_SKIP_${PN}-firmware = "arch"
> +
> diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
> new file mode 100644
> index 0000000..fc24947
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-sys.inc
> @@ -0,0 +1,5 @@
> +PV = "01.00.00.00"
> +
> +BRANCH="master"
> +SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
> +SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"


