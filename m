Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 06ABE52A5F
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:16:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FG4b0012666
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:16:04 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FG3h6009979
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:16:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 09:16:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FG2df017790;
	Thu, 5 Feb 2015 09:16:02 -0600
Date: Thu, 5 Feb 2015 10:16:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150205151601.GE9943@edge>
References: <1423099193-20065-1-git-send-email-fcooper@ti.com>
	<1423099193-20065-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423099193-20065-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] packagegroup-arago-tisdk-matrix: Remove dual camera and image-gallery
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
X-List-Received-Date: Thu, 05 Feb 2015 15:16:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 04, 2015 at 07:19:52PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Remove image gallery and dual camera since they aren't support on 3.14 kernel

Do you want to remove it completely or will it be fixed soon?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 0fe7bc5..9e00619 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r34"
> +PR = "r35"
>  
>  inherit packagegroup
>  
> @@ -77,7 +77,6 @@ MATRIX_APPS_append_ti43x = "        \
>      matrix-multimedia-demo-mpeg4aacdec \
>      matrix-multimedia-demo-mpeg4dec \
>                                      \
> -    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)} \
>                                      \
>      matrix-gui-generic-pm           \
>      matrix-gui-pm-demos-suspend     \
> @@ -85,6 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
>      matrix-gui-pm-demos-governor    \
>      ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
>  "
> +# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)}
>  
>  MATRIX_APPS_append_omap-a15 = "     \
>      matrix-multimedia-demo-aac      \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

