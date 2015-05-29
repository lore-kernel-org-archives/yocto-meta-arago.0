Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9B8BB52A83
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 20:01:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK1p8e008623
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:01:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK1pfO008883
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:01:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:01:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK1ovu021216;
	Fri, 29 May 2015 15:01:50 -0500
Date: Fri, 29 May 2015 16:01:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200150.GV16418@edge>
References: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
	<1432811095-3754-5-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432811095-3754-5-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/5] packagegroup-arago-tisdk-addons-sdk-host_dra7xx: Add debugss-module-drv-src.
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
X-List-Received-Date: Fri, 29 May 2015 20:01:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 07:04:54AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index a955a3a..f821059 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r8"
> +PR = "r9"
>  
>  inherit packagegroup
>  
> @@ -27,6 +27,7 @@ UTILS_append_ti33x = " \
>  
>  EXTRA_LIBS = ""
>  EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
> +EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src"
>  
>  RDEPENDS_${PN} = "\
>      ${UTILS} \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

