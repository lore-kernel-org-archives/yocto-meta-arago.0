Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 84D6352A4D
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:58:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Fwm11011490
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:58:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61FwmtI028966
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:58:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:58:48 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r61FwmP3010081;
	Mon, 1 Jul 2013 10:58:48 -0500
Date: Mon, 1 Jul 2013 11:58:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Message-ID: <20130701155847.GC4588@edge>
References: <20130701154513.GA1540@ti.com>
MIME-Version: 1.0
In-Reply-To: <20130701154513.GA1540@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Mon, 01 Jul 2013 15:58:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2013 at 09:15:13PM +0530, Mrinmayee Hingolikar wrote:
> * Showcases 3D graphics on SGX using kms and gbm
> 
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../recipes-graphics/kmscube/kmscube.inc           |    8 ++++++++
>  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |    7 +++++++

Same comment here - it's a single recipe, no need to split out .inc here. 
Unless, there are plans to have multiple recipe versions, in which case having 
common .inc makes sense. But are there such plans?


>  2 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube.inc
>  create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube.inc b/meta-arago-extras/recipes-graphics/kmscube/kmscube.inc
> new file mode 100644
> index 0000000..10a5b16
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube.inc
> @@ -0,0 +1,8 @@
> +SUMMARY = "Demo application to showcase 3D graphics on SGX using kms and gbm"
> +HOMEPAGE = "http://git.ti.com"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
> +
> +COMPATIBLE_MACHINE = "omap-a15"

Just omap5-evm? Would omap-a15 SOC be better? Is it compatible with J6?


> +
> +inherit autotools pkgconfig
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> new file mode 100644
> index 0000000..af1c50b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> @@ -0,0 +1,7 @@
> +require kmscube.inc
> +
> +SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

