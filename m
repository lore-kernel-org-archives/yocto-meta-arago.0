Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6F2FA529B9
	for <meta-arago@arago-project.org>;
	Tue, 14 Mar 2017 22:22:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2EMMF4S021057
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 17:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489530135;
	bh=KFoWIEMll/vDI8RcDd78U6Uj4q6FrIYgNGjec6+Ts+0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=X3bAXwA7yLMrq9+I+xWAhRdXLsgL25f9+XuMPFqbYjlUsZrC+YESUgJOLA7uE12X5
	94os8GXFEwbav5/VgjlgMx3Kpp7YeZi9gfRskwwqSLn3urap8rl3m2aDvTv4wjdxkG
	AEGgqNh/VZM0+i6zy8jEo7yFivp2Igrph4Jc/J58=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EMMFXb002797
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 17:22:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 17:22:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EMMEUB023406;
	Tue, 14 Mar 2017 17:22:14 -0500
Date: Tue, 14 Mar 2017 18:22:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170314222213.GQ578@edge>
References: <1489429904-13863-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489429904-13863-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master] weston: Add SoC performance monitoring utilities
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
X-List-Received-Date: Tue, 14 Mar 2017 22:22:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, can this be done in a separate recipe to add additional app clients, 
instead of a patch to Weston? This is not scalable/portable at all...

-- 
Denys


On Tue, Mar 14, 2017 at 12:01:44AM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/wayland/weston_1.11.0.bbappend              | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> index f8329c8..9b52df0 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = ".arago22"
> +PR_append = ".arago25"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -17,3 +17,10 @@ SRC_URI += " \
>  	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
>  	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
>  "
> +
> +
> +# SoC Performance Monitoring Utility
> +SRC_URI += " \
> +        file://0001-Add-soc-performance-monitor-utilites.patch \
> +"
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

