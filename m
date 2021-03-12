Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 6870752A9E
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 16:39:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CGdu2t114541
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 10:39:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615567196;
	bh=+OkZBgRnsbQIz38u7Nh1Io/1NSgyE2moBNHMNZmnjpw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RhjweReeiL8HiW301rbKRkGVGN/PRdfsTYKKb3vfQ8VdUU7rxTwkUxsiURQFDIXoE
	kEBwIk3vIcgh8lsxWX/V2Jxichg/nPjf4gkhfdA7fO9Sns8C5BuBmkI67FOtk457/m
	f93vN1IxaxklZ5pt+c0UbeirdubMTUG/d+FuazBU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CGduQ5016684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 10:39:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 10:39:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 10:39:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CGduIg111502;
	Fri, 12 Mar 2021 10:39:56 -0600
Date: Fri, 12 Mar 2021 10:39:56 -0600
From: Nishanth Menon <nm@ti.com>
To: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <20210312163956.ti7erugzz6hcvx2m@carmaker>
References: <20210312161817.2581-1-aparnab@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210312161817.2581-1-aparnab@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 12 Mar 2021 16:39:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 10:18-20210312, Aparna Balasubramanian wrote:

Can you please add change information in the commit message?

Is this still 20200120 are'nt we in 2021?
> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> index d8eb5918..be8bea98 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>  DEPENDS += "alsa-lib"
>  
>  PE = "1"
> -PR = "r11"
> +PR = "r12"
>  PV_append = "+git${SRCPV}"
>  
> -SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
> +SRCREV = "3543cba63326976b5fb184c88b56158e91b7626a"
>  BRANCH ?= "master"
>  
>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

