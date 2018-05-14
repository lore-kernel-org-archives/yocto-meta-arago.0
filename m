Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D61F852090
	for <meta-arago@arago-project.org>;
	Mon, 14 May 2018 17:00:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4EH0a5C015880
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 12:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526317236;
	bh=tvUpZtJdEFwq81suAWKAkfXq4NwEnz70IG57bEN/mCQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=YooKYrRjK6FNRVsBgOcZowfC07IsIPMsuQ0j1OS+RVCGkvfVKWx1sSAY+E5CasJnM
	O3jM1179HisuSHiTcgBiYGMxZTNlt0N4bnPSveC/pLF5B7Z2qzFLh3shi/NHg1YhFV
	3kDHQ4HnHwro3DnZ65Ly/nteFDWK5iJ1QgWcHBvQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EH0aTv005444
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 12:00:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 14 May 2018 12:00:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 14 May 2018 12:00:36 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EH0ZBJ021438
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 12:00:35 -0500
To: <meta-arago@arago-project.org>
References: <1526316524-26044-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b7883098-2b9d-0537-be20-8a79b936b75f@ti.com>
Date: Mon, 14 May 2018 13:00:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526316524-26044-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH v2] ti-tisdk-makefile: linux-dtbs: force single threaded make
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
X-List-Received-Date: Mon, 14 May 2018 17:00:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I suppose the commit message no longer makes sense. I will send an update.


On 5/14/2018 12:48 PM, Jacob Stiffler wrote:
> * The device tree merge cannot handle multiple DTBs using multiple
>    threads in parallel.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes: loop over DTBs, following OE procedure.
>
>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs           | 4 +++-
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> index 012ddc7..d1d7e02 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
> @@ -4,7 +4,9 @@ linux-dtbs:
>   	@echo     Building the Linux Kernel DTBs
>   	@echo =====================================
>   	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
> -	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_DEVICETREE__
> +	@for DTB in __KERNEL_DEVICETREE__; do \
> +		$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $$DTB; \
> +	done
>   
>   linux-dtbs_install:
>   	@echo =======================================
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index f2f16f5..4fdd99f 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -50,7 +50,7 @@ SRC_URI = "\
>       file://Makefile_barcode-roi \
>   "
>   
> -PR = "r85"
> +PR = "r86"
>   
>   MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>                           refresh-screen \


