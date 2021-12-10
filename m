Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.935.1639097200029284736
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 16:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FEFA40C50;
	Fri, 10 Dec 2021 00:46:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sVVof0eFtjJ; Fri, 10 Dec 2021 00:46:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DFFAB40BEA;
	Fri, 10 Dec 2021 00:46:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3EEB517470C; Thu,  9 Dec 2021 19:46:35 -0500 (EST)
Date: Thu, 9 Dec 2021 19:46:35 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [meta-ti][master/dunfell][PATCH] conf: j7200-hs: fix the wrong machine configuration included
Message-ID: <20211210004635.GC18191@denix.org>
References: <20211210004321.23793-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211210004321.23793-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Wrong list?

On Fri, Dec 10, 2021 at 12:43:21AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> j7-evm instead of j7200-evm was included causing boot failure
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/j7200-hs-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> index c55be005..a5bd637e 100644
> --- a/conf/machine/j7200-hs-evm.conf
> +++ b/conf/machine/j7200-hs-evm.conf
> @@ -2,7 +2,7 @@
>  #@NAME: J7200 HS EVM
>  #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
>  
> -require conf/machine/j7-evm.conf
> +require conf/machine/j7200-evm.conf
>  
>  UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
>  
> -- 
> 2.17.1
