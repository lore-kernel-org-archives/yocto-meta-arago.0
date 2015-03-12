Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4CA8152A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:24:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CEOoJi000800
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:24:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEOnPG014077
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:24:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 09:24:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEOnWN011193;
	Thu, 12 Mar 2015 09:24:49 -0500
Date: Thu, 12 Mar 2015 10:24:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150312142448.GH24885@edge>
References: <1426168407-5506-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426168407-5506-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] packagegroup-arago-standalone-sdk-target: Include libgomp into toolchain SDK
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
X-List-Received-Date: Thu, 12 Mar 2015 14:24:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Mar 12, 2015 at 08:53:27AM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * When compiling an application with the -fopenmp flag an error is given since
>   libgomp isn't apart of the toolchain SDK.
> * Since this package comes from the toolchain only include it when using the
>   external linaro toolchain since it isn't included in the arago toolchain.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> v2 changes:
> Depend on TCMODE instead of TCLIBC
> Only pull in libgomp-dev since libgomp will end up being pulled in automatically
> 
>  .../packagegroup-arago-standalone-sdk-target.bb    |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
> index d4a5072..5696dec 100644
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
> +    ${@base_conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
>      "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

