Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3750152A95
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2013 20:07:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r89K7HfN007578
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 15:07:17 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89K7HgY013402
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 15:07:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 9 Sep 2013 15:07:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89K7H1k009511;
	Mon, 9 Sep 2013 15:07:17 -0500
Date: Mon, 9 Sep 2013 16:07:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130909200716.GC2503@edge>
References: <1378747771-6201-1-git-send-email-fcooper@ti.com>
	<1378747771-6201-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1378747771-6201-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] arago-image.inc: Make sure all filesystems include kernel image
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
X-List-Received-Date: Mon, 09 Sep 2013 20:07:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 09, 2013 at 12:29:31PM -0500, Franklin S. Cooper Jr wrote:
> * Switch from danny to dylan causes file systems to no longer include
>   kernel-image package.
> * This package is very important for newer versions of U-boot that expects the
>   kernel to be read from the filesystem.

NAK, this makes it global and unconditional for all our images. Some of them 
need not have a kernel image in the rootfs!

This maybe one of the bugs I've been chasing for lately, that breaks my 
nightly builds... I'll let you know the resolution soon.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/images/arago-image.inc            |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 7cab56a..66a2cc5 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -16,6 +16,7 @@ VIRTUAL-RUNTIME_login_manager = "tinylogin shadow"
>  ARAGO_IMAGE_EXTRA_INSTALL ?= ""
>  
>  IMAGE_INSTALL += " \
> +	kernel-image \
>  	packagegroup-core-boot \
>  	bash \
>  	${ARAGO_IMAGE_EXTRA_INSTALL} \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

