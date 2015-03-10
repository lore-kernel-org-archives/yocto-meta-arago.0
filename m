Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B0F9352A31
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 16:28:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AGSYdP013159;
	Tue, 10 Mar 2015 11:28:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGSXLI026869;
	Tue, 10 Mar 2015 11:28:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 11:28:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGSXJ6031520;
	Tue, 10 Mar 2015 11:28:33 -0500
Date: Tue, 10 Mar 2015 12:28:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20150310162832.GD21244@edge>
References: <1425606209-28305-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1425606209-28305-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-core-tisdk-image: unify SDK images by passing specific name via branding
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
X-List-Received-Date: Tue, 10 Mar 2015 16:28:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any comments? If not, I'll push it later today.


On Thu, Mar 05, 2015 at 08:43:29PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/branding-amsdk.inc        | 1 +
>  meta-arago-distro/recipes-core/images/arago-amsdk-image.bb      | 5 -----
>  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
>  3 files changed, 3 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> index 08990b8..3f3c5e4 100644
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> @@ -1,3 +1,4 @@
> +ARAGO_TISDK_IMAGE = "arago-amsdk-image"
>  
>  QT_PROVIDER := "${@bb.utils.contains('SOC_FAMILY','omap-a15:dra7xx','qt5','qt4e',d)}"
>  
> diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> deleted file mode 100644
> index 5995507..0000000
> --- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require arago-core-tisdk-image.inc
> -
> -DEPLOY_SPL_NAME_omapl138 = ""
> -
> -export IMAGE_BASENAME = "arago-amsdk-image"
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> index ccddbc1..f313494 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> @@ -3,4 +3,5 @@ require arago-core-tisdk-image.inc
>  DEPLOY_SPL_NAME_omapl138 = ""
>  DEPLOY_SPL_NAME_keystone = ""
>  
> -export IMAGE_BASENAME = "arago-core-tisdk-image"
> +ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
> +export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> -- 
> 2.2.0
> 

