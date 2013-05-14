Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BCF2152976
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 23:18:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ENIPku006191
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 18:18:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ENIPGq021360
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 18:18:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 18:18:24 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4ENIOZo008170;
	Tue, 14 May 2013 18:18:24 -0500
Date: Tue, 14 May 2013 19:18:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130514231823.GA19353@edge>
References: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3] arago-console: Adding pciutils package
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
X-List-Received-Date: Tue, 14 May 2013 23:18:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Perfect, thanks! I'm pushing it shortly.

-- 
Denys

On Tue, May 14, 2013 at 10:52:06PM +0000, Nelson, Sam wrote:
>    pciutils provides very basic utilities for
>    querying the devices on the pci bus, when pci
>    interface is supported in the platform and
>    useful to be part of the console package
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-console.bb    |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> index 5a80064..537f050 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> @@ -1,6 +1,8 @@
>  DESCRIPTION = "Extended task to get more basic and console apps"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> @@ -25,6 +27,7 @@ ARAGO_UTILS = "\
>      i2c-tools \
>      iproute2 \
>      strace \
> +    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
>      "
>  
>  ARAGO_SDK_PREREQ = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

