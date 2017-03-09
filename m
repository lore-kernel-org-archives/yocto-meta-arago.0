Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1E41F52ABA
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 20:17:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29KHJF5019144
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 14:17:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489090639;
	bh=qA2Y/eKj+XyU3pOyz1QKC8PXz4MbFRaISz+wwkiYlFw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kzk83waqtEsrz+HA2M4b2nUtw2hkcDrxXbLoxIlZvhb/03y3SabV6k60faAshlGh4
	aDTiIiesXNqfa9jtjAErpvDL3isE6bp9/+8pWBOtGL4uYL2D/DTRnzGmE9QglR7hi9
	RluzpoOK4im2ePl7kX/eH9wm8P4fw38CAV8fTCoE=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29KHEMA026768
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 14:17:14 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 14:17:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29KHEW4003791;
	Thu, 9 Mar 2017 14:17:14 -0600
Date: Thu, 9 Mar 2017 15:17:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170309201713.GJ578@edge>
References: <1489090087-35884-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489090087-35884-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH] weston: fix virtual keyboard display issue of QT5 applications
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
X-List-Received-Date: Thu, 09 Mar 2017 20:17:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

If you intend to submit more updates to Weston patches, please make it a 
sequence and submit them as numbered patches, as I mentioned in another email

-- 
Denys


On Thu, Mar 09, 2017 at 03:08:07PM -0500, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend      | 3 ++-
>  .../0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch    | 0
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename meta-arago-distro/recipes-graphics/wayland/{weston => weston_update}/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch (100%)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> index 9a2c3a7..f2e22ca 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> @@ -2,7 +2,7 @@
>  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
>  
> -PR_append = ".arago18"
> +PR_append = ".arago19"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -12,4 +12,5 @@ RDEPENDS_${PN} += "weston-conf"
>  SRC_URI += " \
>  	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
>  	file://0002-Weston-Allow-visual_id-to-be-0.patch \
> +	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
>  "
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch b/meta-arago-distro/recipes-graphics/wayland/weston_update/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> similarity index 100%
> rename from meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> rename to meta-arago-distro/recipes-graphics/wayland/weston_update/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

