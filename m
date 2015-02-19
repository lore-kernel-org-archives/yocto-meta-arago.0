Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 67BC152A4F
	for <meta-arago@arago-project.org>;
	Thu, 19 Feb 2015 21:36:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1JLabX9004924
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 15:36:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1JLaaTD000875
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 15:36:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Feb 2015 15:36:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1JLaZ3W026908;
	Thu, 19 Feb 2015 15:36:35 -0600
Date: Thu, 19 Feb 2015 16:36:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150219213635.GD30272@edge>
References: <1424079134-2421-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424079134-2421-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: omapdrmtest: Updated applications for GLSDK 7.00EA
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
X-List-Received-Date: Thu, 19 Feb 2015 21:36:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, I like the detailed changelog in the description below! Thanks.


On Mon, Feb 16, 2015 at 03:02:14PM +0530, Karthik Ramanan wrote:
>  * dmabuftest: Use single planar buffers
>  * capturevpedisplay: Request interlaced capture and pass field ids
>  * v4l2: Add latency measurement
>  * dmabuftest: Return from thread if streamon fails
>  * dmabuftest: Remove switch thread logic
>  * display-kmscube: Render full video buffer
>  * display-kmscube: Render multiple videos on cube faces
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../omapdrmtest/omapdrmtest_1.0.0.bb               |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index 04fc2e7..1c878c3 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux"
>  
>  inherit autotools pkgconfig
>  
> -PR = "r4"
> -SRCREV = "04da689692ec7cd3ef0f315c9c00d9051cefdd10"
> +PR = "r5"
> +SRCREV = "a2f483ef833ce7a6f3e0b975d9e49267960b288e"
>  
>  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

