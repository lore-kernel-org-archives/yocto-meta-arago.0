Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8362.1647020600072466496
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 20B9240C46;
	Fri, 11 Mar 2022 17:43:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVDfCfIKQh-v; Fri, 11 Mar 2022 17:43:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC08A40A03;
	Fri, 11 Mar 2022 17:43:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9086F16E6AD; Fri, 11 Mar 2022 12:43:09 -0500 (EST)
Date: Fri, 11 Mar 2022 12:43:09 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>, praneeth@ti.com,
	minas@ti.com, "Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [dunfell/master PATCH 3/6] packagegroups: Add a new bootstrap package group
Message-ID: <20220311174309.GC1766@denix.org>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-4-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220309021316.28370-4-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2022 at 08:13:13PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> Lets try and create a minimal package group for board bringup. Lets
> call this basic system necessary for board bringup as "bootstrap".
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  .../packagegroup-arago-bootstrap.bb           | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> new file mode 100644
> index 000000000000..e5b670a16b73
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> @@ -0,0 +1,55 @@
> +DESCRIPTION = "Task to install additional utilities for initial board bringup"

Need to start setting SUMMARY by default, not DESCRIPTION. DESCRIPTION is an 
alternative longer explanation for the package, otherwise it's the same as 
SUMMARY. Yes, I know many recipes still use the old convention, but need to be 
fixed.


> +LICENSE = "MIT"
> +PR = "r0"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +PACKAGES =+ "${PN}-extra"

I don't see ${PN}-extra being used/populated anywhere here.


> +UTILS = " \
> +	 arm-benchmarks \
> +	 evtest \
> +	 memtester \
> +	 nbench-byte \
> +	 pcitest \
> +	 serialcheck \
> +	 yavta \
> +	 hdparm \
> +	 i2c-tools \
> +	 libdrm-tests \
> +	 rt-tests \
> +	 iozone3 \
> +	 mtd-utils-ubifs-tests \
> +	 net-tools \
> +	 ethtool  \
> +	 pciutils \
> +	 rng-tools \
> +	 stress-ng \
> +	 iperf \
> +	 lmbench \
> +	 usbutils \
> +	 devmem2 \
> +	 phytool \
> +"
> +
> +UTILS_append_ti33x = " \
> +    omapconf \
> +"
> +
> +UTILS_append_ti43x = " \
> +    omapconf \
> +"
> +
> +UTILS_append_omap-a15 = " \
> +    omapconf \
> +"
> +
> +UTILS_append_k3 = " \
> +    k3conf \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${UTILS} \
> +"
> -- 
> 2.31.1
> 
> 
> 
> 
> 
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
