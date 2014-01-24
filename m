Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C590252A20
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 18:38:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OIc0np007771
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 12:38:00 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OIbx27015909
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 12:38:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 12:37:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OIbxsJ002993;
	Fri, 24 Jan 2014 12:37:59 -0600
Date: Fri, 24 Jan 2014 13:37:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140124183758.GM30525@edge>
References: <1390588035-27597-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390588035-27597-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ts-calibrate-init: Fix QA warning
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
X-List-Received-Date: Fri, 24 Jan 2014 18:38:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

http://arago-project.org/pipermail/meta-arago/2014-January/002846.html

On Fri, Jan 24, 2014 at 12:27:15PM -0600, Franklin S. Cooper Jr wrote:
> * RDEPENDS statements should be package specific.
> * Set the REDEPENDS to ${PN} to fix the QA warning message.
> ---
>  .../tslib/ts-calibrate-init_1.0.bb                 |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> index 7148034..98588d3 100644
> --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> @@ -1,12 +1,12 @@
>  # This recipe installs an init script that can be used to invoke ts_calibrate
>  # on systems that need this done during the boot sequence.
>  DESCRIPTION = "TS calibration init script"
> -RDEPENDS += "tslib"
> +RDEPENDS_${PN} += "tslib"
>  
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  S = "${WORKDIR}"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

