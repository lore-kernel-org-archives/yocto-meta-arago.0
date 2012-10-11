Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 22AB952980
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 03:49:19 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBP00EE3MM52WR3@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Oct 2012 22:49:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F1790200DD; Wed,
	10 Oct 2012 23:49:16 -0400 (EDT)
Date: Wed, 10 Oct 2012 23:49:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121011034916.GB19991@denix.org>
References: <1349898999-485-1-git-send-email-fcooper@ti.com>
	<1349898999-485-2-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349898999-485-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 2/2] arago.conf: Set preferred u-boot version for am335x
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
X-List-Received-Date: Thu, 11 Oct 2012 03:49:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 10, 2012 at 02:56:39PM -0500, Franklin S. Cooper Jr wrote:
> * For now u-boot_am335x-evm version 2011.09-psp04.06.00.08 is not the default
>   version of u-boot for am335x. Therefore, a PREFERRED_VERSION needs to be set
>   to make sure the Arago SDK picks up the right u-boot
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 1ce64ce..2e5b796 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -29,6 +29,9 @@ ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
>  
>  PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
>  
> +# This should be temporary until meta-ti sets this u-boot version as the default

I have nothing against the patch on its own, but the comment above is 
incorrect and misleading - it doesn't make much sense to make 2011.09 a 
default version in meta-ti, as there are newer versions with as much BSP 
support as meta-ti requires...

On the other hand, setting it just for am335x-evm is probably acceptable, but 
either way, meta-ti may not be the right place to set any PREFERRED_VERSION 
variables...

Either way, what I'm saying is it's perfectly fine to set it here in 
meta-arago, but it might be wrong to expect "until meta-ti sets this u-boot 
version as the defaul".


> +PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
> +
>  # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
>  PREFERRED_VERSION_udev = "164"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

