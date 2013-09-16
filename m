Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CA27252990
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 21:41:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GLfPh1030715
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 16:41:26 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GLfPCP028979
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 16:41:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 16:41:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GLfPB4031045;
	Mon, 16 Sep 2013 16:41:25 -0500
Date: Mon, 16 Sep 2013 17:41:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130916214124.GE19671@edge>
References: <1379365315-32089-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1379365315-32089-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Remove unnecessary bootloader binaries from fs
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
X-List-Received-Date: Mon, 16 Sep 2013 21:41:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 16, 2013 at 04:01:55PM -0500, Franklin S. Cooper Jr wrote:
> * With newer versions of u-boot requiring kernel binaries to be located in the
>   boot directory in the rootfs it can become confusing for users who think that
>   bootloader binaries also needs to be included in the rootfs boot directory
>   since some binaries were already found there.

I'm fine with this change. I've seen other groups removing u-boot binary from 
rootfs, so not having it installed in the base image is a good thing.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 505bb53..16b5df1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
> -PR = "r12"
> +PR = "r13"
>  
>  inherit packagegroup
>  
> @@ -15,7 +15,6 @@ RDEPENDS_${PN} = "\
>      iptables \
>      iperf \
>      psplash \
> -    ${PREFERRED_PROVIDER_virtual/bootloader} \
>      arago-gpl-notice \
>      nfs-utils-client \
>      "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

