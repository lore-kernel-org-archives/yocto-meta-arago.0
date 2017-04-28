Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3955952A78
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 14:32:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SEWWrk008660
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 09:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493389952;
	bh=d/oRxxDwAJowYAec8IL945Rh8mZTlbRb6H+H3AI3i7c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NI2aN+HqpK6pVrAZERSBJs/c5xw1bdHloamqTLPV4KgHQ2DP5QhD74xhmQfnPlIZT
	es2SrUCjKWG0xZXtbDJ8khXhs8KkxcgNvG7MQgLi2tUizEGZWm3vgdwhrZqqmUOiC1
	QB6Uz6dP6BYPDMxqa5PZCwELUs5oEoM3tVLxvaEk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SEWRoS015386
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 09:32:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 09:32:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SEWQ0d032088;
	Fri, 28 Apr 2017 09:32:26 -0500
Date: Fri, 28 Apr 2017 10:32:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170428143225.GJ31608@edge>
References: <1493260049-39927-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493260049-39927-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH] arago-tisdk-addons: Add ipc related packages
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
X-List-Received-Date: Fri, 28 Apr 2017 14:32:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

This addition pushes the size of k2hk rootfs over the limit - need to find 
something to move to the extras image...


On Wed, Apr 26, 2017 at 10:27:29PM -0400, Sam Nelson wrote:
> Add ipc packages for omapl138
> Add ti-ipc-examples-linux to Keystone and omap-a15
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 5ad6655..c8b0f4a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -55,6 +55,11 @@ UTILS_append_omap-a15 = " mmc-utils \
>                            ti-ipc-rtos-fw \
>                            uio-test-pruss \
>                            uio-module-drv-test \
> +                          ti-ipc-examples-linux \
> +"
> +
> +UTILS_append_omapl138 = " ti-ipc-rtos-fw \
> +                          ti-ipc-examples-linux \
>  "
>  
>  UTILS_append_dra7xx = " canutils \
> @@ -66,6 +71,7 @@ UTILS_append_dra7xx = " canutils \
>  UTILS_append_keystone = " \
>      uio-module-drv-test \
>      ti-ipc-rtos-fw \
> +    ti-ipc-examples-linux \
>  "
>  
>  UTILS_append_k2hk = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

