Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BEC7552A08
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 17:28:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14HSATR011973
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:28:10 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14HSAR4007908
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:28:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 11:28:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14HS99Q025044;
	Thu, 4 Feb 2016 11:28:09 -0600
Date: Thu, 4 Feb 2016 12:27:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160204172753.GI31480@edge>
References: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] packagegroup-arago-tisdk-addons: Add debug tools such as gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 17:28:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I think there are already couple places where gdb is added directly. Can we 
clean those up as well?

-- 
Denys


On Thu, Feb 04, 2016 at 09:04:26AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index b34c6f4..f4bc863 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r36"
> +PR = "r37"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -90,6 +90,7 @@ EXTRA_LIBS_append_omap-a15 = " cmem"
>  
>  DEVTOOLS = " \
>      packagegroup-core-buildessential \
> +    packagegroup-core-tools-debug \
>      git \
>  "
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

