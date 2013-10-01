Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D9081529EB
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 05:35:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r915ZCcm017826
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 00:35:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r915ZCXJ005338
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 00:35:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 00:35:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r915ZBeq021270;
	Tue, 1 Oct 2013 00:35:12 -0500
Date: Tue, 1 Oct 2013 01:35:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20131001053511.GB26572@edge>
References: <1380605260-2468-1-git-send-email-heroor@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380605260-2468-1-git-send-email-heroor@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] omapconf: update to v1.68
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
X-List-Received-Date: Tue, 01 Oct 2013 05:35:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Tue, Oct 01, 2013 at 10:57:40AM +0530, Siddharth Heroor wrote:
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../recipes-devtools/omapconf/omapconf_git.bb      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> index a505eca..2170d9e 100644
> --- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> +++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
> @@ -4,13 +4,13 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
>  LICENSE = "GPLv2 BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
>  
> -PV = "1.66"
> +PV = "1.68"
>  PR = "r0"
>  
>  COMPATIBLE_MACHINE = "omap-a15|omap4"
>  
>  BRANCH ?= "master"
> -SRCREV = "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> +SRCREV = "51fa0acb6ae24a9f14b11bc4b56c4f764b017f3f"
>  
>  SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

