Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B3B2552AAF
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 18:32:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35IWuJp026165
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:32:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35IWuSs005821
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:32:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Apr 2013 13:32:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r35IWtwC022043;
	Fri, 5 Apr 2013 13:32:55 -0500
Date: Fri, 5 Apr 2013 14:32:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130405183254.GC10072@edge>
References: <1365186645-29898-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1365186645-29898-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-prefs: update graphics preferred version
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
X-List-Received-Date: Fri, 05 Apr 2013 18:32:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 05, 2013 at 01:30:45PM -0500, Chase Maupin wrote:
> * Update the preferred version of the TI graphics components to
>   the version that will support the later v3.8 kernels as well.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index d858a52..853844a 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -7,8 +7,10 @@ PREFERRED_VERSION_wpa-supplicant = "2.0-devel-ti"
>  PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
>  
>  # Use v4.08.00.01 of the Graphics SDK
> -PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
> -PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
> +#PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
> +#PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
> +PREFERRED_VERSION_omap3-sgx-modules = "4.09.00.01"
> +PREFERRED_VERSION_libgles-omap3 = "4.09.00.01"

There is no such version neither in meta-ti nor in meta-arago :)


>  ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

