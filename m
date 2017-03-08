Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0C5F852979
	for <meta-arago@arago-project.org>;
	Wed,  8 Mar 2017 14:36:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v28EaRBl021841
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 08:36:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488983787;
	bh=6FbF91u8f4+vsgH7Cs1QBVRJO0qPiJEY28uZSQzhpTA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UEs34rjGR6HCWgLZoewwUHBKzPpN3TOs9GzascMfXoeGiRvyevILxpBAsxoBRbt20
	elklnxHTP48Ekpzkon7IfOP1IkuDXpSSnOxoftdtWT7J1UhSaipVOfDxRTZmVZqb4/
	90hgOc60UmUeHtCf5LyTKsI1kxiBUCQxke9Q9Dsw=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28EaMfn021334
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 08:36:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 08:36:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28EaMMH014141;
	Wed, 8 Mar 2017 08:36:22 -0600
Date: Wed, 8 Mar 2017 09:36:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20170308143621.GM23302@edge>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488959905-187610-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Wed, 08 Mar 2017 14:36:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> index d0691ad..36585bd 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> @@ -2,19 +2,20 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = ".arago16"
> +PR_append = ".arago17"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  RDEPENDS_${PN} += "weston-conf"
>  
> -#SRC_URI += " \
> -#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
> -#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> -#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
> -#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> -#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> -#	file://0001-Add-soc-performance-monitor-utilites.patch \
> -#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
> -#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
> -#"
> +
> +SRC_URI += " \
> +	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> +"
> +#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
> +#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> +#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> +#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> +#	file://0001-Add-soc-performance-monitor-utilites.patch
> +#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
> +#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch

Anand,

What about the rest of the commented out patches? Do we still need them?

If we need them, will you be looking at up-porting them?
If we don't need them, can you please remove the corresponding comments from 
the recipe.

Thanks.

-- 
Denys

