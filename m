Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2BEEA529D1
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 13:15:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFDF9a6008439
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 07:15:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513343709;
	bh=hMQj9BLIoFP7HU3K0dakL1SzKUeJexcfZYUDY/wWkt4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ys51ZCd1G/Yo0wT51WlR2eFCB/tFgZM5egJ3xvdVEdeOlSEwHEt7Hbk1NQgGnt43M
	BWlIn2DT/DuLcLGHJURtLxL5+U5kZLBjVGKnYtKBm8JObKg8Cyeg9yuzUA9XlrboTt
	KxOwkCBc3LO3nJayk4jvn82jo6pmgDVQu0wp/Ymg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFDF9SW007358
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 07:15:09 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 07:15:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 07:15:09 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFDF8lO021308;
	Fri, 15 Dec 2017 07:15:08 -0600
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513295086-1630-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b892ffe5-36b9-bcef-7836-0ce5d7254b66@ti.com>
Date: Fri, 15 Dec 2017 08:15:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513295086-1630-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH ] ti-pdk: Updates for dra7xx & am574x
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
X-List-Received-Date: Fri, 15 Dec 2017 13:15:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/14/2017 6:44 PM, Mahesh Radhakrsihnan wrote:
> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>
> One of the updates is for dra7xx. The other one adds the
> LIMIT_BOARDS/SOCs for AM574x until they are added to machine/am57xx-
> evm.conf
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   classes/ti-pdk.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 76abfe4..c83da00 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -54,9 +54,11 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
>   TI_PDK_XDCMAKE ?= "1"
>   
>   # By default, only build the cores with available toolchains
> -TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
> +TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1 arp32_1"

We do not have the toolchain to build arp32_1 cores

>   TI_PDK_LIMIT_SOCS ?= ""
> +TI_PDK_LIMIT_SOCS_append_am57xx-evm = " am574x"
>   TI_PDK_LIMIT_BOARDS ?= ""
> +TI_PDK_LIMIT_BOARDS_append_am57xx-evm = " idkAM574x"

TI_PDK_LIMIT_BOARDS and TI_PDK_LIMIT_SOCS may be used by more than 
ti-pdk class recipes.

For now, I think we can add this in the branding file until it gets 
upstreamed to the machine configuration.

>   TI_PDK_MAKE_TARGET ?= "release"
>   TI_PDK_EXTRA_MAKE ?= ""
>   


