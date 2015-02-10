Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 41D8252A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:35:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGZELh005719
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:35:14 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGZDx8030960
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:35:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 10:35:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGZCnp017806;
	Tue, 10 Feb 2015 10:35:13 -0600
Date: Tue, 10 Feb 2015 11:35:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150210163512.GE13231@edge>
References: <1423537481-22204-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423537481-22204-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-addons: Remove switch-config for keystone
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
X-List-Received-Date: Tue, 10 Feb 2015 16:35:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 09, 2015 at 10:04:41PM -0500, Sam Nelson wrote:
> - keystone kernel is using kernel version 3.10.10 and
>   switch-config doesnot compile with this version
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons.bb             |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index a8d3efb..9da3d4f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -25,6 +25,7 @@ UTILS = " \
>  UTILS_UBOOT_FW = "u-boot-fw-utils"
>  UTILS_UBOOT_FW_ti43x = ""
>  UTILS_UBOOT_FW_keystone = ""
> +UTILS_remove_keystone = "switch-config"

That's unnecessary use of _remove function - better use machine override with 
append like below mmc-utils. ti33x, ti43x and omap-a15 should cover the 
platforms that switch-config can build for.


>  UTILS_append_ti33x = " mmc-utils"
>  UTILS_append_ti43x = " mmc-utils"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

