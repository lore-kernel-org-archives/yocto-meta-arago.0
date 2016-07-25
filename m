Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BA38C529B2
	for <meta-arago@arago-project.org>;
	Mon, 25 Jul 2016 18:53:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6PInv4j005139
	for <meta-arago@arago-project.org>; Mon, 25 Jul 2016 13:49:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6PIr6Bm032609
	for <meta-arago@arago-project.org>; Mon, 25 Jul 2016 13:53:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 25 Jul 2016 13:53:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6PIr63P004264;
	Mon, 25 Jul 2016 13:53:06 -0500
Date: Mon, 25 Jul 2016 14:53:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160725185306.GK10741@edge>
References: <1468332255-31745-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1468332255-31745-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl: bump SRCREV to version 1.1.9.1
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
X-List-Received-Date: Mon, 25 Jul 2016 18:53:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 12, 2016 at 10:04:15AM -0400, Jacob Stiffler wrote:
> * includes examples fix to link with libdl
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc                | 4 ++--
>  meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb | 6 ++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 9d371ee..4df0c9e 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.9.0"
> +PV = "1.1.9.1"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "79860f4b641a45bf689ea127a1525db90d74b5c7"
> +OCL_SRCREV = "aa89b7359d6328e98fa80c55c3b73543c53a1bbc"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index da14f1a..2a4b714 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -4,9 +4,7 @@ LICENSE = "BSD"
>  
>  include ocl.inc
>  
> -PR = "${INC_PR}.1"
> -
> -SRC_URI_append = " file://0001-float_compute-matmpy-Link-with-libdl-to-resolve-link.patch;pnum=2"

Should this patch be removed now?


> +PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -81,4 +79,4 @@ FILES_${PN}-dbg += "\
>      ${datadir}/ti/examples/opencl/*/.debug \
>  "
>  
> -INSANE_SKIP_${PN} = "arch ldflags textrel"
> +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

