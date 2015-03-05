Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ED4305297F
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 17:49:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25HnLBi018294
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 11:49:22 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25HnK1I008344
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 11:49:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 11:49:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25HnKin003758;
	Thu, 5 Mar 2015 11:49:20 -0600
Date: Thu, 5 Mar 2015 12:49:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150305174919.GP6052@edge>
References: <1425571261-18353-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425571261-18353-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-prefs: wpa-supplicant PREFERRED_PROVIDER to wpa-supplicant-wl18xx for omap-a15 family.
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
X-List-Received-Date: Thu, 05 Mar 2015 17:49:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 05, 2015 at 11:01:01AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index e689f8b..c872d9a 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -119,7 +119,7 @@ PREFERRED_VERSION_m4 = "1.4.9"
>  PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>  PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
>  PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
> -PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm = "wpa-supplicant-wl18xx"
> +PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"

I'm fine with this. Although, omap-a15 also includes OMAP5 EVM, but it's not 
enabled in bt-firmware nor connectivity packagegroup, which only enable dra7xx


>  PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
>  PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

