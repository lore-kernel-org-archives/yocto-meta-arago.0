Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id F232E529D8
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC8B340AFF
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:32:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZCxQTAX0gcjI for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:32:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D98D140A89
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:32:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 218B71744E5; Fri,  6 Nov 2020 14:32:56 -0500 (EST)
Date: Fri, 6 Nov 2020 14:32:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-ID: <20201106193256.GJ19155@denix.org>
References: <20201106175807.E7BF2529D8@arago-project.org>
MIME-Version: 1.0
In-Reply-To: <20201106175807.E7BF2529D8@arago-project.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [arago-commits] Dan Murphy : ti-sci-fw: Update to 2020.08b system firmware
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
X-List-Received-Date: Fri, 06 Nov 2020 19:36:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 05:58:07PM +0000, Arago Project git wrote:
> Module: meta-ti
> Branch: dunfell-next
> Commit: f8979375632b7fc75233aaca5e420bbb37b2fef9
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f8979375632b7fc75233aaca5e420bbb37b2fef9
> 
> Author: Dan Murphy <dmurphy@ti.com>
> Date:   Fri Nov  6 09:12:33 2020 -0600
> 
> ti-sci-fw: Update to 2020.08b system firmware
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> 
> ---
> 
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc    |    6 +++---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 00e6118..24de33d 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -PV = "2020.08-rc3"
> +PV = "2020.08b"
>  
> -SRCREV = "8a22979dc944f6f4f867e2ac637c51a317efaacd"
> +SRCREV = "f5685b5980d93709e20466ffa19145ffd83b4ca4"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "36fe2d183a734f65b9adbd3097e5d51a6f931521"
> +SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 1239b27..f9a7cf4 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -19,6 +19,8 @@ SYSFW_SOC ?= "unknown"
>  SYSFW_CONFIG ?= "unknown"
>  
>  SYSFW_PREFIX = "ti-sci-firmware"
> +SYSFW_PREFIX_j7 = "ti-fs-firmware"
> +SYSFW_PREFIX_j7200-evm = "ti-fs-firmware"

This is not needed - j7200-evm is part of j7 SOC_FAMILY, so the first line 
would be enough...


>  SYSFW_SUFFIX ?= "unknown"
>  
>  SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
> 
> _______________________________________________
> arago-commits mailing list
> arago-commits@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> 

