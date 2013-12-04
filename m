Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 630CE52998
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 06:13:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB46DV80018629
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:13:31 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46DVTV026383
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:13:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 00:13:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46DV7d027248;
	Wed, 4 Dec 2013 00:13:31 -0600
Date: Wed, 4 Dec 2013 01:13:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204061330.GR690@edge>
References: <1386015139-4852-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1386015139-4852-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 11/14 v3] arago-prefs: update default value for am335x and am43x for WILINK-8
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
X-List-Received-Date: Wed, 04 Dec 2013 06:13:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 02, 2013 at 10:12:19PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Also change the default supported WILINK version
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
> v3 changes-
> Restored WILINK_VERSION to WILINK-6 as default. (undo from previous commits) 

Thanks for addressing all Franklin's comments - appreciate it!


>  .../conf/distro/include/arago-prefs.inc            |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 24f3785..032c12b 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -93,6 +93,9 @@ PREFERRED_VERSION_bash = "3.2.48"
>  PREFERRED_VERSION_gettext = "0.16.1"
>  
>  WILINK_VERSION = "WILINK-6"
> +# For AM335x & AM43x Wilink 8 is now the default version to be used
> +WILINK_VERSION_ti33x = "WILINK-8"
> +WILINK_VERSION_ti43x = "WILINK-8" 
>  PREFERRED_PROVIDER_wl12xx-firmware = "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-firmware',d)}"
>  PREFERRED_PROVIDER_ti-compat-wireless-wl12xx = "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-wl18xx','ti-compat-wireless-wl12xx',d)}"
>  PREFERRED_PROVIDER_hostap-daemon = "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-wl18xx','hostap-daemon',d)}"
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

