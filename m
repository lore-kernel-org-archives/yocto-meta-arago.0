Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C198F529D9
	for <meta-arago@arago-project.org>;
	Mon, 23 Feb 2015 21:17:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NLHVPc015266
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:17:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NLHUTU012522
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:17:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 15:17:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NLHUnY032528;
	Mon, 23 Feb 2015 15:17:30 -0600
Date: Mon, 23 Feb 2015 16:17:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150223211729.GM31287@edge>
References: <1424472995-22977-1-git-send-email-fcooper@ti.com>
	<1424472995-22977-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424472995-22977-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/4] packagegroup-arago-tisdk-*: Add back dual camera demo that supports Qt and 3.14
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
X-List-Received-Date: Mon, 23 Feb 2015 21:17:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 20, 2015 at 04:56:33PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons.bb             |    6 +++---
>  ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    7 +++++--
>  .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 6d98ba6..c6b07a9 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r19"
> +PR = "r20"
>  
>  inherit packagegroup
>  
> @@ -39,8 +39,8 @@ UTILS_append_dra7xx = " canutils"
>  UTILS_append_omap-a15 = " parted"
>  
>  UTILS_append_ti33x = " switch-config"
> -UTILS_append_ti43x = " switch-config"
> -UTILS_append_omap-a15 = " switch-config"
> +UTILS_append_ti43x = " switch-config libdrm-omap"
> +UTILS_append_omap-a15 = " switch-config libdrm-omap"

Any particular reason to add libdrm dependency in this packagegroup? It should 
be taken care of by DEPENDS and RDEPENDS of the actual package - i.e. dual-cam


>  RDEPENDS_${PN} = "\
>      ${UTILS} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> index 94fd786..8f7c4fe 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add multimedia related sources into the SDK"
>  LICENSE = "MIT"
> -PR = "r6"
> +PR = "r7"
>  
>  inherit packagegroup
>  
> @@ -16,7 +16,10 @@ MULTIMEDIA_append_am3517-evm = " \
>      av-examples-src \
>  "
>  
> -MULTIMEDIA_append_ti43x = ""
> +MULTIMEDIA_append_ti43x = " \
> +    dual-camera-demo-src \
> +    image-gallery-src \
> +"
>  
>  #Demo doesn't work on 3.14
>  # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 81d5ee1..dd495f8 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add multimedia related packages"
>  LICENSE = "MIT"
> -PR = "r10"
> +PR = "r11"
>  
>  inherit packagegroup
>  
> @@ -17,10 +17,10 @@ MULTIMEDIA_append_ti33x = " \
>  "
>  
>  MULTIMEDIA_append_ti43x = " \
> +    dual-camera-demo \
> +    image-gallery \
>      amsdk-av-files \
>  "
> -# demo doesn't work on 3.14
> -# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)}
>  
>  MULTIMEDIA_append_omap-a15 = " \
>      amsdk-av-files \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

