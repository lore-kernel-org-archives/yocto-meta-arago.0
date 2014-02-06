Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5453A529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:04:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1604Jqq022680
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 18:04:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1604J1P028952
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 18:04:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 18:04:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1604J6g006721;
	Wed, 5 Feb 2014 18:04:19 -0600
Date: Wed, 5 Feb 2014 19:04:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140206000418.GD18784@edge>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-3-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391630646-9727-3-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/6] tisdk-amsdk-sdk-host: remove pinmux for keystone devices
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
X-List-Received-Date: Thu, 06 Feb 2014 00:04:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Which recipe do you currently use to build linux-devkit for MCSDK? I'm trying 
to see if this recipe is in your path or not. But either way we need to unify 
these thinks a bit better...

-- 
Denys


On Wed, Feb 05, 2014 at 02:04:03PM -0600, Chase Maupin wrote:
> * Keystone devices do not have a pinmux utility currently so
>   do not try to package one.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> index cb95ae9..e5d1be5 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional scripts and applications into the SDK"
>  LICENSE = "MIT"
> -PR = "r17"
> +PR = "r18"
>  
>  inherit packagegroup
>  
> @@ -14,6 +14,7 @@ KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
>  TOOLS = "pinmux-utility"
>  TOOLS_omap-a15 = ""
>  TOOLS_ti43x = ""
> +TOOLS_keystone = ""
>  TOOLS_append_am37x-evm = " flash-utility"
>  TOOLS_append_am3517-evm = " flash-utility"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

