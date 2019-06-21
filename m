Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 19EAB52980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:02:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD1OaV120967
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122084;
	bh=F4TWX23Fx2JmiK+mUF+rdHM5hUbsXHlfO+lB3SWbVik=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=YsLer876F/4iLUpHP6cxHGsn1lYrMDDOvnacf80QdwDYQxELep/ZNoTASHK6th75w
	8PLWw91a+FeZTLWXGAqIA+VxHj3EyQ7LblDYxWgfhpR8x0vHR0EpPfyJOGkHx6LCaA
	8mJDOZYoSN4oDdGyZxaLtQ1rM8rwH/2PsoT5FSKs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD1Otp016624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:01:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:01:23 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD1NRK021541;
	Fri, 21 Jun 2019 08:01:23 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190619181106.17439-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ed32b1b0-4118-f390-ccb0-14044c458704@ti.com>
Date: Fri, 21 Jun 2019 09:01:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619181106.17439-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH 1/2] tidl-api: Add to dra76xx build
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
X-List-Received-Date: Fri, 21 Jun 2019 13:02:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 2:11 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index fbea9aa8..b9329403 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
>   
>   PR = "${INC_PR}.0"
>   
> -COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "dra7xx-evm|m57xx-evm|am57xx-hs-evm"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit python3native

