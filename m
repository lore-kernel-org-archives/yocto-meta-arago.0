Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5917152978
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2019 21:19:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JLI6Ju081733
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 16:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568927886;
	bh=kEi+ZH4K3K2/civV/KrSJAEQiO2zi7lqBM4jBb5/8UA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=N6XUAuS5An3c02J6KxUpCG/wP1pKvrU+6bMWNPbxg8iJr9bzNOal+Rw4iWlrIhnKH
	igsV2u+2lnTjF0eH2kg6NcWD8G865dhrryNoZIgL7aouDILp9fdEBSMgHoCieS0QCI
	LAhHdix9ru6qjW6ORkbsx6pvAoe7KkRoDR0KvRbY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JLI6VT041691
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 16:18:06 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 19 Sep 2019 16:18:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 16:18:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JLI5hb121946;
	Thu, 19 Sep 2019 16:18:05 -0500
Date: Thu, 19 Sep 2019 17:18:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190919211805.GE5351@beryl>
References: <1568913757-151704-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568913757-151704-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v2] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Thu, 19 Sep 2019 21:19:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 19, 2019 at 10:52:37PM +0530, Nikhil Devshatwar wrote:
> Add source packages for ATF and external kernel modules
> Also define the src package proprties for these
> ---
>  meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 14 ++++++++++++++
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb            |  6 ++++++
>  2 files changed, 20 insertions(+)
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

Still here^^^


> +
>  CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>  SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
>  
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index fbdc735..ba2df44 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -39,6 +39,12 @@ UTILS_append_k2g = " \
>  UTILS_append_k3 = " \
>      jailhouse-src \
>      ti-sci-fw-src \
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

