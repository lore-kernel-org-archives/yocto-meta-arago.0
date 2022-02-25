Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.270.1645826823584761518
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 14:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 633C640AE9;
	Fri, 25 Feb 2022 22:07:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1p00D__sm1d; Fri, 25 Feb 2022 22:07:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43BBC40A46;
	Fri, 25 Feb 2022 22:06:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 836F81747B1; Fri, 25 Feb 2022 17:06:58 -0500 (EST)
Date: Fri, 25 Feb 2022 17:06:58 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH] packagegroup-arago-base-tisdk: Fix issue with optee pkgs not being included
Message-ID: <20220225220658.GB26229@denix.org>
References: <20220225215859.23939-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220225215859.23939-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 09:58:59PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> In core-sdk 7.1 meta-ti OPTEEMACHINE description was updated to use combined
> OPTEE_MACHINE and OPTEE_FLAVOR.
> 
> 8ac0c757 conf/machine: pass OPTEEFLAVOR via OPTEEMACHINE as
> <mach>-<flavor>
> 
> This caused the OPTEEMACHINE check to fail that was used to add
> optee-client and optee-test. Fixing the issue by using
> OPTEEOUTPUTMACHINE since it still uses ti/k3 as parameter.

Good catch!


> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index e0d33bbb..551e0230 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
> -PR = "r22"
> +PR = "r23"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -26,5 +26,5 @@ RDEPENDS_${PN} = "\
>      nfs-utils-client \
>      cifs-utils \
>      phytool \
> -    ${@bb.utils.contains_any('OPTEEMACHINE', 'ti k3', "${OPTEE_PKGS}", "", d)} \
> +    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti k3', "${OPTEE_PKGS}", "", d)} \
>  "
> -- 
> 2.17.1
