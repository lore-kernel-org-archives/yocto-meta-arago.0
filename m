Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 749E15297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 19:19:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86JJbhv006237
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504725577;
	bh=JZ+IZcuoU+eSGmGqb5eC2lUHzEDivRJ49USnpf0szz0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=haYTlvhZHsjuqBoLfVfYEoVD5YMPqQARnm7Iplv10pR+qzN2OS8ZBDanYswjP1ZJV
	Iy8GIpnMFjtwfGJvunfgHiXI1EOqsiFY53tJlGoPNVJT6B9CfHNVQu4A3QQ55htviF
	TN2Ldx3TXZyQjayZKEbHDz8d0+c8fA87SJOav5U0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86JJbhm003478
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:19:37 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 14:19:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 14:19:37 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86JJaaZ008625;
	Wed, 6 Sep 2017 14:19:36 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1504723970-21950-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e565cdd9-eec9-4d5b-11fc-78d48c6ae919@ti.com>
Date: Wed, 6 Sep 2017 15:19:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504723970-21950-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] ti-tisdk-makefile: add am572x-idk-pru-excl-uio.dtb to linux-dtbs
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
X-List-Received-Date: Wed, 06 Sep 2017 19:19:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed.


On 9/6/2017 2:52 PM, Hongmei Gou wrote:
> * Add am572x-idk-pru-excl-uio.dtb here since KERNEL_DEVICETREE from
>    machine configuration is currently not including this dtb.
>
> * All pru-uio dtbs can be removed from ti-tisdk-makefile after the
>    upstream meta-ti layer is moved to 2017.05, which has all pru-uio
>    dtbs in KERNEL_DEVICETREE from machine configuration.
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> index 97c4c22..5ae819d 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".tisdk45"
> +PR_append = ".tisdk46"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>   
> @@ -57,7 +57,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
>   
>   KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
>   KERNEL_DEVICETREE_append_ti43x = " ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
> -KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am571x-idk-pru-excl-uio.dtb', '', d)}"
> +KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
>   KERNEL_DEVICETREE_append_k2g-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
>   
>   KERNEL_DEVICETREE_append_am57xx-evm = " \


