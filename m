Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5CF1D529A7
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2015 22:02:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t77M2ZmC007166
	for <meta-arago@arago-project.org>; Fri, 7 Aug 2015 17:02:35 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t77M2ZEl004035
	for <meta-arago@arago-project.org>; Fri, 7 Aug 2015 17:02:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 7 Aug 2015 17:02:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t77M2Ypk006611;
	Fri, 7 Aug 2015 17:02:35 -0500
Date: Fri, 7 Aug 2015 18:02:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20150807220219.GP1040@edge>
References: <1438893831-10514-1-git-send-email-dannenberg@ti.com>
MIME-Version: 1.0
In-Reply-To: <1438893831-10514-1-git-send-email-dannenberg@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-gpl-notice: Fix spelling mistake in user-facing GPL notice
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
X-List-Received-Date: Fri, 07 Aug 2015 22:02:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, pushed.


On Thu, Aug 06, 2015 at 03:43:51PM -0500, Andreas Dannenberg wrote:
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb     | 2 +-
>  .../arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
> index e9757c5..d9d3710 100644
> --- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
> +++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Script to warn users of GPLv3 content on the target file system a
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  S = "${WORKDIR}"
>  
> diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
> index 090735b..08cb3b4 100644
> --- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
> +++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
> @@ -36,7 +36,7 @@ then
>  cat << EOM 2>&1
>  ***************************************************************
>  ***************************************************************
> -NOTICE: This file system contains the followin GPLv3 packages:
> +NOTICE: This file system contains the following GPLv3 packages:
>  EOM
>      echo -e $gplv3_packages 2>&1
>  cat << EOM 2>&1
> -- 
> 1.9.1
> 

