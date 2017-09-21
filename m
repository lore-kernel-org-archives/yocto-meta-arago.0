Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 38D39529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 23:23:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LNNTm5025950
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506036209;
	bh=JK0m/LV8124TieOFiXQhLX+JtgKt1PdFGiTGWdJ3uUw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vyN+seqd7Tdsr2C9Ljh47VFQ6TVRK3xPWNVwtdIpHq16e725IaO1uCAd3BBxj6odk
	Fm6f2mgQ6rQwV1nHqhFcON5IYrZtdyXAHlAGlBVO+Z8j7+4E3Mbs+qg2Fry2RGFV/8
	mxL2MHD977to4H5mOtPWp0vHdFRfuJWJd6pAc7cM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNNTNt004469
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:23:29 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 18:23:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 18:23:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNNSXA003206;
	Thu, 21 Sep 2017 18:23:28 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
	<1506033246-18916-4-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a54ccc33-f32d-3b4c-664b-4d75ded4436e@ti.com>
Date: Thu, 21 Sep 2017 19:23:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506033246-18916-4-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 3/5] tiovx-app-host:TI OpenVX IPC HOST implementation and sample application for running OpenVX conformance tests.
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
X-List-Received-Date: Thu, 21 Sep 2017 23:23:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/21/2017 6:34 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-ti/tiovx/tiovx-app-host.bb | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 recipes-ti/tiovx/tiovx-app-host.bb
>
> diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
> new file mode 100644
> index 0000000..a176171
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-app-host.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, and Host side IPC implementation "
> +DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test as well as additional TI specific tests. This package creates application which runs all the tests (7K-8K). Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_1.0.0.0_manifest.html;md5=de53bc8bf67ffa9a316fe48e3bacbf6d"
> +
> +require recipes-ti/includes/ti-paths-append.inc
Should also be tisdk-paths.inc

> +require tiovx-sys.inc
> +
> +DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
> +RDEPENDS_${PN} = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
> +
> +PR = "r1"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PROCLIST = "host"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += " TARGET_ROOTDIR=${STAGING_DIR_HOST} "
> +EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} TIOVXPATH=${TIOVX_INSTALL_DIR} IPCPATH=${IPC_INSTALL_DIR} "
> +EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface "
> +EXTRA_OEMAKE += " PROC_LIST=${PROCLIST} "
> +
> +do_install () {
> +    install -d ${D}${bindir}/
> +    install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
> +}
> +
> +FILES_${PN} += "${bindir}/*"
> +INSANE_SKIP_${PN} = "ldflags"


