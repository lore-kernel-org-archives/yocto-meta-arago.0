Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E361F52A24
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:09:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r24K9h0J003582;
	Mon, 4 Mar 2013 14:09:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r24K9hAs016207;
	Mon, 4 Mar 2013 14:09:43 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 14:09:42 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r24K9gr9012714;
	Mon, 4 Mar 2013 14:09:43 -0600
Date: Mon, 4 Mar 2013 15:09:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <fcooperjr27@gmail.com>
Message-ID: <20130304200942.GH27633@edge>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
	<1362427289-18057-7-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1362427289-18057-7-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 07/10] arago.conf: Don't pull in xloader recipe
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
X-List-Received-Date: Mon, 04 Mar 2013 20:09:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2013 at 02:01:26PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Xloader recipe is no longer needed. Avoid pulling this recipe in.

This is in my meta-ti cleanup I'm working on.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 17bb85b..575e89a 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -72,6 +72,9 @@ PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
>  PREFERRED_VERSION_linux_beagleboard = "3.3.7"
>  PREFERRED_VERSION_u-boot_beagleboard = "2012.04.01"
>  
> +# Don't pull in xloader since we don't use it
> +EXTRA_IMAGEDEPENDS_omap3 := "${@'${EXTRA_IMAGEDEPENDS}'.replace('x-load','')}"
> +
>  # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
>  PREFERRED_VERSION_udev = "164"
>  PREFERRED_PROVIDER_udev = "udev"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

