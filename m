Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0CCDF52093
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 19:50:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KJowms016640
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 14:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505937058;
	bh=vmXf5sFdPpu78jtCd4Phs+QzKUaFDc7rR2eGy/fb86c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=druGeGCfPZV9UKXyvvV5YK5FssDKFrxc+56dVeeIStexNPeFATB/dUYu9EdAybMDj
	Mmj4BQJCqgLN2qgS/8yj11GZRwp4lalgAbeCRvWJIyddszDNDS4aqybxDkg44Dmbwo
	tIHL0Uu4iKnrlTV5mARbRQBqUb6ZJd+vNnNL215Q=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJowhs000509
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 14:50:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 14:50:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 14:50:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJowR5001577;
	Wed, 20 Sep 2017 14:50:58 -0500
Date: Wed, 20 Sep 2017 15:50:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <20170920195042.GX26843@edge>
References: <1505935326-14390-1-git-send-email-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <1505935326-14390-1-git-send-email-jjhiblot@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-processor-sdk] [PATCH] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Wed, 20 Sep 2017 19:50:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is there 4.4 based processor-sdk? I'm guessing the wrong header is used here...


On Wed, Sep 20, 2017 at 09:22:06PM +0200, Jean-Jacques Hiblot wrote:
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> index 7d0537d..c1d8fd1 100644
> --- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> @@ -1,7 +1,7 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
>  
>  BRANCH = "ti-lsk-linux-4.4.y"
> -SRCREV = "6580f85400b48d55d06f11d6b75c056399123a72"
> +SRCREV = "2612ef5805db717f9818f06786e863d3b1a7f87e"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
> -- 
> 1.9.1
> 

