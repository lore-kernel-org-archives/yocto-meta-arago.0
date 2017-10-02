Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 34528529E3
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 13:41:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92DfOsg012756
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506951684;
	bh=sEjj67xoTT+nI4aBV/MgF5Yie8PXfseRClOAv8xYAyM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=WnvwQ+gb0RmBMoBwWlYfLV9igJHb3yZDN/7T6rgfR4+lwssA5FbBSsuuCezsWKbXp
	0phIVJMHFTcz7grYhvuJBdWo2GT/Q44K7ptnAf8vPTZU4qSqSsTazL360eC+Soy8KA
	sKFtIvx06Wth6gUXQEvQ86F7iN3g9pRW3Ixc3Qxc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92DfJmm024984
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:41:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 08:41:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 08:41:18 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92DfIZA002521;
	Mon, 2 Oct 2017 08:41:18 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
	<1506709407-16448-6-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a0f805fe-a64c-7ad8-1893-c0f2cec23269@ti.com>
Date: Mon, 2 Oct 2017 09:41:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506709407-16448-6-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][morty-x11-experimen tal][PATCH 05/ti-xsgx-ddk-km: sgx ddk km recipe for X11 support
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
X-List-Received-Date: Mon, 02 Oct 2017 13:41:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This should probably be the first patch in the set as it appears that 
all previous patches reference this recipe.

And please try to clean up the extra new lines at the end of this recipe.

On 9/29/2017 2:23 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
>
> diff --git a/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
> new file mode 100644
> index 0000000..d51d9df
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/ti-xsgx-ddk-km_1.15.4564147.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION =  "X11 Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
> +HOMEPAGE = "https://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental"
> +LICENSE = "MIT | GPLv2"
> +LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
> +
> +inherit module
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> +
> +MACHINE_KERNEL_PR_append = "m"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "virtual/kernel"
> +
> +PROVIDES = "omapdrm-pvr"
> +
> +RPROVIDES_${PN} = "omapdrm-pvr"
> +RREPLACES_${PN} = "omapdrm-pvr"
> +RCONFLICTS_${PN} = "omapdrm-pvr"
> +
> +BRANCH = "ti-img-sgx/${PV}/k4.9"
> +
> +SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "24ae481718cc24dc2da55c89b53c39558e32061e"
> +
> +TARGET_PRODUCT_omap-a15 = "jacinto6evm"
> +TARGET_PRODUCT_ti33x = "ti335x"
> +TARGET_PRODUCT_ti43x = "ti437x"
> +
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
> +
> +do_compile_prepend() {
> +    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
> +}
> +
> +do_install() {
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +}
> +
> +
> +


