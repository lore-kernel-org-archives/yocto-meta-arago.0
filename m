Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9A9EB529F7
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:55:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FtlMg011134
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:55:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Ftkpp024350
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:55:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:55:46 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r61Ftk4D029046;
	Mon, 1 Jul 2013 10:55:46 -0500
Date: Mon, 1 Jul 2013 11:55:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130701155546.GB4588@edge>
References: <20130701154259.GA1207@ti.com>
MIME-Version: 1.0
In-Reply-To: <20130701154259.GA1207@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-glsdk: update perferences
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
X-List-Received-Date: Mon, 01 Jul 2013 15:55:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2013 at 09:12:59PM +0530, Siddharth Heroor wrote:
> * Set Preferred Provider for Bootloader to use the GLSDK
>   U-Boot Staging tree.
> * Set Preferred Provider for libgbm to use the GLSDK libgbm
>   and set corresponding version to 9.0.0.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../conf/distro/include/branding-glsdk.inc         |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> index d1c30f3..2111d81 100644
> --- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> @@ -2,3 +2,6 @@
>  
>  # Use the SDK supported kernel and kernel version
>  PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot-glsdk-staging"

You'd also need to set PREFERRED_PROVIDER_u-boot for cases when u-boot is 
requested directly by name - see machine configs in meta-ti.


> +PREFERRED_PROVIDER_libgbm = "libgbm-glsdk"
> +PREFERRED_VERSION_libgbm = "9.0.0"

Since libgbm is still under review, it may delay accepting this patch as 
well...


> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

