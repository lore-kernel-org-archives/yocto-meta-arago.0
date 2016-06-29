Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C047852AAE
	for <meta-arago@arago-project.org>;
	Wed, 29 Jun 2016 13:58:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDv6kH023411
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:57:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDwE5A027691
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:58:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:58:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDwER6010753;
	Wed, 29 Jun 2016 08:58:14 -0500
Date: Wed, 29 Jun 2016 09:58:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160629135813.GG24597@edge>
References: <1467136156-24717-1-git-send-email-j-stiffler@ti.com>
	<1467136156-24717-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467136156-24717-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] openmpacc: bump SRCREV to version 1.3.2.0
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
X-List-Received-Date: Wed, 29 Jun 2016 13:58:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack


On Tue, Jun 28, 2016 at 01:49:16PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> index 4a00578..7e1adba 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> @@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
>  HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
>  LICENSE = "BSD"
>  
> -PV = "1.3.1.1"
> +PV = "1.3.2.0"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
> @@ -13,7 +13,7 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
>  OMPACC_GIT_PROTOCOL = "git"
>  OMPACC_GIT_BRANCH = "master"
>  
> -OMPACC_SRCREV = "a2b22adc8759bf1f5f1f999dcda0fdfa88ba9eba"
> +OMPACC_SRCREV = "26f6f8ef0ff800da3d49cccd5853c761b0673d2a"
>  
>  BRANCH = "${OMPACC_GIT_BRANCH}"
>  SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

