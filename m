Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 84F9752A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:30:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DJUS4V112251
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536867028;
	bh=6GXLR3GgxIF9QE8InfoaRWIc/7zUNVLwIjbl5mmAL7A=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MuHIi8CAkL8q2FpKX1vwcP4QHGxL0YrwrA0Z3TXzU8EG670u74vHEnJ4iBWm92Iqo
	v8OnUMZmE5l1timf3DczpiMF4eb41SudZAYr8QeUHsQzxxjNwN1CPeS6WyzK8Pmxvq
	7rVN8gpdw7E9J6BRS4Jg8e8bDa4YUocURmx5ZTK8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJUS3E006339
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:30:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 14:30:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 14:30:28 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJURW5031819;
	Thu, 13 Sep 2018 14:30:27 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1536866245-50936-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <97b63779-9082-152c-2871-02f5c88ee26f@ti.com>
Date: Thu, 13 Sep 2018 15:30:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536866245-50936-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH] u-boot-k3-r5: update SYSFW to 2018.08b
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
X-List-Received-Date: Thu, 13 Sep 2018 19:30:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/13/2018 3:17 PM, Denys Dmytriyenko wrote:
> Also install and deploy versioned SYSFW binary with short symlink.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb          | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> index 0ff5658..57055c7 100644
> --- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> @@ -7,10 +7,12 @@ PKG_${PN}-dbg = "${PN}-dbg"
>   
>   COMPATIBLE_MACHINE = "k3"
>   
> -SYSFW_VER = "2018.07a"
> -SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
> +SYSFW_VER = "2018.08b"
> +SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
> +SYSFW_BINARY = "sysfw.bin"
> +SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
>   
> -SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
> +SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
>   SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
>   SRCREV_FORMAT = "sysfw"
>   
> @@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
>   SPL_BINARY_k3 = ""
>   
>   do_configure_append() {
> -	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
> +	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/sysfw.bin -l 0x40000

Should "${SYSFW_BINARY}" be used here instead of "sysfw.bin" to match 
do_install()?

>   }
>   
>   do_install_append() {
> -	install -m 644 ${WORKDIR}/sysfw.bin ${D}/boot/
> +	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
> +	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
>   }
>   
>   do_deploy_append() {
> -	install -m 644 ${WORKDIR}/sysfw.bin ${DEPLOYDIR}/
> +	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
> +	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
> +	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
>   }


