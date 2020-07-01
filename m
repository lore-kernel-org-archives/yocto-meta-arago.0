Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A2E6452A1C
	for <meta-arago@arago-project.org>;
	Wed,  1 Jul 2020 17:29:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 061HQlMA105239
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 12:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593624407;
	bh=h5834VVSNN01CnOV36uqF3+ibyv3knbXuyKEKGPxmWY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uulEdkRDIPZJelSmSIDFh5cTCP3g/BwC+Ao2TAK20bSDfCYg7nf1SX68Nj5aERDwc
	Q0a+HJ6yOEiskQJO3n5y7EnFIBmh45/oyFctTqoY6Bmt2LyI4FmBLJ3ULI4hwx09UE
	GprMHcu10GD34RYsQaCuZOA+d2EigdjgjTnawcvE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 061HQkEr129736
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 12:26:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 1 Jul 2020 12:26:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 1 Jul 2020 12:26:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 061HQkBU012424;
	Wed, 1 Jul 2020 12:26:46 -0500
Date: Wed, 1 Jul 2020 13:26:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <prao@ti.com>
Message-ID: <20200701172646.GD15879@beryl>
References: <20200630234852.28283-1-prao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200630234852.28283-1-prao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: .master/dunfell] ti-tisdk-makefile: update Rules.mk armv7 toolchain for R5 use
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
X-List-Received-Date: Wed, 01 Jul 2020 17:29:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same comment as with the previous patch - please fix the prefix so it doesn't 
go into the git history.


On Tue, Jun 30, 2020 at 06:48:52PM -0500, prao@ti.com wrote:
> From: Praveen Rao <prao@ti.com>
> 
> Update the Rules.make addition for the R5 use of the armv7  toolchain.
> 
> Signed-off-by: Praveen Rao <prao@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index a698dd34..a441d4b1 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -368,7 +368,7 @@ do_install_append_k3() {
>      cat >> ${D}/Rules.make << __EOF__
>  
>  # Add CROSS_COMPILE and UBOOT_MACHINE for the R5
> -export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-linux-gnueabihf-
> +export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-none-linux-gnueabihf-
>  UBOOT_MACHINE_R5=${K3_UBOOT_MACHINE_R5}
>  __EOF__
>  }
> -- 
> 2.17.1
> 

