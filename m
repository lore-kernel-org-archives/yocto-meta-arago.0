Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 687AF529D9
	for <meta-arago@arago-project.org>;
	Mon, 23 Feb 2015 21:19:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NLJ32o010793
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:19:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NLJ2id004056
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 15:19:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 15:19:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NLJ24M030377;
	Mon, 23 Feb 2015 15:19:02 -0600
Date: Mon, 23 Feb 2015 16:19:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150223211901.GN31287@edge>
References: <1424697513-22767-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424697513-22767-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago 1/1] glsdk-example-apps: Update SRCREV for GLSDK 7.00 EA
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
X-List-Received-Date: Mon, 23 Feb 2015 21:19:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 23, 2015 at 06:48:33PM +0530, Karthik Ramanan wrote:
>  * Also update dependency to gstreamer 1.0

This is all nice and all, but we should coordinate switching gstreamer version 
across the board, or else we'll end up with both of them built into rootfs...


> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../glsdk-example-apps/glsdk-example-apps.bb       |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> index a6b45b8..6598d7d 100644
> --- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> +++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
>  
> -DEPENDS = "gstreamer libdrm ti-ipc"
> +DEPENDS = "gstreamer1.0 libdrm ti-ipc"
>  
>  COMPATIBLE_MACHINE = "dra7xx-evm"
>  
> @@ -12,6 +12,7 @@ S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
>  
>  SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
> -SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
> +SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
> +
> +PR = "r2"
>  
> -PR = "r1"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

