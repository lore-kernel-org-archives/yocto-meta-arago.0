Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2710.1644257203626327195
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 10:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E8E940C2A;
	Mon,  7 Feb 2022 18:06:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O59ghx7ACTY9; Mon,  7 Feb 2022 18:06:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 11FC7406B5;
	Mon,  7 Feb 2022 18:06:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B9F2417473C; Mon,  7 Feb 2022 13:06:37 -0500 (EST)
Date: Mon, 7 Feb 2022 13:06:37 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001 release
Message-ID: <20220207180637.GU26229@denix.org>
References: <20220207180541.28964-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220207180541.28964-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

What's the difference since v1?

On Mon, Feb 07, 2022 at 12:05:41PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Updated the ltp-ddt version for 08.02.00.001
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> index e9431796..34f4533b 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> @@ -14,7 +14,7 @@ PE = "1"
>  PR = "r5"
>  PV_append = "+git${SRCPV}"
>  
> -SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
> +SRCREV = "f0cfba630340c4efa114285ea7a6d896861dd9c7"
>  BRANCH ?= "master"
>  
>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
> -- 
> 2.17.1
