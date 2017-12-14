Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2CF6B5209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 14:31:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEEVIhn026668
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:31:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513261878;
	bh=yLNsB+p/lB/eFG4Z5iSqSCo+PGiP3mUkdgzY2g9oYzw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BNFBgokTBVPRXAG7+dEyG2DrYdubvqyBDjlPlzVmf8cvOoRSKzUUExnO9AKFvQy1s
	JJfcGKtbe187nmRYAp2AasYbTE9fUPDbN6W/4sqxm8a1k/Tq0Q8UcWKuAT4iSjYfK6
	+6X8O67U2U48J0a3msMgzvAeZO9FDDc420Jiosc8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEEVI7Q011382
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:31:18 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 14 Dec 2017 08:31:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 08:31:18 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEEVIHf029982;
	Thu, 14 Dec 2017 08:31:18 -0600
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513202415-23104-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6b9241a0-e0dd-299f-6d0c-2438c4873d5f@ti.com>
Date: Thu, 14 Dec 2017 09:31:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513202415-23104-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH ] meta-processor-sdk: Updating to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 14:31:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The commit shortlog is incorrect. Should it be 'gpio-lld-rtos: Updating 
to version 1.0.0.9"?


On 12/13/2017 5:00 PM, Mahesh Radhakrsihnan wrote:
> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend | 7 +++++++
>   1 file changed, 7 insertions(+)
>   create mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
>
> diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
> new file mode 100644
> index 0000000..4566e2f
> --- /dev/null
> +++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
> @@ -0,0 +1,7 @@
> +
> +# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.09"
> +GPIO_LLD_SRCREV = "99a20a668f36217705d57f7cc2f7faf1a5533bbe"
> +
> +PV = "01.00.00.09"
> +PR = "r0"
> +


