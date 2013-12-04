Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6FEE45299E
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 06:16:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB46G4Uq031492
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:16:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46G42V007034
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:16:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 00:16:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46G3CB024439;
	Wed, 4 Dec 2013 00:16:03 -0600
Date: Wed, 4 Dec 2013 01:16:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204061603.GS690@edge>
References: <1385993312-3132-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385993312-3132-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 09/14 v2] wl18xx-firmware: update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Wed, 04 Dec 2013 06:16:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 02, 2013 at 04:08:32PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>

For this change in particular:

Acked-by: Denys Dmytriyenko <denys@ti.com>

But, see my general comment for the entire set...


> ---
>  ...are_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>  copy meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} (86%)
> 
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
> similarity index 86%
> copy from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> copy to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
> index 4b3f22a..6f9c8cb 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
>  
>  PACKAGE_ARCH = "all"
>  
> -PR = "r2+gitr${SRCPV}"
> +PR = "r0+gitr${SRCPV}"
>  
>  PROVIDES += "wl12xx-firmware"
>  RPROVIDES_${PN} += "wl12xx-firmware"
>  RREPLACES_${PN} += "wl12xx-firmware"
>  RCONFLICTS_${PN} += "wl12xx-firmware"
>  
> -# Tag: ol_r8.a6.01
> -SRCREV = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
> +# Tag: ol_r8.a8.08
> +SRCREV = "8e7f455e726f2bf92c568286a5cca510d7718dc1"
>  SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
>             file://Makefile \
>            "
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

