Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id A43BC52A50
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:39:19 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI800JFYSTI96R2@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Feb 2013 21:39:19 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A9DE2201AD; Thu,
	14 Feb 2013 22:39:18 -0500 (EST)
Date: Thu, 14 Feb 2013 22:39:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130215033918.GE9154@denix.org>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1360629979-24789-7-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Fri, 15 Feb 2013 03:39:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 11, 2013 at 06:46:08PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Add SUPPORTS_SGX variable to arago.conf.

I was thinking about this lately and I think we shold add a new "sgx" flag in 
MACHINE_FEATURES to some of our machine configs (those that support it) and 
then base the logic around it - it's easily checked with base_contains().

-- 
Denys


> * Create a variable that specifies if a board or device has SGX support.
> * This will determine which tasks are pulled in to various filesystem and SDK
>   images.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 8330115..691c5b8 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -45,9 +45,12 @@ PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
>  PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
>  PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
>  
> -ARAGO_QT_PROVIDER = "qt4-embedded"
> -# Enable Qt+GLES for ARM v7a devices
> -ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
> +SUPPORTS_SGX = "YES"
> +
> +# No omapl138 variant includes SGX
> +SUPPORTS_SGX_omapl138 = "NO"
> +
> +ARAGO_QT_PROVIDER = "${@base_conditional('SUPPORTS_SGX', 'YES', 'qt4-embedded-gles', 'qt4-embedded', d)}"
>  
>  PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

