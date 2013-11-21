Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8F2C652986
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 04:55:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAL4t9Xi015826
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 22:55:09 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAL4t94G031408
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 22:55:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Nov 2013 22:55:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAL4t9ZB022581;
	Wed, 20 Nov 2013 22:55:09 -0600
Date: Wed, 20 Nov 2013 23:55:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131121045508.GJ29952@edge>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-7-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1384887728-8628-7-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: Add additional example application for AM43x
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
X-List-Received-Date: Thu, 21 Nov 2013 04:55:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 19, 2013 at 01:02:08PM -0600, Franklin S. Cooper Jr wrote:
> * Add additional example applications for AM43x.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 95054b2..c3143d3 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r22"
> +PR = "r23"
>  
>  inherit packagegroup
>  
> @@ -72,10 +72,16 @@ MATRIX_APPS_append_ti33x = "        \
>  #    matrix-gui-wifi-direct-demo
>  
>  MATRIX_APPS_append_ti43x = "        \
> +    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \

So, I just noticed, that in patch #3 of this series, you add SGX libgles 
unconditionally, but here you do check for the proper MACHINE_FEATURE...

Should it be one way or another? If you update patch #3 with conditional like 
here, the whole series can be pushed even prior to the new SGX in meta-ti...


>      matrix-multimedia-demo-aac      \
>      matrix-multimedia-demo-h264dec  \
>      matrix-multimedia-demo-mpeg4aacdec \
>      matrix-multimedia-demo-mpeg4dec \
> +                                    \
> +    matrix-gui-generic-pm           \
> +    matrix-gui-pm-demos-suspend     \
> +    matrix-gui-clocks               \
>  "
>  
>  MATRIX_APPS_append_omap-a15 = "     \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

