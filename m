Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8D986529F5
	for <meta-arago@arago-project.org>;
	Mon, 14 Jul 2014 19:36:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EJa3Wl023374
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 14:36:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EJa3lj011545
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 14:36:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 14:36:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EJa36J024548;
	Mon, 14 Jul 2014 14:36:03 -0500
Date: Mon, 14 Jul 2014 15:36:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Machani <yanivma@ti.com>
Message-ID: <20140714193602.GR15788@edge>
References: <1405350249-15037-1-git-send-email-yanivma@ti.com>
	<1405350249-15037-4-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1405350249-15037-4-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/5] wl18xx : update to ol_r8.a9.14
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
X-List-Received-Date: Mon, 14 Jul 2014 19:36:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 14, 2014 at 06:04:07PM +0300, Yaniv Machani wrote:
>     - Changed git sources to git.ti.com
>     - Updated to latest release.
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  ...are_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
>  rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} (72%)
>  mode change 100644 => 100755
> 
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
> old mode 100644
> new mode 100755

Same comment - don't change permissions.


> similarity index 72%
> rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
> rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
> index b59f1c4..45d4ea7
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
> @@ -4,16 +4,17 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>  
>  PACKAGE_ARCH = "all"
>  
> -PR = "r3+gitr${SRCPV}"
> +PR = "r4+gitr${SRCPV}"
>  
>  PROVIDES += "wl12xx-firmware"
>  RPROVIDES_${PN} += "wl12xx-firmware"
>  RREPLACES_${PN} += "wl12xx-firmware"
>  RCONFLICTS_${PN} += "wl12xx-firmware"
>  
> -# Tag: ol_r8.a8.10
> -SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
> -SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git;branch=mbss \
> +# Tag: ol_r8.a9.14
> +SRCREV = "2568d8f61fd509eabb112110c20ea31c088ef6b9"
> +BRANCH = "ap_dfs"
> +SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
>             file://0001-Add-Makefile-for-SDK.patch \
>            "
>  
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

