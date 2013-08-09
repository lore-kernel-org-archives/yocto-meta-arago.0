Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3A44552A30
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2013 14:45:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r79EjPPK028775
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2013 09:45:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r79EjPA7016382
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2013 09:45:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 9 Aug 2013 09:45:24 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r79EjOxT014949;
	Fri, 9 Aug 2013 09:45:25 -0500
Date: Fri, 9 Aug 2013 10:45:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20130809144524.GH25015@edge>
References: <1376058336-31921-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1376058336-31921-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Yan Liu <yan-liu@ti.com>
Subject: Re: [PATCH] busybox: Enable timeout command
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
X-List-Received-Date: Fri, 09 Aug 2013 14:45:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 09, 2013 at 10:25:36AM -0400, Carlos Hernandez wrote:
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> Signed-off-by: Carlos Hernandez <ceh@ti.com>

Great execution, thanks guys!


> ---
>  .../recipes-core/busybox/busybox/defconfig         |    2 +-
>  .../recipes-core/busybox/busybox_1.20.2.bbappend   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> index 16ebdf0..5961447 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -705,7 +705,7 @@ CONFIG_STRINGS=y
>  # CONFIG_TASKSET is not set
>  # CONFIG_FEATURE_TASKSET_FANCY is not set
>  CONFIG_TIME=y
> -# CONFIG_TIMEOUT is not set
> +CONFIG_TIMEOUT=y
>  # CONFIG_TTYSIZE is not set
>  # CONFIG_VOLNAME is not set
>  # CONFIG_WALL is not set
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> index 4cf7821..8edb493 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago7"
> +PR_append = "-arago8"
>  
>  SRC_URI += " \
>  	file://inetd \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

