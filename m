Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 835B252090
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 01:45:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U1jCSM011858
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:45:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1jBfk001260
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:45:11 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 19:45:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1jAWX027611;
	Thu, 29 Jan 2015 19:45:10 -0600
Date: Thu, 29 Jan 2015 20:45:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150130014509.GC21328@edge>
References: <1422570384-13640-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422570384-13640-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] busybox: Update default configuration of busybox
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
X-List-Received-Date: Fri, 30 Jan 2015 01:45:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 29, 2015 at 05:26:24PM -0500, Sam Nelson wrote:
> - Add ARP and ARPING to default configuration
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Does the PR need to be incremented for this?

Yes, please.


> ---
> ---
>  .../recipes-core/busybox/busybox/defconfig         |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> index 69d7e5f..c3aa413 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -729,8 +729,8 @@ CONFIG_FEATURE_IPV6=y
>  # CONFIG_FEATURE_UNIX_LOCAL is not set
>  CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> -# CONFIG_ARP is not set
> -# CONFIG_ARPING is not set
> +CONFIG_ARP=y
> +CONFIG_ARPING=y
>  CONFIG_BRCTL=y
>  CONFIG_FEATURE_BRCTL_FANCY=y
>  CONFIG_FEATURE_BRCTL_SHOW=y
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

