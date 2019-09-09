Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BEF22529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 16:07:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89G6CYf039110
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568045172;
	bh=LzOMm4q0aKh27Lwhx+eD7zxiTGM3/3RSGRRVKk62ats=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ninq5FJGtfJD9XAtBEn6FA0DpiPA82DVqzashRemAY8SVj029PI06vXFDGNlvifbY
	UYekoYozUqyXK3jrB0WnNAxcDcAGu7HUo+k0xSJtlzB5Jw1lfvuJ9l4VHB9LMv7Bh9
	x9Ino0weKXH4aGK6WoheoHjVZBS9er8hCfHjYcvw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89G6Cxo001087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 11:06:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 11:06:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 11:06:12 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89G6CGr028141;
	Mon, 9 Sep 2019 11:06:12 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <20190909140550.11227-1-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <254eef53-e34b-1545-57a1-dd2b06ff7479@ti.com>
Date: Mon, 9 Sep 2019 12:06:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909140550.11227-1-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] packagegroup-arago-tisdk-addons: package tensorflow-lite-examples
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
X-List-Received-Date: Mon, 09 Sep 2019 16:07:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Upstream?

On 9/9/2019 10:05 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../packagegroup-arago-tisdk-addons.bbappend           | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> index c7f654d..c02f092 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> @@ -1,9 +1,9 @@
> -PR_append = "-tisdk56"
> +PR_append = "-tisdk57"
>   
> -EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite"
> -EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite"
> -EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite"
> -EXTRA_PACKAGES_append_am65xx = " tensorflow-lite"
> +EXTRA_PACKAGES_append_ti33x = " opencv tensorflow-lite-examples"
> +EXTRA_PACKAGES_append_ti43x = " opencv tensorflow-lite-examples"
> +EXTRA_PACKAGES_append_omap-a15 = " opencv tensorflow-lite-examples"
> +EXTRA_PACKAGES_append_am65xx = " tensorflow-lite-examples"
>   EXTRA_PACKAGES_append_keystone = " opencv"
>   EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
>   

