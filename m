Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 16AD352992
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:35:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THZawe005968
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:35:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THZa6L017122
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:35:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:35:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THZZ1O031874;
	Fri, 29 Aug 2014 12:35:36 -0500
Date: Fri, 29 Aug 2014 13:35:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140829173535.GL18620@edge>
References: <1408675495-24120-1-git-send-email-fcooper@ti.com>
	<1408675495-24120-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1408675495-24120-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] arago-core-tisdk-image: Work around SOC_FAMILY issue
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
X-List-Received-Date: Fri, 29 Aug 2014 17:35:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 21, 2014 at 09:44:54PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Some reason the SOC_FAMILY dra7xx has precedences over machine overrides.
> * Change dra7xx to dra7xx-evm to avoid SOC_FAMILY override issue.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 37f71d6..475c9d6 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -19,7 +19,7 @@ TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl2
>  DTB_FILTER = "unknown"
>  DTB_FILTER_ti33x = "am335x"
>  DTB_FILTER_omap5-evm = "omap5"
> -DTB_FILTER_dra7xx = "dra7"
> +DTB_FILTER_dra7xx-evm = "dra7"
>  DTB_FILTER_am57xx-evm = "am57xx"

Are you sure you are basing your patch on master? The above entry for am57xx 
doesn exist yet in meta-arago/master. Looks like another patch is missing or 
your need to rebase.


>  DTB_FILTER_ti43x = "am43"
>  DTB_FILTER_keystone = "k2hk"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

