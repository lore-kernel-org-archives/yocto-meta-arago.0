Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A8881529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:47:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IlvEi011923
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:47:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IlvY7025343
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:47:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 12:47:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IlvmN008262;
	Wed, 5 Feb 2014 12:47:57 -0600
Date: Wed, 5 Feb 2014 13:47:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140205184757.GQ18784@edge>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-5-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391630646-9727-5-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 5/6] arago-core-tisdk-image: add support for keystone devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:47:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 05, 2014 at 02:04:05PM -0600, Chase Maupin wrote:
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/images/arago-core-tisdk-image.bb  |    1 +
>  .../recipes-core/images/arago-core-tisdk-image.inc |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> index 33bfc11..ccddbc1 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> @@ -1,5 +1,6 @@
>  require arago-core-tisdk-image.inc
>  
>  DEPLOY_SPL_NAME_omapl138 = ""
> +DEPLOY_SPL_NAME_keystone = ""
>  
>  export IMAGE_BASENAME = "arago-core-tisdk-image"
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 74c2b87..e3de734 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -7,7 +7,7 @@ IMAGE_FSTYPES = "tar.gz"
>  
>  inherit tisdk-image
>  
> -COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15"
> +COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15|keystone"
>  
>  # List of packages to remove from the host package.  This is usually due to
>  # licensing issues and unneeded dependencies.
> @@ -21,6 +21,7 @@ DTB_FILTER_ti33x = "am335x"
>  DTB_FILTER_omap5-evm = "omap5"
>  DTB_FILTER_dra7xx-evm = "dra7"
>  DTB_FILTER_ti43x = "am43"
> +DTB_FILTER_keystone = "k2hk"
>  
>  # List of target side images to build for the SDK
>  TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"

Missing here:

TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"


> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

