Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3A33B5298C
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 17:01:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TH1S9u024069
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:01:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TH1SRT025696
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:01:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 29 Mar 2013 12:01:28 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2TH1SIB021559;
	Fri, 29 Mar 2013 12:01:28 -0500
Date: Fri, 29 Mar 2013 13:01:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130329170127.GM23022@edge>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] omapconf: add omapconf utility to assist testing and debug
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
X-List-Received-Date: Fri, 29 Mar 2013 17:01:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 29, 2013 at 08:50:30AM -0500, Chase Maupin wrote:
> * The omapconf utility gives useful information about the
>   state of the OMAP device and can be used in debug and testing.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-devtools/omapconf/omapconf_git.bb      |   25 ++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> new file mode 100644
> index 0000000..9fcd88d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Diagnostic tool for TI OMAP processors"
> +HOMEPAGE = "https://github.com/omapconf/omapconf"
> +
> +LICENSE = "GPLv2 BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
> +
> +PV = "1.66"
> +PR = "r0"
> +
> +COMPATIBLE_MACHINE = "omap-a15"

Is it compatible with omap4? I guess not omap3 though :)


> +
> +BRANCH ?= "master"
> +SRCREV = "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> +
> +SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile () {
> +    oe_runmake CROSS_COMPILE=${TARGET_PREFIX} install
> +}
> +
> +do_install () {
> +    oe_runmake DESTDIR=${D}${bindir} install
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

