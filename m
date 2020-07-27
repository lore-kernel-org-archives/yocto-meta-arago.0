Return-Path: <vigneshr@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 08D4E52A1C
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2020 13:57:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06RDt6H8096988
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2020 08:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595858106;
	bh=7IZnpx7wif5fTvioyQUxxS+RAmUUL3StAJf0PB4RLqI=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=SULNMzXDg6xrOJx/3hyvQA0UFwlH6JtFBwKWRM4jQ8Fg+SOgl1mGxXC7RYHewGD8l
	lCQFBv9XEh93AY+R0VMI5qEnSgNioodixxL0njo97gVQkveZrtvdGD2JZdszCMVyBs
	DH0dIRE/ch2g7SXVtosmIk36JehEhjFJ93bFoWf8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06RDt6OD020785
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2020 08:55:06 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 27 Jul 2020 08:55:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 27 Jul 2020 08:55:06 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06RDt4NA101700;
	Mon, 27 Jul 2020 08:55:05 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
References: <20200724141119.32341-1-vigneshr@ti.com>
Autocrypt: addr=vigneshr@ti.com; keydata=
	xjMEXxsMhhYJKwYBBAHaRw8BAQdAB4i06kW7yHPr/g/mja2KJlibJ04cIA7e1kdRwppetJ7N
	JVZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT7CrQQTFggAPhYhBIMc3s8/
	0yqUwNYqn4oDZlboDegtBQJfGwyGAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
	ACEJEIoDZlboDegtFiEEgxzezz/TKpTA1iqfigNmVugN6C2/ZAD6AyHr/Zd3Q2aYdXqiJl2j
	Mjs9lSjtmKSxtH697thA5LEA/2TrqiqqU3GTV3cjdIb4oi06Tbr9a1gImsVMM1CzMJkMzjgE
	XxsMhhIKKwYBBAGXVQEFAQEHQAzXddz0wIhfcz2wYjoqdmF0WrQr0TFDCEfLU7RvqS8qAwEI
	B8KVBBgWCAAmFiEEgxzezz/TKpTA1iqfigNmVugN6C0FAl8bDIYCGwwFCQlmAYAAIQkQigNm
	VugN6C0WIQSDHN7PP9MqlMDWKp+KA2ZW6A3oLbNaAPoDSyyuRVOb+e96aEUBPZkWpB0LL6xz
	mj/kdpM73TKdAgD+Jk98DcUB28did8Xy43OZN8sXG5yqLEQZhyCqN4hw0ws=
Message-ID: <da4a8002-79b0-e22c-c31f-ce67e0bbecbf@ti.com>
Date: Mon, 27 Jul 2020 19:25:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724141119.32341-1-vigneshr@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] switch-config: Update v4.1 branch to the latest version commit
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
X-List-Received-Date: Mon, 27 Jul 2020 13:57:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 24/07/20 7:41 pm, Vignesh Raghavendra wrote:
> New updates to switch-config repo's v4.1 branch now supports fiddling
> with PRU_ICSS ethernet interfaces. Hence move to the latest.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---

Gentle ping...

>  .../recipes-bsp/switch-config/switch-config_git.bb              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> index 6b619164..07368461 100644
> --- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> +++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> @@ -8,7 +8,7 @@ PR = "r4"
>  BRANCH ?= "v4.1"
>  BRANCH_aarch64 ?= "am65x-v1.0"
>  
> -SRCREV = "7efabd92177199205808ebd993267b04e8c2fb6a"
> +SRCREV = "15e8be3b1249ac4193031127565eec5b64ecaff1"
>  SRCREV_aarch64 = "3b31ce5fe8bd5a3560b89f2a709fb3e3b877326d"
>  
>  SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
> 

Regards
Vignesh

