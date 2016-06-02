Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 8D2F752007
	for <meta-arago@arago-project.org>;
	Thu,  2 Jun 2016 15:47:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u52FlSrb016580
	for <meta-arago@arago-project.org>; Thu, 2 Jun 2016 10:47:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u52FlSla000809
	for <meta-arago@arago-project.org>; Thu, 2 Jun 2016 10:47:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Jun 2016 10:47:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u52FlRDJ008762;
	Thu, 2 Jun 2016 10:47:28 -0500
Date: Thu, 2 Jun 2016 11:47:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20160602154711.GK6057@edge>
References: <1464879463-2583-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1464879463-2583-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH] LINALG: Corrected offload tables for small memory model.
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
X-List-Received-Date: Thu, 02 Jun 2016 15:47:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should this also go to krogoth?

On Thu, Jun 02, 2016 at 10:57:43AM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> index 4e058e6..bb132dc 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
>  LICENSE = "BSD-3-Clause"
>  
>  PV = "1_2_0_0"
> -INC_PR = "r3"
> +INC_PR = "r4"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
>  LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
> -SRCREV = "5e7adc2d187df1a41fae5c23d7f3fedbb0ae039c"
> +SRCREV = "19bc67da92b66acc99941183868ffb0dc234a0e9"
>  
>  DEPENDS = "common-csl-ip \
>             libarch \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

