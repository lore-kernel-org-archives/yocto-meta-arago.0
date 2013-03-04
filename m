Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6760A52ABC
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:03:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r24K3kd6024926;
	Mon, 4 Mar 2013 14:03:46 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r24K3kpC009038;
	Mon, 4 Mar 2013 14:03:46 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 14:03:46 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r24K3jtF010973;
	Mon, 4 Mar 2013 14:03:46 -0600
Date: Mon, 4 Mar 2013 15:03:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <fcooperjr27@gmail.com>
Message-ID: <20130304200344.GG27633@edge>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 01/10] arago-source-ipk.conf: Adjust sourceipk for omap3 kernels
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
X-List-Received-Date: Mon, 04 Mar 2013 20:03:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2013 at 02:01:20PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * The kernel recipe for am3517 and am37x have been renamed to reflect the recipe
>   name already in meta-ti.
> * Tweak the sourceipk value to address this change.

Heh, it broke for me over the weekend and I had it in my tree already. But I 
can push your fix, no problem...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> index bc5ff59..88cd21d 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -116,9 +116,9 @@ CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
>  SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
>  SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
>  
> -CREATE_SRCIPK_pn-linux-omap3 = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-omap3 = "board-support/linux-${KVER}-psp${PSPREL}"
> -SRCIPK_PACKAGE_ARCH_pn-linux-omap3 = "${MACHINE_ARCH}"
> +CREATE_SRCIPK_pn-linux-omap-psp = "1"
> +SRCIPK_INSTALL_DIR_pn-linux-omap-psp = "board-support/linux-${KVER}-psp${PSPREL}"
> +SRCIPK_PACKAGE_ARCH_pn-linux-omap-psp = "${MACHINE_ARCH}"
>  
>  CREATE_SRCIPK_pn-linux-am335x = "1"
>  SRCIPK_INSTALL_DIR_pn-linux-am335x = "board-support/linux-${KVER}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

