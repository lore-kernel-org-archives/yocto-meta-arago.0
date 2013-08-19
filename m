Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id E375E52A24
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 21:37:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS00B5GS2WOSV0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 16:37:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C0FD3200D3; Mon,
	19 Aug 2013 17:37:44 -0400 (EDT)
Date: Mon, 19 Aug 2013 17:37:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130819213744.GG32524@denix.org>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<1375317112-1690-3-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1375317112-1690-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master & danny][PATCH 3/7] branding-amsdk: Set linux-libc-headers to 3.2
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
X-List-Received-Date: Mon, 19 Aug 2013 21:37:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 31, 2013 at 07:31:48PM -0500, Franklin S. Cooper Jr wrote:
> * Insure the proper linux-libc-header is used for 3.2 linux kernel

BTW, while it will work in danny, dylan no longer provides 3.2 version of 
linux-libc-headers. Patches 3 and 4 assume there is still one available. May 
need to bring it back to meta-arago...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/include/branding-amsdk.inc         |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> index 8fdf93d..d8ae307 100644
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> @@ -3,6 +3,8 @@
>  # Use the SDK supported kernel and kernel version
>  PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x-psp"
>  PREFERRED_VERSION_linux-am335x-psp = "3.2"
> +PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.2"
> +
>  PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
>  PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
>  PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

