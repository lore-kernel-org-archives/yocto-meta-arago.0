Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5809852A31
	for <meta-arago@arago-project.org>;
	Tue, 22 Jul 2014 21:38:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MLcHur023028
	for <meta-arago@arago-project.org>; Tue, 22 Jul 2014 16:38:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MLcH1G004034
	for <meta-arago@arago-project.org>; Tue, 22 Jul 2014 16:38:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 22 Jul 2014 16:38:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MLcGwp015527	for
	<meta-arago@arago-project.org>; Tue, 22 Jul 2014 16:38:17 -0500
Date: Tue, 22 Jul 2014 17:38:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140722213816.GA15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1405709522-404-3-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 03/11] arago.conf: re-enable gles2 flag for qt5 builds
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
X-List-Received-Date: Tue, 22 Jul 2014 21:38:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 18, 2014 at 02:51:54PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index b9af13f..def7a42 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -23,9 +23,8 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
>  DISTRO_FEATURES += "opengl"
>  PACKAGECONFIG_pn-weston = "kms fbdev"
>  
> -# Configure Qt5 flags (GLES is disabled for now)
> -#PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
> -PACKAGECONFIG_GL_pn-qtbase = "linuxfb"
> +# Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)

FYI, there's currently an issue of building the last public release of
libgles-omap3/modules under 3.14 kernel, so it may be needed to set preference
to 3.12 temporarily.


> +PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
>  PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
>  
>  # ARM9 is not supported by the Linaro toolchain so default back to the Arago
> -- 
> 2.0.0
> 

