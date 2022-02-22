Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7044.1645490556922140347
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 16:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A50B40C2E;
	Tue, 22 Feb 2022 00:42:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpvIHtJYhzFz; Tue, 22 Feb 2022 00:42:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13BAA40951;
	Tue, 22 Feb 2022 00:42:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D8D6C174767; Mon, 21 Feb 2022 19:42:31 -0500 (EST)
Date: Mon, 21 Feb 2022 19:42:31 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: a-m1@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, nikhil.nd@ti.com,
	nsekhar@ti.com
Subject: Re: [meta-arago][PATCH] matrix-gui-apps-git: Update SRCREV to latest
Message-ID: <20220222004231.GK26229@denix.org>
References: <20220221040324.31841-1-a-m1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220221040324.31841-1-a-m1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 09:33:24AM +0530, Aparna M via lists.yoctoproject.org wrote:
> Update SRCREV to latest

Any specific changes to be picked up by this srcrev?


> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index fac1fc8d..d61cf748 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
> +SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
>  BRANCH = "master"
>  INC_PR = "r76"
>  
> -- 
> 2.17.1
