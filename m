Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A81A6520DE
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2019 08:43:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8frdW050560
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569832913;
	bh=9VEekQ8hjbErXA8RwBm8R5dk8Lh4fFhPAgMKxme4ryI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dzurAqX2A+567Zfk0TVaXernZYkcJQtLFhi/rR0c/GOrC43uqSI2XHMOlzoAcR1S8
	oXMu1VBPe+t16BjkXn7ccU7pgmTYKPuwmRoNSoOk6V6aJpd1Dg8MwYNEzYNekVd6KE
	NcX+Nh/rvhXsi6YLXKtpr29nLh51mcLwWgRdcN1E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8frLw130702
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:41:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 03:41:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 03:41:43 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8fpnT122852;
	Mon, 30 Sep 2019 03:41:52 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <1569832579-42422-1-git-send-email-nikhil.nd@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <507b3f6a-7145-deda-a6c3-0e87f6d51bd4@ti.com>
Date: Mon, 30 Sep 2019 14:11:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1569832579-42422-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master PATCH v3] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Mon, 30 Sep 2019 08:43:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 30/09/19 2:06 PM, Nikhil Devshatwar wrote:
> This is external kernel module which enables userspace io over the
> Jailhouse ivhsmem (inter VM shared memory)
> This driver is useful to test the inter VM communication.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Sent on the wrong list, please ignore
Nikhil D

> ---
> Changes from v2:
> * Fix SUMMARY v/s DESCRIPTION
>
> Changes from v1:
> * Split the ivshmem recipe separately
> * Add summary and remove PACKAGE_ARCH define
>
>   recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27 +++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>
> diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> new file mode 100644
> index 0000000..a9f1455
> --- /dev/null
> +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =  "Kernel driver for IVSHMEM based UIO driver"
> +DESCRIPTION = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
> +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> +
> +inherit module
> +
> +RDEPENDS_${PN} = "jailhouse"
> +
> +PROTOCOL = "git"
> +BRANCH = "jailhouse"
> +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> +SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> +
> +do_compile_prepend() {
> +    cd ${S}/kernel_module/uio
> +}
> +
> +do_install() {
> +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +}


