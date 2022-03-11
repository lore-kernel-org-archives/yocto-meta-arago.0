Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8308.1647020341533254830
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93C8F40C46;
	Fri, 11 Mar 2022 17:39:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuR3Ibw0v5et; Fri, 11 Mar 2022 17:39:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4895240A03;
	Fri, 11 Mar 2022 17:38:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0AF1916E6AD; Fri, 11 Mar 2022 12:38:51 -0500 (EST)
Date: Fri, 11 Mar 2022 12:38:50 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>, praneeth@ti.com,
	minas@ti.com, "Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCH 2/6] tisdk-tiny-image: Add some usability notes
Message-ID: <20220311173850.GB1766@denix.org>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-3-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220309021316.28370-3-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2022 at 08:13:12PM -0600, Nishanth Menon wrote:
> Lets clarify the usage of tiny image as something meant as a building
> block and not something that folks can directly use.

It still can be directly used though - see below.


> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> index af04b76bc588..e9abe31894ff 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> @@ -1,3 +1,8 @@
> +# Arago TI SDK super minimal base image for initramfs
> +# This will not get a completely usable image since kernel will be missing

I'd like to rephrase this a bit. The kernel is not in /boot of the rootfs, but 
it will be deployed and there are still many other ways to load it separately 
(tftp, separate boot partition, etc) and boot this image.


> +# intent for this image is to build as basic a system to allow further
> +# manual addition as needed.
> +
>  ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
>  
>  require arago-tiny-image.inc
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
