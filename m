Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 91FA0529BF
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 06:08:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB468T7q018063
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:08:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB468Tdc023206
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 00:08:29 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 00:08:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB468Tac031952;
	Wed, 4 Dec 2013 00:08:29 -0600
Date: Wed, 4 Dec 2013 01:08:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204060828.GQ690@edge>
References: <1385638613-11791-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385638613-11791-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 05/14] wlconf : Update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Wed, 04 Dec 2013 06:08:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 28, 2013 at 01:36:53PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Added missing default configuration file.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../{wlconf_r8.a6.01.bb => wlconf_r8.a8.08.bb}     |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
>  copy meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a6.01.bb => wlconf_r8.a8.08.bb} (88%)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> similarity index 88%
> copy from meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> copy to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> index 8076350..4960022 100644
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
>  
> -PR ="r2"
> +PR ="r0"
>  PR_append = "+gitr${SRCPV}"
>  
> -# Tag: ol_r8.a6.01
> -SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> +# Tag: ol_r8.a8.08
> +SRCREV = "c976584589981c9ab8741d1819a5019e17cac13b"
>  SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
>  
>  S = "${WORKDIR}/git/wlconf"
> @@ -21,6 +21,7 @@ do_install() {
>  	install -m 0755 wlconf ${D}${bindir}/wlconf/
>  	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
>  	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> +        install -m 0755 default.conf ${D}${bindir}/wlconf/

Please keep the existing indentation of the modified file. The surrounding 
lines use tabs, while you add the above line with 8 spaces instead.


>  	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
>  	install -m 0755 README ${D}${bindir}/wlconf/
>  	install -m 0755 example.conf ${D}${bindir}/wlconf/
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

