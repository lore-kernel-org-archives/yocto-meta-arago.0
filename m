Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11924.1638968892169551984
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C96E40C30;
	Wed,  8 Dec 2021 13:08:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFnLo_ghFEAx; Wed,  8 Dec 2021 13:08:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 59A9140027;
	Wed,  8 Dec 2021 13:08:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BBBF0174704; Wed,  8 Dec 2021 08:08:06 -0500 (EST)
Date: Wed, 8 Dec 2021 08:08:06 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] secdev: Add script to update k3 secdev package
Message-ID: <20211208130806.GV18191@denix.org>
References: <20211208085841.45926-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211208085841.45926-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tisdk-build-scripts is the wrong place to update secdev. Like toolchains, 
secdev package is considered an external system tool and is usually installed 
in a central location systemwide (e.g. /opt). It may not be writable by a 
regular user executing this build script.


On Wed, Dec 08, 2021 at 08:58:41AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  build-oesdk.sh             | 3 +++
>  lib/oesdk/update_secdev.sh | 7 +++++++
>  2 files changed, 10 insertions(+)
>  create mode 100755 lib/oesdk/update_secdev.sh
> 
> diff --git a/build-oesdk.sh b/build-oesdk.sh
> index 038a7ab..3d32fb2 100755
> --- a/build-oesdk.sh
> +++ b/build-oesdk.sh
> @@ -14,6 +14,9 @@ source ./lib/oesdk/machine-specific-functions
>  source ./lib/oesdk/package-sdks
>  source ./lib/oesdk/generate-report
>  
> +# Update secdev package
> +./lib/oesdk/update_secdev.sh
> +
>  # This variable holds the architectures that are being built based
>  # on the machines.
>  ARCHS=""
> diff --git a/lib/oesdk/update_secdev.sh b/lib/oesdk/update_secdev.sh
> new file mode 100755
> index 0000000..1f0a409
> --- /dev/null
> +++ b/lib/oesdk/update_secdev.sh
> @@ -0,0 +1,7 @@
> +#!/bin/bash
> +
> +cd $TI_SECURE_DEV_PKG_K3
> +git pull origin master
> +if [ $? != 0 ]; then
> +        echo "Updating the secdev failed"
> +fi
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
