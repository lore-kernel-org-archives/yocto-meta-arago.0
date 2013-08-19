Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 983095299B
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 21:42:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS009UZS9JIZX0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 16:41:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A20C0200D3; Mon,
	19 Aug 2013 17:41:43 -0400 (EDT)
Date: Mon, 19 Aug 2013 17:41:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130819214143.GH32524@denix.org>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<1375317112-1690-6-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1375317112-1690-6-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master & danny][PATCH 6/7] toolchain-external-linaro: Use separate linux-libc-headers provider
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
X-List-Received-Date: Mon, 19 Aug 2013 21:42:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 31, 2013 at 07:31:51PM -0500, Franklin S. Cooper Jr wrote:
> * Do not use linux-libc-headers from the toolchain which is fixed to a specific
>   version of linux-libc-headers.

Unfortunately, this won't work, as external-linaro-toolchain recipe does not 
allow replacing it's headers with the ones provided by linux-libc-headers. I 
had that implemented in Arago toolchain and Code Sourcery previously. I can 
patch Linaro recipe to have this capability, but it's not there yet, just 
letting you know. It may result in a conflict of headers the way it is now - 
I'm testing it...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/include/toolchain-linaro.inc       |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> index 5713da2..9751725 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> @@ -36,3 +36,7 @@ PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
> +
> +PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
> +PREFERRED_PROVIDER_linux-libc-headers-dev = "linux-libc-headers"
> +PREFERRED_PROVIDER_virtual/linux-libc-headers = "linux-libc-headers"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

