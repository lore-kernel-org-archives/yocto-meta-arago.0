Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BA87452A83
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 20:00:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK0X2o008012
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:00:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK0Xan018705
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:00:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:00:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK0W1c006770;
	Fri, 29 May 2015 15:00:32 -0500
Date: Fri, 29 May 2015 16:00:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200031.GS16418@edge>
References: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
	<1432811095-3754-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432811095-3754-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/5] packagegroups/packagegroup-arago-tisdk-addons_dra7xx: Add dsptop.
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
X-List-Received-Date: Fri, 29 May 2015 20:00:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 07:04:51AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons.bb             |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 28ea1d6..0d8116d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r24"
> +PR = "r25"
>  
>  inherit packagegroup
>  
> @@ -35,7 +35,7 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
>  UTILS_append_omap3 = " canutils"
>  UTILS_append_ti33x = " canutils"
>  UTILS_append_ti43x = " canutils"
> -UTILS_append_dra7xx = " canutils"
> +UTILS_append_dra7xx = " canutils dsptop"
>  UTILS_append_omap-a15 = " parted"
>  
>  UTILS_append_ti33x = " switch-config"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

