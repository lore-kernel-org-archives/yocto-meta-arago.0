Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 221C5529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 18:53:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15IrAtX010779
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:53:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15IrAow028943
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 12:53:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 12:53:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15Ir96q021694;
	Wed, 5 Feb 2014 12:53:10 -0600
Date: Wed, 5 Feb 2014 13:53:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140205185309.GR18784@edge>
References: <1391625096-21593-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391625096-21593-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] dual-camera-demo: Pull in latest commits of camera demo
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 18:53:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 05, 2014 at 12:31:36PM -0600, Franklin S. Cooper Jr wrote:
> * This demo is going to be frequently updated for a couple of weeks.
> * Set to AUTOREV until this demo stops updating so often.

We are in code freeze for the next release in about 2 weeks, so cannot do 
AUTOREV there...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 12f42e5..ba891d5 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f88
>  
>  require recipes-core/matrix/matrix-gui-paths.inc
>  
> -PR = "r0"
> +PR = "r1"
>  
>  BRANCH = "master"
> -SRCREV = "af299a206482562ceae8aa690a8b6644a3e0a66e"
> +SRCREV = "${AUTOREV}"
>  
>  SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

