Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4921052A27
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:05:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K5aVw006725
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:05:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K5aZa002446
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:05:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:05:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K5aAD009927;
	Wed, 4 Nov 2015 14:05:36 -0600
Date: Wed, 4 Nov 2015 15:05:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20151104200520.GJ25957@edge>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-7-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1446667217-21466-7-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/7] matrix-gui-3d-demos: add kmscube for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 20:05:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 04, 2015 at 03:00:16PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> index 4373d5f..710bb75 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>  
>  require matrix-gui-apps-git.inc
>  
> -PR = "${INC_PR}.5"
> +PR = "${INC_PR}.6"
>  
>  S = "${WORKDIR}/git/3d_apps"
>  
> @@ -33,6 +33,10 @@ PACKAGES_append_omap-a15 = " \
>              matrix-3d-demo-kmscubevideo \
>  "
>  
> +PACKAGES_append_ti43x = " \
> +            matrix-3d-demo-kmscube \

What about kmscubevideo one?


> +"
> +
>  MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
>  
>  do_install_prepend() {
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

