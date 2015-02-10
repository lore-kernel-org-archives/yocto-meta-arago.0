Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0047852A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 21:55:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ALtRBB009116
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 15:55:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALtPwp015693
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 15:55:26 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 15:55:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALtP9n008546;
	Tue, 10 Feb 2015 15:55:25 -0600
Date: Tue, 10 Feb 2015 16:55:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150210215524.GQ13231@edge>
References: <1423605146-29186-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423605146-29186-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/9 v2] packagegroup-arago-tisdk-amsdk: Remove gadget-init
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
X-List-Received-Date: Tue, 10 Feb 2015 21:55:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 10, 2015 at 03:52:25PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Now that saving U-boot to FAT is supported by AM335x and AM437x mounting the
>   boot partition is no longer needed as part of setup-script magic.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> V2 Changes:
> Instead of adding the package to am437x simply remove it from am335x and am437x.

Nice turnaround! :)


>  .../packagegroup-arago-tisdk-amsdk.bb              |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> index c2eb72b..a239e64 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
>  LICENSE = "MIT"
> -PR = "r9"
> +PR = "r10"
>  
>  inherit packagegroup
>  
> @@ -10,7 +10,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  OOBE = ""
>  
>  OOBE_ti33x += "\
> -    gadget-init \
>      parse-ip \
>  "
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

