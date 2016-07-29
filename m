Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BABDF5298A
	for <meta-arago@arago-project.org>;
	Fri, 29 Jul 2016 23:14:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6TNAP5W003362
	for <meta-arago@arago-project.org>; Fri, 29 Jul 2016 18:10:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6TNE0pW028469
	for <meta-arago@arago-project.org>; Fri, 29 Jul 2016 18:14:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 29 Jul 2016 18:14:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6TNDxUZ022250;
	Fri, 29 Jul 2016 18:14:00 -0500
Date: Fri, 29 Jul 2016 19:13:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160729231359.GC31835@edge>
References: <1469711089-3342-1-git-send-email-a0393906@ti.com>
	<1469711089-3342-4-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1469711089-3342-4-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/4] gstreamer1.0: Switch to GST 1.6.3
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
X-List-Received-Date: Fri, 29 Jul 2016 23:14:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This patch was corrupted for some reason. I ended up redoing it manually.

On Thu, Jul 28, 2016 at 06:34:49PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index cc481cb..a67aaf0 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -66,3 +66,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>  PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
>  PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
>  PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
> +
> +PREFERRED_VERSION_gstreamer1.0 = "1.6.3"
> +PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.6.3"
> +PREFERRED_VERSION_gstreamer1.0-libav = "1.6.3"
> +PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.6.3"
> +PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.6.3"
> +PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.6.3"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

