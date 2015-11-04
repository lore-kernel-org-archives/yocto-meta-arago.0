Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 125E752A27
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:06:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K6hn4009217
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:06:43 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K6hbM011862
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:06:43 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:06:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K6hFu012052;
	Wed, 4 Nov 2015 14:06:43 -0600
Date: Wed, 4 Nov 2015 15:06:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20151104200627.GK25957@edge>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-8-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1446667217-21466-8-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:06:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 04, 2015 at 03:00:17PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index a6d1b39..a63b8ea 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r45"
> +PR = "r46"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -49,6 +49,14 @@ MATRIX_SGX_DEMOS_omap-a15 = " \
>      matrix-3d-demo-kmscubevideo \
>  "
>  
> +MATRIX_SGX_DEMOS_ti43x = " \
> +    matrix-3d-demo-chameleon \
> +    matrix-3d-demo-coverflow \
> +    matrix-3d-demo-navigation \
> +    matrix-3d-demo-exampleui \
> +    matrix-3d-demo-kmscube \

Same question as before about kmscubevideo - that is used on omap-a15...


> +"
> +
>  MATRIX_QT_APPS_keystone = ""
>  
>  MATRIX_APPS = ""
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

