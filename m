Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8494.1647021229616533290
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D15D40C46;
	Fri, 11 Mar 2022 17:53:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDznvv8lc7s3; Fri, 11 Mar 2022 17:53:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 558F640A03;
	Fri, 11 Mar 2022 17:53:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1345F16E6AD; Fri, 11 Mar 2022 12:53:39 -0500 (EST)
Date: Fri, 11 Mar 2022 12:53:38 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>, praneeth@ti.com,
	minas@ti.com, "Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCH 4/6] recipes-core: images: Add a basic bootstrap base image
Message-ID: <20220311175338.GD1766@denix.org>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-5-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220309021316.28370-5-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2022 at 08:13:14PM -0600, Nishanth Menon wrote:
> Since we do not wish to modify the tiny-image from anything but really
> tiny, lets use that infrastructure and add the bootstrap package group
> to create initramfs (not exactly a completely usable system) which can
> be used for basic board bringup.
> 
> This generates cpio around 36-40MB which should be usually fine for
> even smaller systems (Ofcourse, this is much larger than tiny-image
> which is around 6MB size). The packages are organized per size to
> allow easier customization if desired.
> 
> This image follows the Bring Your Own Kernel model from
> tisdk-tiny-image.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  .../images/tisdk-bootstrap-base-image.bb      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> new file mode 100644
> index 000000000000..a18f39602286
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> @@ -0,0 +1,20 @@
> +# Arago TI SDK bootstrap base image for initramfs
> +# This will not get a completely usable image since kernel will be missing

Same comment as for earlier patch.


> +# intent for this image is to build as basic a system with enough basic
> +# Board bringup utilities that can then be used for additions as needed.
> +
> +require arago-tiny-image.inc
> +
> +IMAGE_FSTYPES += "cpio cpio.xz"
> +
> +ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
> +
> +IMAGE_INSTALL += " \
> +	packagegroup-arago-bootstrap \
> +	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
> +"
> +
> +# We do not need kernel Image, dtbs and modules in the initrd
> +deltask do_packagedata

Huh? Not sure what you are trying to do here, but it certainly isn't right...
You are trying to partially disable generating of IPK packages for the image, 
but images by default have no packages to produce.


> +export IMAGE_BASENAME = "tisdk-bootstrap-base-image"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
