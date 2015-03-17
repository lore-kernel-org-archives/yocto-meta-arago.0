Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4D13952A0B
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 18:48:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HIml7I004076
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 13:48:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HImk4c002690
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 13:48:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 13:48:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HImjo4027993	for
	<meta-arago@arago-project.org>; Tue, 17 Mar 2015 13:48:46 -0500
Date: Tue, 17 Mar 2015 14:48:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150317184845.GA9813@edge>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
	<1426546322-25230-8-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1426546322-25230-8-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 7/7][RFC] packagegroup-*-tisdk-addons: enable compiler and build essentials on omap-a15
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
X-List-Received-Date: Tue, 17 Mar 2015 18:48:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

I marked this as RFC to solicit feedback. As explained in the 0/7 cover letter 
for the series, there are several methods to pull in gcc and build tools to 
the rootfs. This patch uses the least invasive one and enables minimal set of 
dev tools and only for omap-a15 SOC platforms (need to repeat it for keystone 
SOC). That covers Cortex-A15, but I know in the future we'd need target gcc 
also on am3/4 platforms - would you have any preferences to enable this?

-- 
Denys


On Mon, Mar 16, 2015 at 06:52:02PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 8d12018..be38378 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r22"
> +PR = "r23"
>  
>  inherit packagegroup
>  
> @@ -43,6 +43,8 @@ UTILS_append_ti33x = " switch-config"
>  UTILS_append_ti43x = " switch-config libdrm-omap"
>  UTILS_append_omap-a15 = " switch-config libdrm-omap stream-openmp"
>  
> +UTILS_append_omap-a15 = " packagegroup-core-buildessential"
> +
>  RDEPENDS_${PN} = "\
>      ${UTILS} \
>      ${UTILS_UBOOT_FW} \
> -- 
> 2.2.0
> 

