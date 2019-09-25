Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C5565520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 17:17:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHG9eM049361
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 12:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569431769;
	bh=nbqlgARn9RdjRxH+Olpj1Vm7f4d+EYKzcceGeTC6jP0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sqUpRvPQ1a7ZuYgTQ8vYDg1LlqMCFxmbM0azcTdpYTIQHuQqK+qLKZ5JU4/Rf4r0q
	gXl7qkB20EKDwz/mPzNgn8hzurPmFjGZWgjv17QjA8guihZ5xx1tdrZPtjSa3duXto
	7O8PQA5SIY4fjs1v6tdhaAMd/lqDsfYzRXnJk6SE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PHG9SZ099719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 12:16:09 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 12:16:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 12:16:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHG9Kb036670;
	Wed, 25 Sep 2019 12:16:09 -0500
Date: Wed, 25 Sep 2019 13:16:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190925171609.GE4163@beryl>
References: <1569421729-57631-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1569421729-57631-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] recipes-kernel: Add recipe for ivshmem-uio driver
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
X-List-Received-Date: Wed, 25 Sep 2019 17:17:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you send patches just to the list? Not critical, but this messes up my 
filters :) And I'm applying patches from Patchwork anyway...


On Wed, Sep 25, 2019 at 07:58:49PM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../conf/distro/include/arago-source-ipk.inc       |  4 ++++
>  .../recipes-kernel/uio/ivshmem-uio-driver_git.bb   | 27 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index 9e105b8..970e3e2 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -374,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
>  CREATE_SRCIPK_pn-uio-module-drv = "1"
>  SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
>  
> +CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
> +
>  CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>  SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"

Can you split it up and send source-ipk part to meta-arago, while the recipe 
itself rather belongs to meta-ti.


> diff --git a/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
> new file mode 100644
> index 0000000..f41842b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb

meta-ti/recipes-bsp would probably be better place.


> @@ -0,0 +1,27 @@
> +DESCRIPTION =  "Kernel drivers IVSHMEM UIO driver"

SUMMARY?


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
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

module.bbclass already package to be machine-specific automatically.


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
> -- 
> 1.9.1
> 

