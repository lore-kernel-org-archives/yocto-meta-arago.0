Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 025D352960
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 03:10:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M9J00CYTST706F1@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 29 Aug 2012 22:10:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 747B120087; Wed,
	29 Aug 2012 23:10:18 -0400 (EDT)
Date: Wed, 29 Aug 2012 23:10:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120830031018.GB11821@denix.org>
References: <1346273289-31211-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1346273289-31211-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extras][PATCH] av-examples: Adjust compatible machine
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
X-List-Received-Date: Thu, 30 Aug 2012 03:10:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

I have applied the first half set of patches that are not task-{host,target} 
related. It seems I cannot push to the repository at the moment though - will 
get it fixed tomoroow then...

Denys


On Wed, Aug 29, 2012 at 03:48:09PM -0500, Franklin S Cooper Jr wrote:
> * av-examples contains programs that will run on the omap3 SOC. Adjusting
>   the COMPATIBLE_MACHINE to reflect this limitation instead of limiting it
>   to particular evms.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../av-examples/av-examples_1.0.bb                 |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> index 1025f96..c16e78c 100644
> --- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
>  SECTION = "system"
>  PRIORITY = "optional"
>  
> -PR = "r0"
> +PR = "r1"
>  
> -DEPENDS += "virtual/kernel"
> +DEPENDS = "virtual/kernel"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
> +COMPATIBLE_MACHINE = "(omap3)"
>  
>  BRANCH ?= "master"
>  SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

