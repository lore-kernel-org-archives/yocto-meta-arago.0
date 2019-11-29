Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 06EB552A29
	for <meta-arago@arago-project.org>;
	Fri, 29 Nov 2019 10:05:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xATA3tkk077106
	for <meta-arago@arago-project.org>; Fri, 29 Nov 2019 04:03:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575021835;
	bh=/ueTFQJJgImfeRxwxnCObvvvIxPXurcLtKtkGuOHGIM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lNy5bRAJaGJkKR62Myc0uillDSF51gY9zo0XmckMCNOCrQDNh8WL882Tu7QYOlVGr
	/E6krInLvRwuVOasuSE9tAxBXGB0fN3JAjc5XIFhQoMsEDm/ksr0zWySygGvpPwETl
	aU0yCYc7SR77jrDjQzz8y4hc0eyk5OUbwQez24so=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xATA3tqo024315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 29 Nov 2019 04:03:55 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 29 Nov 2019 04:03:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 29 Nov 2019 04:03:54 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xATA3rE0112943;
	Fri, 29 Nov 2019 04:03:53 -0600
To: <meta-arago@arago-project.org>
References: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <9a0e5194-45ec-4469-7312-ccabff15d027@ti.com>
Date: Fri, 29 Nov 2019 15:33:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: grygorii.strashko@ti.com, nsekhar@ti.com
Subject: Re: [thud/master] [PATCH] branding: core: Autoload rpmsg_kdrv_switch for j7-evm
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
X-List-Received-Date: Fri, 29 Nov 2019 10:05:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping

On 20/11/19 4:43 pm, Nikhil Devshatwar wrote:
> rpmsg_kdrv_switch kernel module is needed for the cpsw9g virtual net
> driver. Since there is no symbol dependency, rpmsg_kdrv_switch
> does not get loaded automatically.
>
> Add branding file override for j7-evm to autoload this module.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Fixes: LCPD-17113
>
>   meta-arago-distro/conf/distro/include/branding-core.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index cab9831..c70f8d1 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -11,3 +11,8 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
>   
>   # Raise priority for sample IPC FW images
>   ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
> +
> +# Autoload the kernel module
> +KERNEL_MODULE_AUTOLOAD_EXTRAS = ""
> +KERNEL_MODULE_AUTOLOAD_EXTRAS_j7-evm += "rpmsg_kdrv_switch"
> +KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"

