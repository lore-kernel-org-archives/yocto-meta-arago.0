Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 87988529AA
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 22:43:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0KMh5wD012108
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 16:43:05 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KMh5jP005403
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 16:43:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 Jan 2014 16:43:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KMh5Ij026612;
	Mon, 20 Jan 2014 16:43:05 -0600
Date: Mon, 20 Jan 2014 17:43:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140120224304.GE24768@edge>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390259818-10267-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] ti-tisdk-setup: Update to support new u-boot, kernel and device
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
X-List-Received-Date: Mon, 20 Jan 2014 22:43:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 20, 2014 at 05:16:56PM -0600, Franklin S. Cooper Jr wrote:
> * Add support for ti43x.
> * Update script to work with 3.12 kernel and U-boot 2013.10.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 0084005..af10101 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>  
> -PR = "r17"
> +PR = "r18"
>  
>  BRANCH ?= "master"
> -SRCREV = "01f88ec0391f00860bac1648dc95fc0eec0b8b99"
> +SRCREV = "3e3e750153147f789dee5d59f45abcd14d001c64"
>  SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git/"
> @@ -17,6 +17,7 @@ UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
>  UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
>  UBOOT_ENV_am180x-evm = "setup-uboot-env-am18x.sh"
>  UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
> +UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
>  UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
>  UBOOT_ENV = "setup-uboot-unknown.sh"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

