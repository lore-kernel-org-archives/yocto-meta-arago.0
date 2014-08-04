Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 012CE5298E
	for <meta-arago@arago-project.org>;
	Mon,  4 Aug 2014 21:18:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74LIENO018672
	for <meta-arago@arago-project.org>; Mon, 4 Aug 2014 16:18:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74LIEMk013474
	for <meta-arago@arago-project.org>; Mon, 4 Aug 2014 16:18:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 4 Aug 2014 16:18:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74LIDTn014564;
	Mon, 4 Aug 2014 16:18:13 -0500
Date: Mon, 4 Aug 2014 17:18:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Machani <yanivma@ti.com>
Message-ID: <20140804211813.GA15788@edge>
References: <1406842115-5938-1-git-send-email-yanivma@ti.com>
	<1406842115-5938-2-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1406842115-5938-2-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] wpa-supplicant-wl18xx: configuration files update
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
X-List-Received-Date: Mon, 04 Aug 2014 21:18:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

It would be safer to bump the corresponding recipe PR here, as you are not 
modifying the recipe itself...


On Fri, Aug 01, 2014 at 12:28:35AM +0300, Yaniv Machani wrote:
> - clean non releveant configuration flags.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wpa-supplicant/p2p_supplicant.conf             |    3 +--
>  .../wpa-supplicant/wpa_supplicant.conf             |    3 ++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> index 2de8730..3bdc306 100755
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> @@ -3,12 +3,11 @@ update_config=0
>  device_name=TI-SITARA-P2P
>  device_type=1-0050F204-1
>  config_methods=virtual_push_button physical_display keypad
> -p2p_go_intent=0
> +#p2p_go_intent=0
>  country=US
>  ##p2p_pref_chan=115:36 115:40
>  driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
>  p2p_go_max_inactivity=60
>  p2p_go_ht40=1
> -p2p_multi_chan=1
>  disassoc_low_ack=1
>  concurrent_sched_scan=1
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> index f144a38..4233eb2 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> @@ -59,6 +59,7 @@ driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
>  # inactive stations.
>  p2p_go_max_inactivity=60
>  p2p_go_ht40=1
> -p2p_multi_chan=1
>  disassoc_low_ack=1
>  concurrent_sched_scan=1
> +p2p_disabled=1
> +
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

