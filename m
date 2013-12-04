Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CF0425299E
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 06:26:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB46QLv6032249
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:26:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46QLiJ025010
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:26:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 00:26:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB46QKda012628;
	Wed, 4 Dec 2013 00:26:20 -0600
Date: Wed, 4 Dec 2013 01:26:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204062619.GT690@edge>
References: <1385638643-11878-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385638643-11878-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 07/14] ti-wifi-utils-wl18xx: Update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Wed, 04 Dec 2013 06:26:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 28, 2013 at 01:37:23PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Updated firmware name.
> - Added required makefile parameter to support libnl3 compilation.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  ...8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a8.08.bb} |   13 ++++++++-----
>  .../ti-wifi-utils/ti-wifi-utils.inc                |    6 +++---
>  2 files changed, 11 insertions(+), 8 deletions(-)
>  copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a8.08.bb} (68%)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
> similarity index 68%
> copy from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
> copy to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
> index eab94fa..601b203 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
> @@ -3,12 +3,12 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
>  
>  DEPENDS = "libnl"
> -RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
> +RDEPENDS_${PN} = "wl18xx-firmware"

I guess this was a bug in the previous r8.a6.01 version. Ok...


> -PR ="r3+gitr${SRCPV}"
> +PR ="r0+gitr${SRCPV}"
>  
> -# Tag: ol_r8.a6.01
> -SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> +#Tag: ol_r8.a8.08
> +SRCREV = "9627cb09b9de32b8ffcc32d3ce3e275b7c56d8e4"
>  SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
>  "
>  
> @@ -20,7 +20,10 @@ RCONFLICTS_${PN} +=  "ti-wifi-utils"
>  S = "${WORKDIR}/git"
>  
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
> -CFLAGS += " -DCONFIG_LIBNL20"
> +
> +EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
> +		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
> +		NLVER=3'
>  
>  do_install() {
>      install -d ${D}${bindir}
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
> index cdb3746..1f3ddba 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
> @@ -2,16 +2,16 @@ DESCRIPTION = "The calibrator and other useful utilities for TI wireless solutio
>  LICENSE = "BSD"
>  
>  DEPENDS = "libnl"
> -RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
> +RDEPENDS_${PN} = "wl18xx-firmware"

Now, here you are updating a common .inc file that is still being used by 
WiLink6 versions r5.00.18 and r5.sp3.05. You shouldn't actually do it, as this 
.inc file is not even being used by WiLink8 recipe...


> -PR ="r1"
> +PR ="r2"
>  
>  SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
> -CFLAGS += " -DCONFIG_LIBNL20"
> +CFLAGS+="-DCONFIG_LIBNL32"

First of all, there should be spaces around += operator.
Second, you are changing this file for WiLink6 recipes. Can they be built 
against libnl3?


>  do_install() {
>  	install -d ${D}${bindir}
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

