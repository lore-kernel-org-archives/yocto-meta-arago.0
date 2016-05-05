Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0D41252AA0
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 15:12:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45FCtmr013902
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 10:12:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45FCtNv025671
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 10:12:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 10:12:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45FCsmk020880;
	Thu, 5 May 2016 10:12:54 -0500
Date: Thu, 5 May 2016 11:12:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160505151238.GI12998@edge>
References: <1462460942-14363-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1462460942-14363-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] Revert "HACK: opencl: disable cmem dependency due to build failure"
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
X-List-Received-Date: Thu, 05 May 2016 15:12:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NACK, I'm sitting on a patch to disable all previous hacks in one go. Can't 
push it due to the other breakage we've discussed.

On Thu, May 05, 2016 at 11:09:00AM -0400, Jacob Stiffler wrote:
> This reverts commit 2ad662005f4778a4082103a67bb42661187c41e3.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index 028ae81..7954f2f 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -13,10 +13,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES += " ${PN}-runtime"
>  
> -#            cmem
>  DEPENDS = " ocl-gl-headers \
>              opencl-monitor \
>              cmake-native \
> +            cmem \
>              ti-llvm3.6 \
>              ti-llvm3.6-native \
>              binutils \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

