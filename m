Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 645F4529BF
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 06:06:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB466NFN012423
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:06:23 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB466NwC021870
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:06:23 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 00:06:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB466NVJ030282;
	Wed, 4 Dec 2013 00:06:23 -0600
Date: Wed, 4 Dec 2013 01:06:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204060621.GP690@edge>
References: <1385993347-3223-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385993347-3223-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 12/14] arago-tisdk-connectivity: Restored connectivity modules compilation
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
X-List-Received-Date: Wed, 04 Dec 2013 06:06:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 02, 2013 at 04:09:07PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Modules compatibility issues with libnl were fixed.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |   16 ++++++----------
>  1 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 0aa019d..c159b9d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
>  LICENSE = "MIT"
> -PR = "r17"
> +PR = "r18"
>  
>  inherit packagegroup
>  
> @@ -23,14 +23,11 @@ WLAN_COMMON = "\
>      pulseaudio-module-bluetooth-device \
>      eventdump \
>      ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
> +    wpa-supplicant \
> +    crda \
> +    hostap-daemon \
> +    ti-wifi-utils \
>  "
> -
> -# TI/ECS versions of wpa-supplicant/crda/hostap/wifi-utils require older libnl,
> -# which no longer exists
> -#    wpa-supplicant
> -#    crda
> -#    hostap-daemon
> -#    ti-wifi-utils


>  # No bluetooth/bluetooth.h
>  #    oppserver

As oppserver used to be in common list, I commented it out here as 
unbuildable. Since you took care of it below for WiLink6, please remove the 
comment above.

BTW, what is the statis of Bluetooth in WiLink8? If it's not supported at all, 
should we also remove the other traces of BT, like bluez etc?


> @@ -42,8 +39,7 @@ WLAN_COMMON = "\
>  #    ti-compat-bluetooth

What about other commented out pieces:

ti-compat-wireless-wl12xx
ti-compat-bluetooth
wifi-direct-demo
battleship
wpa-gui-e

Although I see the patch from Eyal to update ti-compat-wireless - I assume 
you'd want to update this packagegroup again.


>  FIRMWARE_AND_DRIVERS = "\
> -    bt-firmware \
> -    bt-enable \
> +    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver bt-firmware bt-enable' , '',d)}"

Not critical, but there are some "ugly" whitespaces inside the parentheses 
above.


>      wl12xx-firmware \
>  "
>  
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

