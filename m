Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 99BCD52A95
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 18:26:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14IQdHb008979
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:26:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IQdZG004630
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 12:26:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 12:26:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14IQcYM006243;
	Thu, 4 Feb 2016 12:26:38 -0600
Date: Thu, 4 Feb 2016 13:26:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160204182623.GN31480@edge>
References: <1454610334-25304-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454610334-25304-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-server-rootfs-image, packagegroup-arago-test-addons: Remove gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 18:26:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Thu, Feb 04, 2016 at 01:25:34PM -0500, Jacob Stiffler wrote:
> * Including gdb in these places is redundant since
>   packagegroup-core-tools-debug has been added to
>   packagegroup-arago-tisdk-addons.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     | 1 -
>  .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb       | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
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
> index 9131a37..35d9c96 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Task to install additional utilities/demos for test image"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r5"
> +PR = "r6"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -12,7 +12,6 @@ TEST_ADDONS = " \
>      linuxptp \
>      openntpd \
>      strongswan \
> -    gdb \
>      "
>  
>  TEST_ADDONS_TI = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

