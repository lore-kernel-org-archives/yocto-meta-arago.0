Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DF5D052090
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 17:30:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QHUVK9012788
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 12:30:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHUVcq021587
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 12:30:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 12:30:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHUUJ1023473;
	Thu, 26 Sep 2013 12:30:30 -0500
Date: Thu, 26 Sep 2013 13:30:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yan Liu <yan-liu@ti.com>
Message-ID: <20130926173030.GW14528@edge>
References: <1380206022-9282-1-git-send-email-yan-liu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380206022-9282-1-git-send-email-yan-liu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [Meta-arago PATCH v1] busybox: Enable dd ibs obs option which turns on the conv= options
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
X-List-Received-Date: Thu, 26 Sep 2013 17:30:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack. Will push it later.

On Thu, Sep 26, 2013 at 10:33:42AM -0400, Yan Liu wrote:
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  meta-arago-distro/recipes-core/busybox/busybox/defconfig       | 2 +-
>  meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> index 5961447..7736031 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
> @@ -199,7 +199,7 @@ CONFIG_CUT=y
>  CONFIG_DD=y
>  CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
>  # CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
> -# CONFIG_FEATURE_DD_IBS_OBS is not set
> +CONFIG_FEATURE_DD_IBS_OBS=y
>  CONFIG_DF=y
>  # CONFIG_FEATURE_DF_FANCY is not set
>  CONFIG_DIRNAME=y
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> index 8edb493..be174ef 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago8"
> +PR_append = "-arago9"
>  
>  SRC_URI += " \
>  	file://inetd \
> -- 
> 1.8.3.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

