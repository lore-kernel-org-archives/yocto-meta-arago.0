Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id B37FD52079
	for <meta-arago@arago-project.org>;
	Fri, 10 Jun 2016 15:42:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AFgXae012758
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 10:42:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AFgXlH023192
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 10:42:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Jun 2016 10:42:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AFgX7N015596;
	Fri, 10 Jun 2016 10:42:33 -0500
Date: Fri, 10 Jun 2016 11:42:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160610154232.GF2466@edge>
References: <1465407203-15939-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1465407203-15939-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-rootfs-image: add opencl-extra packagegroup
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
X-List-Received-Date: Fri, 10 Jun 2016 15:42:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Huh? Wasn't it meant to be added to "extra" rootfs image? Which it already is.


On Wed, Jun 08, 2016 at 01:33:23PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index 98988b2..8747e52 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -8,6 +8,7 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-tisdk-qte \
>      packagegroup-arago-tisdk-addons \
>      ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
>      packagegroup-arago-tisdk-connectivity \
>      packagegroup-arago-tisdk-crypto \
>      packagegroup-arago-tisdk-matrix \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

