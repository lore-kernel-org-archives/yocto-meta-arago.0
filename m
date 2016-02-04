Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2DC0A529EA
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 18:19:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14IJKvK002910
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:19:20 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IJKuJ031985
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:19:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 12:19:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IJJ6k000524;
	Thu, 4 Feb 2016 12:19:19 -0600
Date: Thu, 4 Feb 2016 13:19:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160204181904.GL31480@edge>
References: <1454609827-24452-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454609827-24452-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 1/3] packagegroup-arago-tisdk-addons: Add debug tools such as gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 18:19:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 04, 2016 at 01:17:05PM -0500, Jacob Stiffler wrote:
> * Remove gdb from various other locations as they are no longer needed
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * Remove gdb from various other locations as they are no longer needed

Oops, sorry, forgot to mention - v1 already went in...


>  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     | 1 -
>  .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb       | 1 -
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> index 6ddebe1..d0c3f54 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> @@ -12,7 +12,6 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-base-tisdk-server-extra \
>      packagegroup-arago-test \
>      packagegroup-arago-test-addons \
> -    gdb \
>  "
>  
>  BAD_RECOMMENDATIONS += " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> index 9131a37..40a034a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -12,7 +12,6 @@ TEST_ADDONS = " \
>      linuxptp \
>      openntpd \
>      strongswan \
> -    gdb \
>      "
>  
>  TEST_ADDONS_TI = " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index b34c6f4..f4bc863 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r36"
> +PR = "r37"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -90,6 +90,7 @@ EXTRA_LIBS_append_omap-a15 = " cmem"
>  
>  DEVTOOLS = " \
>      packagegroup-core-buildessential \
> +    packagegroup-core-tools-debug \
>      git \
>  "
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

