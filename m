Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4B42F52A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 15:19:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16FJTG5029112
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:19:29 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FJTsP010059
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 09:19:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 09:19:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16FJSZJ027961;
	Thu, 6 Feb 2014 09:19:29 -0600
Date: Thu, 6 Feb 2014 10:19:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140206151928.GF18784@edge>
References: <1391697602-1599-1-git-send-email-Chase.Maupin@ti.com>
	<1391697602-1599-3-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391697602-1599-3-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/4] mmc-utils: add mmc-utils for working with eMMC devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 15:19:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 06, 2014 at 08:40:01AM -0600, Chase Maupin wrote:
> * These utils make working with eMMC devices as raw devices easier
>   for setting up the boot locations, etc
> * This is overlayed into meta-arago until picked up in oe-core

Still no PV? It will default to 0.0, but maybe we want to set it explicitly?


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-devtools/mmc/mmc-utils_git.bb          |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb b/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
> new file mode 100644
> index 0000000..fe9a3fa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Userspace tools for MMC/SD devices"
> +HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
> +
> +BRANCH ?= "master"
> +SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH}"
> +
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 mmc ${D}${bindir}
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

