Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3EDD3529B9
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2019 14:15:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HEEJFi122351
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568729659;
	bh=xJcQpS2KexQvEUQjcFo3g2mKhb/GPF5qYwCKF3KDGQ8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iGXcg/VjQ0SDt+PgQJDMAAoMMDyq5WL3Vk2f+3su0owaA1U0VAiIE4troS9LMwAzU
	DrVD+FA9vfbIaH2Mi/mnjeDG9LqIqv6hHprznRicsPz9HgYx9AcQ4uND3XCjAuN+nm
	8bHg5gPdSNoRgH4GYZ6hOAudKG3itCshusbktWq8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HEEJM6078327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 09:14:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 09:14:19 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HEEJSE092223;
	Tue, 17 Sep 2019 09:14:19 -0500
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <20190916172545.24627-1-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ead346af-089f-2065-4478-524c2390c604@ti.com>
Date: Tue, 17 Sep 2019 10:14:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916172545.24627-1-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Tue, 17 Sep 2019 14:15:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thanks,

Jake

On 9/16/2019 1:25 PM, Jianzhong Xu wrote:
> * add support for mobilenetv2
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 64667e59..1fd3063f 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,4 +1,4 @@
>   SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "23d158e4f18a3391e0d836bb3bd9a7c7c7ada7ee"
> +SRCREV = "c88b229e70db220ddbf394f3e77c3d5930a0e35a"
>   PV = "01.01.02.00"
> -PR = "r1"
> +PR = "r2"

