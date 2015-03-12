Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1AEFB529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 01:27:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C1RZCC032505
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 20:27:35 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C1RYuE025790
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 20:27:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 20:27:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C1RXZw010507;
	Wed, 11 Mar 2015 20:27:33 -0500
Date: Wed, 11 Mar 2015 21:27:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150312012733.GF23587@edge>
References: <1426120479-27511-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426120479-27511-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-standalone-sdk-target: Include libgomp into toolchain SDK
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
X-List-Received-Date: Thu, 12 Mar 2015 01:27:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 11, 2015 at 07:34:39PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * When compiling an application with the -fopenmp flag an error is given since
>   libgomp isn't apart of the toolchain SDK.
> * Since this package comes from the toolchain only include it when using the
>   external linaro toolchain since it isn't included in the arago toolchain.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroup-arago-standalone-sdk-target.bb    |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
> index d4a5072..b08e125 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Target packages for the standalone SDK"
> -PR = "r6"
> +PR = "r7"
>  LICENSE = "MIT"
>  
>  inherit packagegroup
> @@ -33,4 +33,5 @@ RDEPENDS_${PN} = "\
>      opkg-dev \
>      sysvinit-dev \
>      util-linux-dev \
> +    ${@base_conditional('TCLIBC', 'external-linaro-toolchain', 'libgomp libgomp-dev', '', d)} \

libgomp-dev in the list is enough, as it will pull in libgomp on its own.
Also, better compare TCMODE to "external-linaro". TCLIBC could be used for 
something else, like uClibc with external Linaro toolchain...


>      "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

