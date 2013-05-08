Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 94F11529D4
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 01:09:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4819rDw009313
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 20:09:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4819rOZ019153
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 20:09:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 20:09:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4819qee001208;
	Tue, 7 May 2013 20:09:52 -0500
Date: Tue, 7 May 2013 21:09:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sajesh Kumar Saran <sajesh@ti.com>
Message-ID: <20130508010951.GN12982@edge>
References: <1367972890-14439-1-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367972890-14439-1-git-send-email-sajesh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] adding ipc 3.x recipe to bitbake
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
X-List-Received-Date: Wed, 08 May 2013 01:09:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please use the proper commit message. And what does "add to bitbake" mean?


On Tue, May 07, 2013 at 08:28:07PM -0400, Sajesh Kumar Saran wrote:
> ---
>  .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |   27 ++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
> new file mode 100644
> index 0000000..1e87abc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb

This is the successor to the older ti-ipc here:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/ipc/ti-ipc.inc

Is there anything you need from the old recipe? If ipcdev is the master 
repository for ti-ipc these days, we should probably deprecate the old stuff 
in meta-ti...


> @@ -0,0 +1,27 @@
> +DESCRIPTION="This support the communication between processors \
> +			in a multi-processor environment and communication to peripherals. \
> +            This communication includes message passing, streams, and linked lists. \
> +            These modules work transparently in both uni-processor and multi-processor \
> +            configurations."
> +
> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
> +SECTION = "console"
> +COMPATIBLE_MACHINE = "keystone"
> +
> +PR = "r11"
> +
> +BRANCH ?= "master"
> +SRCREV = "3.00.00.15_eng"
> +
> +SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +export PLATFORM = "tci6638"
> +
> +export PARALLEL_MAKE = "-j 1"
> +
> +inherit autotools
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

