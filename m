Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 31CF1520DE
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2019 16:40:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JGdZEu061410
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 11:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568911175;
	bh=gbD8eZgjwc6qjGjpvVySTPhSG2yeugpNYoAA+m007c4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MiLgXLDywKU45FIxjcxKyuket+J+/LGpZQfw2fnlOSoaFM67FcCZVSGIQSp/4ve3F
	u/W5HqJahlEoqGkcPEv0sEKinpeMi2+Ri1LyCZQZUgiil0eoxlDE+W4IoYCDTi2TOW
	DOa3axVS6hNFp4DvAAPsRG07ioP0hYmdhy9wFm40=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JGdZ8s099472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 11:39:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 19 Sep 2019 11:39:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 11:39:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JGdYZj065588;
	Thu, 19 Sep 2019 11:39:34 -0500
Date: Thu, 19 Sep 2019 12:39:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190919163934.GD5351@beryl>
References: <1568887469-57690-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568887469-57690-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Thu, 19 Sep 2019 16:40:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 19, 2019 at 03:34:29PM +0530, Nikhil Devshatwar wrote:
> Add source packages for ATF and external kernel modules
> Also define the src package proprties for these
> ---
>  meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 14 ++++++++++++++
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb            |  7 +++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index 6e56c77..970e3e2 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -142,6 +142,10 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
>  CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
>  SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
>  
> +CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
> +SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
> +
>  CREATE_SRCIPK_pn-linux-ti-staging = "1"
>  SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
>  SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
> @@ -181,6 +185,7 @@ SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
>  
>  CREATE_SRCIPK_pn-cryptodev-module = "1"
>  SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-cryptodev-module = "true"
>  
>  CREATE_SRCIPK_pn-cmem-mod = "1"
>  SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
> @@ -196,6 +201,11 @@ SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
>  
>  CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
>  SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
> +
> +CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
> +SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
>  
>  CREATE_SRCIPK_pn-ti-gc320-driver = "1"
>  SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
> @@ -364,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
>  CREATE_SRCIPK_pn-uio-module-drv = "1"
>  SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
>  
> +CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
> +
>  CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>  SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
>  
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index fbdc735..558955c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -39,6 +39,13 @@ UTILS_append_k2g = " \
>  UTILS_append_k3 = " \
>      jailhouse-src \
>      ti-sci-fw-src \
> +    ivshmem-uio-driver-src \

???


> +    arm-trusted-firmware-src \
> +"
> +
> +UTILS_append_j7-evm = " \
> +    ti-img-encode-decode-src \
> +    ti-img-rogue-driver-src \
>  "
>  
>  UTILS_append_am65xx = " \
> -- 
> 1.9.1
> 

