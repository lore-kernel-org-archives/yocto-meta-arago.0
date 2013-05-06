Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 48BA8529C9
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:31:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LVqjM009888
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:31:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LVqfw008586
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:31:52 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:31:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r46LVqkl001932;
	Mon, 6 May 2013 16:31:52 -0500
Date: Mon, 6 May 2013 17:31:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130506213151.GB10607@edge>
References: <1367875806-8694-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367875806-8694-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for ARM9 SOCs
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
X-List-Received-Date: Mon, 06 May 2013 21:31:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 06, 2013 at 04:30:06PM -0500, Franklin S. Cooper Jr wrote:
> * Linaro toolchain does not support ARM9 architecture.
> * Use Arago toolchain if a ARM9 based SOC_FAMILY is being built.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 3954360..048c480 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -21,7 +21,9 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
>  
>  # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
>  # Set some sane defaults, in case someone forgets to set them in local.conf
> -TOOLCHAIN_BRAND ?= "linaro"
> +# ARM9 is not supported by the Linaro toolchain so default back to the Arago
> +# toolchain for ARM9 based SOCs.
> +TOOLCHAIN_BRAND ?= "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"

I don't feel this belongs in the arago.conf - as the comment above says, this 
is supposed to be set in the local.conf anyways, here it just offers a default 
fall back...

-- 
Denys


>  TOOLCHAIN_TYPE ?= "external"
>  
>  require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}-${TOOLCHAIN_BRAND}.inc
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

