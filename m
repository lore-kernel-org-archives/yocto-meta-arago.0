Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4607652A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:05:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI50C2028224
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930700;
	bh=/8FJSTIs/XObKNMz80aPlxzwlxIcwXYPegu9DVRe+oQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Dm96MHUzERxBNzT2mcTyE99FHnm+LSWvGPdZ0iHYdGbu/3qUhQT66c+4VtDt8qHu8
	Y7Kbp9ejmkiOZIw2yzi6Ar4Q/2634l9yfFx6dZFs2sKEHqRlStjxoxXmRCsovbt4OO
	YXh+aAbn86SQWIQ3VG7nPI8O2DDD/qzIhNEOGt1g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI50Ir025271
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:05:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:04:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:04:59 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI4xNe005637;
	Wed, 20 Sep 2017 13:04:59 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505921543-25981-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2e3998c1-a514-ba43-c6fc-1671b74e470f@ti.com>
Date: Wed, 20 Sep 2017 14:04:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505921543-25981-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 1/2 v3] uio-test-pruss: add support for k2g
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
X-List-Received-Date: Wed, 20 Sep 2017 18:05:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Please follow up by upstreaming to meta-ti.


On 9/20/2017 11:32 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v3 change: extend DEVICE_NAME to the k2g family
>
>   recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> index 7297c8b..f611b0b 100644
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> @@ -1,6 +1,10 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>   
>   PV = "1.0.2.0"
>   
>   # Corresponds to version 01.00.02.00
>   UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +
> +DEVICE_NAME_append_k2g = "k2g"


