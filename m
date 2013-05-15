Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 04B8352A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 18:37:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FIbYgp024983
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:37:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FIbYK9026833
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:37:34 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 15 May 2013 13:37:33 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4FIbXrO027420;
	Wed, 15 May 2013 13:37:33 -0500
Date: Wed, 15 May 2013 14:37:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20130515183733.GB20048@edge>
References: <1368642748-30517-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1368642748-30517-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-matrix: remove ethernet menu from common apps
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
X-List-Received-Date: Wed, 15 May 2013 18:37:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Don't you have ethernet on Keystone?

On Wed, May 15, 2013 at 02:32:28PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index dda72af..2b40f98 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r15"
> +PR = "r16"
>  
>  inherit packagegroup
>  
> @@ -22,7 +22,6 @@ MATRIX_COMMON_APPS = "              \
>      matrix-gui-oprofile-demos       \
>      matrix-gui-settings-demos       \
>      matrix-gui-usb-demos            \
> -    matrix-gui-submenus-ethernet    \
>  "
>  
>  MATRIX_QT_APPS = "                  \
> @@ -47,6 +46,7 @@ MATRIX_APPS_append_omap3 = "        \
>  "
>  
>  MATRIX_APPS_append_ti33x = "        \
> +    matrix-gui-submenus-ethernet    \

So, what about other machines besides ti33x?


>      matrix-gui-ethernet-demos       \
>      ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
>      matrix-gui-multimedia-demos     \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

