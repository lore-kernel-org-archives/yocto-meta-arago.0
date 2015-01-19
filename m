Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0139C529E0
	for <meta-arago@arago-project.org>;
	Mon, 19 Jan 2015 22:19:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0JMJofp024019
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:19:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JMJoc9009031
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:19:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 Jan 2015 16:19:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JMJneN015392;
	Mon, 19 Jan 2015 16:19:49 -0600
Date: Mon, 19 Jan 2015 17:19:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150119221948.GM16771@edge>
References: <1421704849-9661-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421704849-9661-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-prefs: Use older versions of packages to remove additional GPLv3 licenses
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
X-List-Received-Date: Mon, 19 Jan 2015 22:19:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 19, 2015 at 04:00:49PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Perf tool from the kernel was pulling in elfutils and m4 which by default have
>   GPLv3 licenses.
> * Set elfutils and m4 to an older version which uses a GPLv2 license.

Thanks! This is indeed a better solution to creating a separate packagegroup 
we discussed, especially since we don't really care for elfutils and m4 
specific versions...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 94bb9da..3421a7d 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -111,6 +111,8 @@ PREFERRED_VERSION_crda = "1.1.3"
>  PREFERRED_VERSION_obex = "0.34"
>  PREFERRED_VERSION_bash = "3.2.48"
>  PREFERRED_VERSION_gettext = "0.16.1"
> +PREFERRED_VERSION_elfutils = "0.148"
> +PREFERRED_VERSION_m4 = "1.4.9"
>  
>  PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>  PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

