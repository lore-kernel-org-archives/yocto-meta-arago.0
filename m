Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 538915298F
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2019 12:19:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RCIi0U130825
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 07:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561637924;
	bh=fCFjamCJKgEa6KtyCMvLX8509nrSFxwEARX8S9zITag=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=pz7ymbhI7NP9YzkArn2Qiz2ECPRk5FXK7Rh4u8dmLPXw0RHbrh/2bLyq0Tre+bDPL
	qYVAnOQMPlK1ybVOJk1elBpHKWhLKi5bh/6w/iZGBgn8Wmf8kJhWXGp+BbQjGiS01z
	fcT25KsAfpLXj0GKum7WFqVZV2HsYbPkACwOXeR4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RCIi6T115390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 07:18:44 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 27 Jun 2019 07:18:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 27 Jun 2019 07:18:44 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RCIhh4092610;
	Thu, 27 Jun 2019 07:18:43 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190625164806.25417-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <27d49be5-33ff-586f-aa3b-b8cc16742ff8@ti.com>
Date: Thu, 27 Jun 2019 08:18:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625164806.25417-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH v2 1/2] arm-compute-library: Upgrade to 19.05 version
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
X-List-Received-Date: Thu, 27 Jun 2019 12:19:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/25/2019 12:48 PM, Djordje Senicic wrote:
> - License checksum changed due to modified years, from: 2017-2018 to 2017-2019
> - License text is unchanged otherwise
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../arm-compute-library/arm-compute-library_git.bb       | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> index a2e19fd4..a33a2bc1 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "The ARM Computer Vision and Machine Learning library"
>   DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8948bc85114b3b716576ef8d732f034f"
>   
>   COMPATIBLE_MACHINE = "armv7a|aarch64"
>   
> @@ -20,11 +20,12 @@ SRC_URI = " \
>       file://0011-add-ti-benchmark-test-group.patch \
>   "
>   PR = "r0"
> -PV  = "19.02"
> +PV  = "19.05"
>   PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>   
> -BRANCH = "master"
> -SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
> +BRANCH = "branches/arm_compute_19_05"
> +SRCREV = "bd17a169153ee181100f3b31984968b66618ef3c"
> +
>   
>   S = "${WORKDIR}/git"
>   

