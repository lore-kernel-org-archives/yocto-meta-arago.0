Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 445A952A78
	for <meta-arago@arago-project.org>;
	Wed, 18 Nov 2015 19:04:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAIJ4R1h028519
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:04:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJ4R5W029790
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:04:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Nov 2015 13:04:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJ4RWb029009;
	Wed, 18 Nov 2015 13:04:27 -0600
Date: Wed, 18 Nov 2015 14:04:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151118190411.GY3272@edge>
References: <1447872779-21321-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1447872779-21321-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-core-tisdk-image: Do not unset DEPLOY_SPL_NAME for all keystone
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
X-List-Received-Date: Wed, 18 Nov 2015 19:04:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Just to clarify - that only affects final SDK packaging. Relevant images are 
still built and deployed for supported machines in the deploy area.


On Wed, Nov 18, 2015 at 01:52:59PM -0500, Jacob Stiffler wrote:
> * DEPLOY_SPL_NAME is required for k2g-evm to provide the MLO
>   for MMC boot
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> index f313494..06884ae 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> @@ -1,7 +1,9 @@
>  require arago-core-tisdk-image.inc
>  
>  DEPLOY_SPL_NAME_omapl138 = ""
> -DEPLOY_SPL_NAME_keystone = ""
> +DEPLOY_SPL_NAME_k2hk-evm = ""
> +DEPLOY_SPL_NAME_k2l-evm = ""
> +DEPLOY_SPL_NAME_k2e-evm = ""
>  
>  ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
>  export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

