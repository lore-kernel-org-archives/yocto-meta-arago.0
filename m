Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F0E1552990
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 21:00:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UL0mwo026458
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 16:00:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UL0m26011197
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 16:00:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 30 Sep 2013 16:00:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UL0lxN004726;
	Mon, 30 Sep 2013 16:00:47 -0500
Date: Mon, 30 Sep 2013 17:00:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130930210046.GE24472@edge>
References: <1380577383-21395-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380577383-21395-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-prefs: Update preferred U-Boot version
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
X-List-Received-Date: Mon, 30 Sep 2013 21:00:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 30, 2013 at 04:43:03PM -0500, Chase Maupin wrote:
> * The latest version has switched to rc2 instead of rc1.  Update
>   the preferred version to avoid messages about not being able to
>   find the rc1 version.

It's the default now, just kill the line completely.


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 70f02b9..5ac21ed 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -32,7 +32,7 @@ PREFERRED_VERSION_linux-libc-headers_am437x-evm = "3.8"
>  PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
> -PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.07+2013.10-rc1"
> +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm = "2013.07+2013.10-rc2"
>  
>  PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
>  PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

