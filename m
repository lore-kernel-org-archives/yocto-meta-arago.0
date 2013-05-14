Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A048952976
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 16:54:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4EGsTJM022530
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 11:54:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4EGsTvm004305
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 11:54:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 11:54:29 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4EGsTbP011755;
	Tue, 14 May 2013 11:54:29 -0500
Date: Tue, 14 May 2013 12:54:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20130514165428.GD18680@edge>
References: <1368536896-27356-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1368536896-27356-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Recipe: Adding pciutils package
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
X-List-Received-Date: Tue, 14 May 2013 16:54:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 14, 2013 at 09:08:16AM -0400, Sam Nelson wrote:
>    pciutils provides very basic utilities for
>    querying the devices on the pci bus, when pci
>    interface is supported in the platform and
>    useful to be part of the console package

Sam,

This looks very good!

Few more nit-picks:

0. Again, the subject line should follow the OE Community guidelines:
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines
We've discussed it already here:
http://arago-project.org/pipermail/meta-arago/2013-May/001373.html

1. If you are re-sending a new revision of the patch, please update the 
subject to contain [PATCHv2] or [PATCHv3] etc. Also you can log the changes 
between patch revisions after --- mark.

2. This recipe now becomes machine-specifci, so please add at the top:
PACKAGE_ARCH = "${MACHINE_ARCH}"

3. And please don't forget to add "pci" to the list of MACHINE_FEATURES for 
your machine (keystone-evm.conf) or better yet your SOC (keystone.inc)

-- 
Denys


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-console.bb    |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> index 5a80064..ceee77e 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Extended task to get more basic and console apps"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
>  
>  inherit packagegroup
>  
> @@ -25,6 +25,7 @@ ARAGO_UTILS = "\
>      i2c-tools \
>      iproute2 \
>      strace \
> +    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
>      "
>  
>  ARAGO_SDK_PREREQ = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

