Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D2045529DD
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 18:46:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UIkuwH002662
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:46:57 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIktOQ002776
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:46:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 12:46:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIktAe030675;
	Fri, 30 Jan 2015 12:46:55 -0600
Date: Fri, 30 Jan 2015 13:46:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150130184654.GI21328@edge>
References: <1422583631-21195-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422583631-21195-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] busybox: Update default configuration of busybox
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
X-List-Received-Date: Fri, 30 Jan 2015 18:47:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Jan 29, 2015 at 09:07:11PM -0500, Sam Nelson wrote:
> - Add ARP and ARPING to default configuration
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous version of patch
> - Correct incorrect PR increment
> - Removed unwanted code
> ---
> ---
>  .../recipes-core/busybox/busybox/defconfig         |    4 ++--
>  .../recipes-core/busybox/busybox_1.22.1.bbappend   |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
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
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
> index 0f49e64..a01a880 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago13"
> +PR_append = "-arago14"
>  
>  SRC_URI += " \
>  	file://inetd \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

