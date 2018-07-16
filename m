Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E678A529AE
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 16:18:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GGIBL1080892
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531757891;
	bh=B4Fz0GkPoB8UpWs+gqNFfISNQQFMEvMyokXIOjDvyw8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=EGM2Iu27binOOcdGu3du4UHZhg9vzwG8k1g2BuCiFsD7I6FsYiLvRePWXFz/GhnDu
	Dj+V3H5YL+rH+i3RJhr5JN5XGW/vAR2xi6hGM0C176jXMt868flAfRA4gtpCGOEwmX
	1JKyZO1oNMzj3WWWoeIVXYecTwEuehGU99uQdV/Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GGIB7b009424
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 11:18:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 11:18:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 11:18:11 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GGIBrB002060;
	Mon, 16 Jul 2018 11:18:11 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1531505263-19455-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0fae3bf7-aedc-d163-80a1-44c5bed75fed@ti.com>
Date: Mon, 16 Jul 2018 12:18:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1531505263-19455-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [ti2018.01/rocko/master] [PATCH v2] packagegroup-arago-tisdk-multimedia: add ipumm-fw for am5-hs and dra7-hs
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
X-List-Received-Date: Mon, 16 Jul 2018 16:18:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,

Jake


On 7/13/2018 2:07 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v2 change: add ipumm-fw for dra7-hs also
>
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 1c1e7d0..0bad258 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to add multimedia related packages"
>   LICENSE = "MIT"
> -PR = "r21"
> +PR = "r22"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -40,6 +40,10 @@ ACCEL_FW_append_am57xx-evm = " \
>       ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>   "
>   
> +ACCEL_FW_append_am57xx-hs-evm = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> +"
> +
>   ACCEL_FW_append_omap5-evm = " \
>       ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>   "
> @@ -49,6 +53,10 @@ ACCEL_FW_append_dra7xx-evm = " \
>       vis \
>   "
>   
> +ACCEL_FW_append_dra7xx-hs-evm = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> +"
> +
>   RDEPENDS_${PN} = "\
>       packagegroup-arago-gst \
>       ${MULTIMEDIA} \


