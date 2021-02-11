Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 3DA19529D2
	for <meta-arago@arago-project.org>;
	Thu, 11 Feb 2021 18:06:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BI6Asq063797
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 12:06:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613066770;
	bh=BZ2SS11Qz1dcvE9pJxgW7r96/DkkO7zwbPgtlhbG/8I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=KEHp34QgSyuwrVUgGn0K8Xl3jZU7VVe9j7ZeE1G9h+POecnIlNfbkJ9vhp/7qmFgg
	vKUZhTMcq4NtVbP50BJFC7caGhxN2/QC21naMPHl2d+doDM2nrT+tASrBV6MehtJLZ
	7c103TJsO4h3JEg/LNe/n6ypKgfHvBrFuG1ssr+Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BI6AlW017424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Feb 2021 12:06:10 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 11 Feb 2021 12:06:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 11 Feb 2021 12:06:10 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BI6A2d085461;
	Thu, 11 Feb 2021 12:06:10 -0600
To: Aparna Balasubramanian <aparnab@ti.com>, <meta-arago@arago-project.org>,
	<dmurphy@ti.com>
References: <20210211130003.8210-1-aparnab@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <1c99e4b4-ed84-4bf2-0aec-4efb68ef375a@ti.com>
Date: Thu, 11 Feb 2021 12:06:10 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211130003.8210-1-aparnab@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [[master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Thu, 11 Feb 2021 18:06:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/11/2021 7:00 AM, Aparna Balasubramanian wrote:
> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>

Can you add some description?
Looks like this patch brings am64xx-sk support.

> ---
>   .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> index f0824a94..d8eb5918 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>   DEPENDS += "alsa-lib"
>   
>   PE = "1"
> -PR = "r10"
> +PR = "r11"
>   PV_append = "+git${SRCPV}"
>   
> -SRCREV = "b0459d9aa364d07699ae6f273280358aae509d56"
> +SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
>   BRANCH ?= "master"
>   
>   SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> 

