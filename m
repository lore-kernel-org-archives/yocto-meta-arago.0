Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 20D8E52AAD
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2017 23:00:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v12N00c3024359
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2017 17:00:00 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v12N002v025783
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2017 17:00:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Feb 2017 17:00:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v12N00rp006197;
	Thu, 2 Feb 2017 17:00:00 -0600
Date: Thu, 2 Feb 2017 17:59:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170202225959.GE17888@edge>
References: <1486068517-57574-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486068517-57574-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] dual-camera-demo: update BRANCH and SRCREV to pick up the latest fixes
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
X-List-Received-Date: Thu, 02 Feb 2017 23:00:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

krogoth?

On Thu, Feb 02, 2017 at 03:48:37PM -0500, Eric Ruei wrote:
> - fix tearing issue
> - bug fix for resolution less than 640
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 1b1cbfe..6c36b98 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>  DEPENDS += "libdrm"
>  require recipes-core/matrix/matrix-gui-paths.inc
>  
> -PR = "r15"
> +PR = "r16"
>  
> -BRANCH = "drm"
> -SRCREV = "9acc9b17da17ae84e3d4d25fb83d4a8e4cf53fd2"
> +BRANCH = "master"
> +SRCREV = "5e250641bfbc8a1a90e5b98527d2012729d54c09"
>  
>  SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
>             file://desc_dual-camera.html \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

