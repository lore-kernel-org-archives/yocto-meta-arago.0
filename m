Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595F0C04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:26:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.242.1663953981820225286
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AsOwKP3F;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NHQ4Xq065292;
	Fri, 23 Sep 2022 12:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663953964;
	bh=8mnAwvaSAkRqxKYzv4DXIqCdio8WzCdbhoZpx0L5Xlc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AsOwKP3FCmY+obUCyCXTnmmsRqY1rFfgqx7usHYSNP2XTmLIWucgoADZ5kywKoaxy
	 eUKz99n/prPI67vb6xP0DHpLgO2NBiwPwegaR4XVh2nLG02W3mONz0n7IDDR+dlGhl
	 h9DxaQRZ6I78YBk9bPNUM8M9R6CRiSXzRi1Zmi7k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NHQ41b053469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Sep 2022 12:26:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 12:26:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 12:26:04 -0500
Received: from [10.250.37.187] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NHQ3BD025721;
	Fri, 23 Sep 2022 12:26:04 -0500
Message-ID: <1c6864e9-829f-8372-eca7-eda9cf1a14c4@ti.com>
Date: Fri, 23 Sep 2022 12:26:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH] websocketd: enable network
 access for compile task
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220920192616.13717-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220920192616.13717-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14042



On 9/20/2022 14:26, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Since go modules do own fetching during compile time.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> index 2ec6a19a..2d90f8fe 100644
> --- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> @@ -12,7 +12,9 @@ SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
>   
>   # bitbake only exports proxy variables during fetching, but go handles
>   # module fetching on its own during compile and needs proxy settings
> +# along with network access for the task
>   export http_proxy


We also need "export https_proxy" in the recipe.  Do you want to submit 
a v2 so that we have both required changes in one commit?


> +do_compile[network] = "1"
>   
>   # Development package contains all the examples in different languages
>   INSANE_SKIP:${PN}-dev = "file-rdeps"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

