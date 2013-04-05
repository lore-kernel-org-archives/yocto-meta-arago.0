Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 72A1652A92
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 18:47:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35Il0WV031561
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:47:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35Il0xt020740
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:47:00 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Apr 2013 13:47:00 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r35Il0Tu027760;
	Fri, 5 Apr 2013 13:47:00 -0500
Date: Fri, 5 Apr 2013 14:47:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130405184659.GD10072@edge>
References: <1364828207-28819-1-git-send-email-fcooper@ti.com>
	<1364828207-28819-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1364828207-28819-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 17/17 v2] arago.conf: Set PREFERRED_VERSIONs for Wilink 6 recipes
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
X-List-Received-Date: Fri, 05 Apr 2013 18:47:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 01, 2013 at 09:56:47AM -0500, Franklin S. Cooper Jr wrote:
> * Currently two versions of Wilink 6 need to be supported.
> * The latest version supports the PG 3 wilink 6 module which is the version that
>   comes with the am37x-evm and am335x-evm .
> * An older version supports the PG 2 wilink 6 module which is the version that
>   comes with the am180x-evm.
> * Specifying the PREFERRED_VERSION to match this requirement.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> None. Apart of new patchset.
> 
>  meta-arago-distro/conf/distro/arago.conf |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 9e43ea3..44141c1 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -105,6 +105,23 @@ PREFERRED_VERSION_bluez-hcidump = "2.2"
>  PREFERRED_VERSION_bash = "3.2.48"
>  PREFERRED_VERSION_gettext = "0.16.1"
>  
> +# Support Wilink 6 PG 3 modules
> +PREFERRED_VERSION_ti-compat-bluetooth = "r5.sp3.05"
> +PREFERRED_VERSION_ti-compat-wireless-wl12xx = "r5.sp4.01"
> +PREFERRED_VERSION_wl12xx-firmware = "r5.sp4.01"
> +PREFERRED_VERSION_wpa-supplicant = "r5.sp4.01"
> +PREFERRED_VERSION_hostap-daemon = "r5.sp4.01"
> +PREFERRED_VERSION_ti-wifi-utils = "r5.sp3.05"
> +
> +# Support Wilink 6 PG 2 modules
> +# By default am180x-evms come with an outdated wilink 6 module
> +PREFERRED_VERSION_ti-compat-bluetooth_am180x-evm = "r5.00.18"
> +PREFERRED_VERSION_ti-compat-wireless-wl12xx_am180x-evm = "r5.00.18"
> +PREFERRED_VERSION_wl12xx-firmware_am180x-evm = "r5.00.18"
> +PREFERRED_VERSION_wpa-supplicant_am180x-evm = "r5.00.18"
> +PREFERRED_VERSION_hostap-daemon_am180x-evm = "r5.00.18"
> +PREFERRED_VERSION_ti-wifi-utils_am180x-evm = "r5.00.18"

Ok, I've been thinking about this versioning model for some time - it's quite 
ambiguous and can be a source of all kind of sorting problems. Here you set 
preferred versions, which is good for the build. But from a package manager 
it's unclear which one is preferred, moreover, if one is a clear upgrade path 
for the other, or not... So, basically, there will be problems in the field 
with this split and versioning of those packages. But I'm not sure if there's 
a better way to handle this exception.

-- 
Denys

>  # Disable polkit's systemd configuration from meta-oe
>  POLKITAUTH = ""
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

