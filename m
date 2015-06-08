Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 22714529AC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 22:19:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58MJs0x021556
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:19:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MJsSn015917
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 17:19:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 17:19:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58MJrrq027199;
	Mon, 8 Jun 2015 17:19:53 -0500
Date: Mon, 8 Jun 2015 18:19:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150608221937.GC4019@edge>
References: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
	<1424897759-23944-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424897759-23944-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] meta-toolchain_arago-mcsdk: Add toolchain build for MCSDK
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
X-List-Received-Date: Mon, 08 Jun 2015 22:19:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, this is the old one.

Can you please change 2 things:

1. Move this recipe to meta-arago-distro, where meta-toolchain-arago-tisdk 
lives

2. Use TOOLCHAIN_SUFFIX to set -mcsdk- suffix.

-- 
Denys


On Wed, Feb 25, 2015 at 03:55:59PM -0500, Sam Nelson wrote:
> -Uses package group mcsdk-toolchain-target
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../meta/meta-toolchain-arago-mcsdk.bb             |    7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb
> new file mode 100644
> index 0000000..70543f4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-mcsdk.bb
> @@ -0,0 +1,7 @@
> +# MCSDK Embedded toolchain
> +TOOLCHAIN_TARGET_TASK = "packagegroup-arago-mcsdk-toolchain-target"
> +TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-mcsdk-sdk-${SDK_ARCH}"
> +
> +require recipes-core/meta/meta-toolchain-arago.bb
> +
> +PR = "r0"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

