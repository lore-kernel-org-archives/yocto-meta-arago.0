Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8ECC052AB0
	for <meta-arago@arago-project.org>;
	Wed, 10 Feb 2016 22:04:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1AM4bZj018730
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 16:04:38 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AM4b35012068
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 16:04:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Feb 2016 16:04:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AM4aWw008804;
	Wed, 10 Feb 2016 16:04:37 -0600
Date: Wed, 10 Feb 2016 17:04:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160210220420.GO31480@edge>
References: <1455127224-19289-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1455127224-19289-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-addons: Add protobuf for am3/4/5
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
X-List-Received-Date: Wed, 10 Feb 2016 22:04:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 10, 2016 at 01:00:24PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index ff2ca83..1762a43 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r39"
> +PR = "r40"

Are you missing another patch? This recipe is at r39 now.


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -102,14 +102,17 @@ DEVTOOLS = " \
>  
>  DEVTOOLS_append_ti33x = " \
>      nodejs \
> +    protobuf \
>  "
>  
>  DEVTOOLS_append_ti43x = " \
>      nodejs \
> +    protobuf \
>  "
>  
>  DEVTOOLS_append_omap-a15 = " \
>      nodejs \
> +    protobuf \
>  "
>  
>  RDEPENDS_${PN} = "\
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

