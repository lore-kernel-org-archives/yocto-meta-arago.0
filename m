Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 29E63529F1
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 14:58:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2GEwrj6032611
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2015 09:58:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2GEwq6S032353
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2015 09:58:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Mar 2015 09:58:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2GEwpZ2004976;
	Mon, 16 Mar 2015 09:58:52 -0500
Date: Mon, 16 Mar 2015 10:58:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150316145851.GD4669@edge>
References: <1426248313-28486-1-git-send-email-j-stiffler@ti.com>
	<1426248313-28486-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426248313-28486-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] packagegroup-arago-tisdk-matrix: Change conditions for including ts-calibrate-init.
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
X-List-Received-Date: Mon, 16 Mar 2015 14:58:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 13, 2015 at 08:05:13AM -0400, Jacob Stiffler wrote:
> * Include if wayland not a DISTRO_FEATURE.

NAK, see below


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index d8386f5..094d93a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r36"
> +PR = "r37"
>  
>  inherit packagegroup
>  
> @@ -49,7 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
>      matrix-multimedia-demo-h264dec      \
>      matrix-multimedia-demo-mpeg4aacdec   \
>      matrix-multimedia-demo-mpeg4dec     \
> -    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
>  "
>  
>  MATRIX_APPS_append_ti33x = "        \
> @@ -66,7 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
>      matrix-gui-clocks               \
>      matrix-gui-pm-demos-governor    \
>                                      \
> -    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
> +    ${@base_conditional('WAYLAND_SUPPORT', '1', '', 'ts-calibrate-init', d)} \

^^^


>  "
>  
>  MATRIX_APPS_append_ti43x = "        \
> @@ -84,7 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
>      matrix-gui-pm-demos-governor    \
>      matrix-gui-apps-dual-camera     \
>      matrix-gui-apps-image-gallery   \
> -    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
> +    ${@base_conditional('WAYLAND_SUPPORT', '1', '', 'ts-calibrate-init', d)} \

^^^


>  "
>  
>  MATRIX_APPS_append_omap-a15 = "     \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

