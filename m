Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0E5AC52090
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 16:40:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RGdqig042129
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 11:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538066392;
	bh=CCDlzLKER1wygICO+sfJwRYzjB45aZdZqvYFWHRN+VE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hFtvnQWrDw1fb/dRBzCnbyixxPXS93s3Ag8vwKgplTWmA7QbNDv63tTh1/E721tmy
	J/9yAqHnh6ZqAcNQ1MPkIAcI8tNKKVXBkk96PMZZxrFMwXQ+mcg/VGVgR8ig2DYzjb
	6E6BRYHVEoQWi7c+7iD/nXuNz/vsTQlqD3+R+x6w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGdqZ2020367
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 11:39:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 11:39:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 11:39:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGdpA4009588;
	Thu, 27 Sep 2018 11:39:52 -0500
Date: Thu, 27 Sep 2018 12:38:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Chengalvala, Vivek" <vchengalvala@ti.com>
Message-ID: <20180927163805.GE5026@beryl>
References: <1538061940-55063-1-git-send-email-m-radhakrishnan2@ti.com>
	<5481e784099e41c5acc743d279cad93c@ti.com>
MIME-Version: 1.0
In-Reply-To: <5481e784099e41c5acc743d279cad93c@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] board-rtos: Removing the bbappend as the changes are upstreamed to meta-ti
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
X-List-Received-Date: Thu, 27 Sep 2018 16:40:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is also not rocko/master/ti2018.03 - there's no such bbappend.


On Thu, Sep 27, 2018 at 04:13:59PM +0000, Chengalvala, Vivek wrote:
> rocko/master/ti2018.03.,  not morty/meta-processor-sdk.. :)
> 
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, September 27, 2018 11:26 AM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] board-rtos: Removing the bbappend as the changes are upstreamed to meta-ti
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
> 
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
> deleted file mode 100644
> index 32567e2..0000000
> --- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -PR_append = ".tisdk0"
> -
> -# The year in the license was updated to 2018
> -LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
> -
> -BOARD_SRCREV = "983d89de8143645571e7893e95632a8be0fab67e"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

