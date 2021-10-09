Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8B80752C72
	for <meta-arago@arago-project.org>;
	Sat,  9 Oct 2021 21:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0691540C50;
	Sat,  9 Oct 2021 21:46:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fayqs4wCVnUC; Sat,  9 Oct 2021 21:46:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC50840BEA;
	Sat,  9 Oct 2021 21:46:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B3A0174688; Sat,  9 Oct 2021 17:46:38 -0400 (EDT)
Date: Sat, 9 Oct 2021 17:46:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Message-ID: <20211009214638.GW1528@denix.org>
References: <20211008080632.22629-1-sinthu.raja@ti.com>
	<20211008080632.22629-2-sinthu.raja@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211008080632.22629-2-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [dunfell/master][PATCH V2 1/2] packagegroups: tisdk-connectivity: package intel-9260 linux firmware images
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
X-List-Received-Date: Sat, 09 Oct 2021 21:46:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2021 at 01:36:31PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Package linux-firmware-iwlwifi-9260 and linux-firmware-ibt-18 containing
> firmware for Intel 9260 (WLAN and BT)
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

BTW, the patches are in the wrong order, which breaks bisectability. Not sure 
if this requires resending them again or they can be merged in the correct 
order.


> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 1eb0e072..98a1dacf 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install wireless packages into the target FS"
>  LICENSE = "MIT"
> -PR = "r41"
> +PR = "r42"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -18,6 +18,7 @@ WLAN_COMMON = "\
>      linux-firmware-iwlwifi-8000c \
>      linux-firmware-iwlwifi-8265 \
>      linux-firmware-iwlwifi-3160-17 \
> +    linux-firmware-iwlwifi-9260 \
>  "
>  
>  WLAN_TI = "\
> @@ -42,6 +43,7 @@ BT_COMMON = "\
>      pulseaudio-module-bluez5-discover \
>      pulseaudio-lib-bluez5-util \
>      sbc \
> +    linux-firmware-ibt-18 \
>  "
>  
>  BT_TI = "\
> -- 
> 2.31.1
> 

