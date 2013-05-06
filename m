Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6726F52A2E
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 22:52:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46Mqb5V006811
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 17:52:37 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46MqbeC004568
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 17:52:37 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 17:52:37 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r46Mqbla024840;
	Mon, 6 May 2013 17:52:37 -0500
Date: Mon, 6 May 2013 18:52:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130506225236.GF10607@edge>
References: <1367875707-8579-1-git-send-email-fcooper@ti.com>
	<1367875707-8579-6-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367875707-8579-6-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/6] av-examples: Grab CFLAGS from OE or Rules.make
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
X-List-Received-Date: Mon, 06 May 2013 22:52:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, thanks for fixing av-examples - I haven't seen the breakage until I 
started building for am37x and am3517...

-- 
Denys


On Mon, May 06, 2013 at 04:28:27PM -0500, Franklin S. Cooper Jr wrote:
> * When building from OE CFLAGS will be passed in.
> * When building from within the sdk CFLAGS from Rules.make will be used.
> * This insures the optimal CFLAGS are used which corrects optimization and
> * also the correct toolchain settings (ie softfp/hardfp) are used.
> ---
>  .../av-examples/av-examples_1.0.bb                 |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> index 3782cba..dec17a8 100644
> --- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> @@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "(omap3)"
>  
>  BRANCH ?= "master"
> -SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
> +SRCREV = "87469a47bf91d681f15f0a2eb368fe695b21508c"
>  
>  SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
>  
> @@ -24,6 +24,7 @@ INSANE_SKIP_${PN} = "True"
>  do_compile() {
>  	touch debug
>  	export CROSS_COMPILE=${TARGET_PREFIX}
> +	export CFLAGS='${TARGET_CC_ARCH}'
>  	make release LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${MACHINE}"
>  }
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

