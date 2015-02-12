Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6F5EF5297F
	for <meta-arago@arago-project.org>;
	Thu, 12 Feb 2015 21:09:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1CL9GAt023966
	for <meta-arago@arago-project.org>; Thu, 12 Feb 2015 15:09:16 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1CL9F9G015246
	for <meta-arago@arago-project.org>; Thu, 12 Feb 2015 15:09:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Feb 2015 15:09:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1CL9FVV002320;
	Thu, 12 Feb 2015 15:09:15 -0600
Date: Thu, 12 Feb 2015 16:09:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-ID: <20150212210914.GC20106@edge>
References: <1422541885-5800-1-git-send-email-a0393906@ti.com>
	<B0581B5571079145BA1CD78C126DBDE7321FCD18@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE7321FCD18@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 12 Feb 2015 21:09:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping. Have we come to any agreement on this one?


On Thu, Jan 29, 2015 at 03:19:08PM +0000, Dmytriyenko, Denys wrote:
> Karthik,
> 
> The reason it was limited to 16MB in early days is because we had platforms 
> with only 32MB of RAM and letting tmpfs fill up uncontrollable was dangerous 
> and was making the system very unstable.
> 
> One of the options is to have per-machine RAM/tmpfs setting, which can get 
> propagated to /etc/fstab accordingly - e.g. 32/64 for am335x/am437 and 
> 64/128 for dra7xx, etc.
> 
> -- 
> Denys
> 
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Thursday, January 29, 2015 9:31 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
> 
> * Weston applications allocate memory from tmpfs, need to
>   increase the tmpfs area to atleast 50M. Can this be
>   increased more - what are the pros/cons?
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/base-files/base-files/fstab       |    2 +-
>  .../base-files/base-files_3.0.14.bbappend          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> index 9ed6f33..8ddadd9 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> +++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> @@ -5,7 +5,7 @@ proc                 /proc                proc       defaults              0  0
>  devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
>  usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
>  tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> -tmpfs                /var/volatile        tmpfs      defaults,size=16M     0  0
> +tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
>  tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
>  
>  # uncomment this if your device has a SD/MMC/Transflash slot diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> index 40b7722..956a057 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
> +++ nd
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago3"
> +PR_append = "-arago4"
> --
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

