Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DF2EF52090
	for <meta-arago@arago-project.org>;
	Mon, 14 May 2018 16:38:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4EGcE3x003848
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 11:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526315894;
	bh=yzdwBRoCX9ZfZPZis8HELKKRZ3bWXh/Syuxvah2Pdk4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HE72l+3AvIPhgo8GZ8sIR1buGAOqoqe4o+UXUEyHWEibgHeSnd0DrwTJ0PIqZaWQP
	qnqhqDFjhkrh1fX3y0CPNuyqJFFhBszf6DcU85awTfeeGXaW7wROx5iDcbzE2qVXTQ
	8kLmWb918jmPEegrTjw8/vuErrcwSW7N+z7whDMI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EGcEfV023350
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 11:38:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 14 May 2018 11:38:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 14 May 2018 11:38:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EGcD2v030548;
	Mon, 14 May 2018 11:38:13 -0500
Date: Mon, 14 May 2018 12:38:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180514163812.GA4099@edge>
References: <1526313709-23262-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1526313709-23262-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-tisdk-makefile: linux-dtbs: force single threaded make
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
X-List-Received-Date: Mon, 14 May 2018 16:38:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 14, 2018 at 12:01:49PM -0400, Jacob Stiffler wrote:
> * The device tree merge cannot handle multiple DTBs using multiple
>   threads in parallel.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs             | 2 +-
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> index 012ddc7..9d8ec1c 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> @@ -4,7 +4,7 @@ linux-dtbs:
>  	@echo     Building the Linux Kernel DTBs
>  	@echo =====================================
>  	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
> -	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_DEVICETREE__
> +	$(MAKE) -j 1 -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_DEVICETREE__

Why not do it the way kernel-devicetree.bbclass does it:
http://cgit.openembedded.org/openembedded-core/tree/meta/classes/kernel-devicetree.bbclass#n52

	for DTB in ${KERNEL_DEVICETREE}; do
		DTB=`normalize_dtb "${DTB}"`
		oe_runmake ${DTB}
	done

Speedwise it's the same as doing it in single thread, but is consistent with 
how kernel is built in OE/Yocto.


>  
>  linux-dtbs_install:
>  	@echo =======================================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index f2f16f5..4fdd99f 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -50,7 +50,7 @@ SRC_URI = "\
>      file://Makefile_barcode-roi \
>  "
>  
> -PR = "r85"
> +PR = "r86"
>  
>  MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>                          refresh-screen \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

