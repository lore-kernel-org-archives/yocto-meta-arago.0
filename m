Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D67C0529E0
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:17:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IHJxP026526
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:17:19 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IHJho014810
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:17:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:17:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IHJbD018197;
	Tue, 6 Jan 2015 12:17:19 -0600
Date: Tue, 6 Jan 2015 13:17:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181718.GW4759@edge>
References: <1420555140-19850-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420555140-19850-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] udev-cache: Disable by default.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:17:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I'm not sure it's a good idea to disable caching by default for all the 
platforms... I thought you'd be doing it locally for your builds.


On Tue, Jan 06, 2015 at 09:39:00AM -0500, Jacob Stiffler wrote:
> * This is to fix issue with rpmsg-rpc devices sharing major numbers and
>   obtaining random minor numbers which may not be consistent between booting.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-core/udev/udev/udev-cache.default      |    5 +++++
>  .../recipes-core/udev/udev_182.bbappend            |    2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-core/udev/udev/udev-cache.default
> 
> diff --git a/meta-arago-distro/recipes-core/udev/udev/udev-cache.default b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
> new file mode 100644
> index 0000000..b1aa63f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
> @@ -0,0 +1,5 @@
> +# Default for /etc/init.d/udev
> +
> +# Comment this out to disable device cache
> +#DEVCACHE="/etc/dev.tar"
> +PROBE_PLATFORM_BUS="yes"
> diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> index 838cce8..8da3c3a 100644
> --- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> +++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> @@ -5,4 +5,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago2"
> +PR_append = "-arago3"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

