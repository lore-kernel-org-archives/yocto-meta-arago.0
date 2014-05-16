Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D8AB552ABC
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 19:35:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJZND9005373
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:35:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJZN9I023671
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:35:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:35:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJZMrE002656;
	Fri, 16 May 2014 14:35:22 -0500
Date: Fri, 16 May 2014 15:35:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20140516193522.GL18053@edge>
References: <1400268469-25050-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400268469-25050-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] keystone: ti-sdk: add k2e-evm core ti-sdk image
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
X-List-Received-Date: Fri, 16 May 2014 19:35:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 03:27:49PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> ---
>  .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 9bbeaf1..dc8a1e5 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -29,6 +29,7 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
>  # Some devices do not support display and use a server image instead
>  TARGET_IMAGES_k2hk-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
>  TARGET_IMAGES_k2l-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
> +TARGET_IMAGES_k2e-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"

Just use SOC_FAMILY override - it's specifically created to reduce 
duplication!

TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"


>  TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

