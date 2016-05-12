Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6FCA352079
	for <meta-arago@arago-project.org>;
	Thu, 12 May 2016 18:15:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4CIFZmR004881
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 13:15:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CIFZO4010261
	for <meta-arago@arago-project.org>; Thu, 12 May 2016 13:15:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 May 2016 13:15:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CIFY6A018662;
	Thu, 12 May 2016 13:15:34 -0500
Date: Thu, 12 May 2016 14:15:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20160512181519.GU16188@edge>
References: <1463075682-15147-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1463075682-15147-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH] LINALG: Bump SRCREV for source code changes: 1. fixed potential memory leakage in ARM wrapper code 2. added offload tables for AM572x 3. cleaned up tuning code 4. added -ldl to linker options for building the examples
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
X-List-Received-Date: Thu, 12 May 2016 18:15:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Your entire changelog went into the subject. You need to leave a blank line to 
separate one-line changelog from a detailed one.


On Thu, May 12, 2016 at 01:54:42PM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> index bb8efdf..4bf870d 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
>  LICENSE = "BSD-3-Clause"
>  
>  PV = "1_2_0_0"
> -INC_PR = "r1"
> +INC_PR = "r2"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
>  LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
> -SRCREV = "5e435f2457565ed7c6199406ef248370bb2a4ad2"
> +SRCREV = "a7bc95a18a6ba11dbfc91dd65e16a478b756162c"
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

