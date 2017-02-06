Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 63BAA5298B
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 18:11:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16IB4aY018594
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 12:11:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16IB3Ti018456
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 12:11:04 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Feb 2017 12:11:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16IB2kL021674;
	Mon, 6 Feb 2017 12:11:02 -0600
Date: Mon, 6 Feb 2017 13:11:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170206181101.GI25590@edge>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
	<1486160539-23523-6-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486160539-23523-6-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/krogoth][PATCH 5/6] packagegroup-arago-tisdk-matrix: add barcode-roi demo
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
X-List-Received-Date: Mon, 06 Feb 2017 18:11:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hongmei,

Can you please re-do this patch due to this change:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=908f169117c7589eabc78a392e8c43eb099553cd

barcode-roi depends on opencv/opencl and hence should be in MATRIX_OPENCL_APPS 
list, which gets conditionally included based on corresponding MACHINE_FEATURE.

-- 
Denys


On Fri, Feb 03, 2017 at 05:22:18PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index a851ed5..7358da4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r61"
> +PR = "r62"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -76,6 +76,7 @@ MATRIX_APPS_append_ti33x = "        \
>      matrix-gui-pm-demos-governor    \
>                                      \
>      matrix-gui-ethernet-demos       \
> +    matrix-machinevision-demo-barcoderoi \
>  "
>  
>  MATRIX_APPS_append_ti43x = "        \
> @@ -91,6 +92,7 @@ MATRIX_APPS_append_ti43x = "        \
>                                      \
>      matrix-gui-apps-dual-camera     \
>      matrix-gui-apps-image-gallery   \
> +    matrix-machinevision-demo-barcoderoi \
>  "
>  
>  MATRIX_APPS_append_omap-a15 = "     \
> @@ -105,6 +107,7 @@ MATRIX_APPS_append_omap-a15 = "     \
>      matrix-gui-generic-pm           \
>      matrix-gui-clocks               \
>      matrix-gui-pm-demos-governor    \
> +    matrix-machinevision-demo-barcoderoi \
>  "
>  
>  MATRIX_APPS_append_dra7xx += " \
> @@ -116,6 +119,7 @@ MATRIX_APPS_append_keystone = " \
>      matrix-gui-utility-demos    \
>      matrix-mc-demo-ipc          \
>      matrix-multimedia-demo-dsp66imgproc-f2f \
> +    matrix-machinevision-demo-barcoderoi-f2f \
>  "
>  
>  RDEPENDS_${PN} = "        \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

