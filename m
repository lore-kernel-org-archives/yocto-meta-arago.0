Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 58B0052A3C
	for <meta-arago@arago-project.org>;
	Wed,  2 Nov 2016 22:34:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA2MYW7K019631
	for <meta-arago@arago-project.org>; Wed, 2 Nov 2016 17:34:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA2MYWVF031486
	for <meta-arago@arago-project.org>; Wed, 2 Nov 2016 17:34:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 2 Nov 2016 17:34:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA2MYWlu016138;
	Wed, 2 Nov 2016 17:34:32 -0500
Date: Wed, 2 Nov 2016 18:34:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20161102223431.GG12745@edge>
References: <1478095832-20251-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1478095832-20251-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-*-graphics: selectively enable gc320
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
X-List-Received-Date: Wed, 02 Nov 2016 22:34:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Wed, Nov 02, 2016 at 07:40:32PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-graphics.bb           | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index ef2b71d..250a2f7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install graphics binaries"
>  LICENSE = "MIT"
> -PR = "r13"
> +PR = "r16"
>  
>  inherit packagegroup
>  
> @@ -16,6 +16,13 @@ GRAPHICS_RDEPENDS = "\
>      ti-sgx-ddk-um \
>  "
>  
> +
> +GRAPHICS_RDEPENDS_append_omap-a15 = "\
> +    ti-gc320-tests \
> +    ti-gc320-driver \
> +    ti-gc320-libs  \
> +"
> +
>  RDEPENDS_${PN} = "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
>      ${GRAPHICS_RDEPENDS} \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

