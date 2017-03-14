Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0930C529EC
	for <meta-arago@arago-project.org>;
	Tue, 14 Mar 2017 21:52:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2ELqhmP028538
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 16:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489528363;
	bh=Iurg5vpgAnLfzr9Z6idInP8QGGq0hPeruMN1cQQlbMs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=B+XX+yqDeoAqq3HTfwdIKXCGmkQd04Ycg9pUyTH1sMPaZQrp+HcdhneFX2+tSpBYk
	nji2yYu4JTvJ7VJ/nJgm9g7XAA5ZICa8qjPVoKAeax4ynnRyyutBSZwJmd4sJMXa1I
	PjxNYYrqCf9utSekzslmktvEI6Add+upQgExM9HE=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2ELqcTr001374
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 16:52:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 16:52:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2ELqc5O017611;
	Tue, 14 Mar 2017 16:52:38 -0500
Date: Tue, 14 Mar 2017 17:52:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170314215237.GP578@edge>
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
X-List-Received-Date: Tue, 14 Mar 2017 21:52:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I presume this is also needed for morty...


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

