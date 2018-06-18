Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EC4C8529BF
	for <meta-arago@arago-project.org>;
	Mon, 18 Jun 2018 09:30:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5I9Umvd017645
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 04:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529314248;
	bh=I+lQdLN27eFVEcvy3kG+x6AgDeeGkaPwPjW0N6FHoT4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DxcZVZ7YSIHTvLIa/Gs+XSRh2TMfnM5w47se7BNwSay57Rk0HsigtKGTm+aPOJuks
	7U+0BkiPjCJa9EOzK25t9wPL+dDQJme0mrRNfsodwd1JHaLyEK9u/HX0VhDT9wnfuI
	AH9bt8QhhaawbOAfF7GZ6IfJH1T72JVZNnUF3DJ0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5I9UmuT032582
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 04:30:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 18 Jun 2018 04:30:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 18 Jun 2018 04:30:48 -0500
Received: from [172.24.158.83] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5I9Uk0R003013;
	Mon, 18 Jun 2018 04:30:47 -0500
To: Ramprasad N <x0038811@ti.com>, <meta-arago@arago-project.org>
References: <1529044919-10825-1-git-send-email-x0038811@ti.com>
	<1529044919-10825-2-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <8fb55967-4f73-eb85-b8ae-3dea6b1719f0@ti.com>
Date: Mon, 18 Jun 2018 15:00:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529044919-10825-2-git-send-email-x0038811@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko 1/1] omapdrmtest: Update SRCREV
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
X-List-Received-Date: Mon, 18 Jun 2018 09:30:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: Karthik Ramanan <a0393906@ti.com>


On 15-Jun-18 12:11 PM, Ramprasad N wrote:
> This update addresses the following:
>     *fix build issue with Android O
>     *Replace scaler wayland API with viewporter wayland API
>
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index 47d3245..51f06ae 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -7,8 +7,8 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
>   
>   inherit autotools pkgconfig
>   
> -PR = "r25"
> -SRCREV = "6d81a5c7dc998a914c482bd8aef0d6b2ffd3aa09"
> +PR = "r26"
> +SRCREV = "6877f56301e46e2ba377fc3dc18fcc1f333a3cce"
>   
>   EXTRA_OEMAKE = "CC="${CC}""
>   TARGET_CC_ARCH += "${LDFLAGS}"


