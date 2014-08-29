Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A3E9452979
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:11:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THBDuP004775
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:11:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THBCqQ031039
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:11:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:11:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THBCQX019634;
	Fri, 29 Aug 2014 12:11:12 -0500
Date: Fri, 29 Aug 2014 13:11:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140829171111.GI18620@edge>
References: <1408672731-19277-1-git-send-email-fcooper@ti.com>
	<1408672731-19277-6-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1408672731-19277-6-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/9] matrix-gui: Update commit to remove border for HTML Matrix Apps
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
X-List-Received-Date: Fri, 29 Aug 2014 17:11:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 21, 2014 at 08:58:48PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 42f0c3b..77a6583 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r19"
> +PR = "20"

Typo ^^^


>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> @@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  inherit update-rc.d
>  
>  BRANCH ?= "master"
> -SRCREV = "d0fcc5ab50c9ecdf7a3cc5610807d16a6c91a850"
> +SRCREV = "d65a5e1d178bb30653f16322bebf7e7ee530d613"
>  
>  SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
>             file://init \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

