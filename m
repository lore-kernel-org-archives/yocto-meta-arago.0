Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTP id 01C5B52BCC
	for <meta-arago@arago-project.org>;
	Wed,  6 Oct 2021 12:33:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 196CXiCs099598;
	Wed, 6 Oct 2021 07:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1633523625;
	bh=8UN+k3TEvV7arFBzxcJP9lb0WkPudbiheLdES5aXmRg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=w9bgKggwG3T/YFfOGtOs/a0oLQGEIGZbBYlqKzEmDQVo57OXPbQwlU5BKDDfRKv82
	qYW/OmN0krsA7DyiJkB0vruxrgfTCaHRoxzz1EopCo+JFwLr0yOc9GNopBCZjVZaIX
	bnppx8b6MTdHNiGNqjAmaVtvKJo0+yf71Dcs+S2c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 196CXipI018264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Oct 2021 07:33:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Wed, 6 Oct 2021 07:33:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Wed, 6 Oct 2021 07:33:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 196CXgkt021365;
	Wed, 6 Oct 2021 07:33:43 -0500
Date: Wed, 6 Oct 2021 18:03:41 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Priya N S <priya.ns@mistralsolutions.com>
Message-ID: <20211006123341.zr5rp7mfmhv3rase@NiksLab>
References: <20210928110455.38124-1-priya.ns@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210928110455.38124-1-priya.ns@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [dunfell PATCH] ti-tisdk-makefile: Remove barcode-roi snippet
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
X-List-Received-Date: Wed, 06 Oct 2021 12:33:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:34-20210928, Priya N S wrote:
> * barcode-roi support is dropped from meta-arago due to breakage with
>   OpenCV 4.1
> * Remove the makefile snippet from the installer toplevel makefile
> 
> Note:
> * barcode-roi makefile snippet needs to be added back once barcode-roi
>   breakage with OpenCV 4.1 is fixed.
> 
> Signed-off-by: Priya N S <priya.ns@ti.com>
Acked-by: Nikhil Devshatwar <nikhil.nd@ti.com>

> ---
> 
> Hi All,
> This patch removes the barcode-roi makefile snippet from SDK top-level
> Makefile for AM335x and AM437x platforms.
> 
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index d2201675..1320ec50 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -97,7 +97,6 @@ MAKEFILES_append_ti33x = " u-boot-spl \
>                             cryptodev \
>                             ti-sgx-ddk-km \
>                             pru-icss \
> -                           barcode-roi \
>                             uio-module-drv \
>  			   mmwavegesture-hmi \
>                             pdm-anomaly-detection \
> @@ -112,7 +111,6 @@ MAKEFILES_append_ti43x = " u-boot-spl \
>                             ti-sgx-ddk-km \
>                             cmem-mod \
>                             pru-icss \
> -                           barcode-roi \
>                             uio-module-drv \
>  			   mmwavegesture-hmi \
>                             pdm-anomaly-detection \
> -- 
> 2.19.1.windows.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

