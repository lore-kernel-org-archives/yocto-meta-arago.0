Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 5AE8B52995
	for <meta-arago@arago-project.org>;
	Fri, 17 May 2013 16:29:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMY009Y9B5EYKJ1@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 17 May 2013 11:29:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 72EF0200BC; Fri,
	17 May 2013 12:29:38 -0400 (EDT)
Date: Fri, 17 May 2013 12:29:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130517162938.GB25574@denix.org>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
	<1368590069-6700-4-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1368590069-6700-4-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/9] arago.conf: Drop SDKPATH a little bit lower
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
X-List-Received-Date: Fri, 17 May 2013 16:30:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 14, 2013 at 10:54:24PM -0500, Franklin S. Cooper Jr wrote:
> * Some recipes are still failing to build due to the length of the SDKPATH.
> * Reduce the path a little bit more to fix this problem.

What is the exact error? We should probably start fixing those, as we are 
getting very close to 128 that I started with and that wosn't long enough.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index d20823a..078a740 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -8,7 +8,7 @@ SDK_VERSION = "${DISTRO_VERSION}"
>  SDK_VENDOR = "-${SDK_NAME_PREFIX}"
>  SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_VERSION}"
>  SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
> -SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
> +SDKPATH = "${@"/tmp/"+"x"*80+"/"+"y"*80}"
>  
>  # Mask some broken recipes
>  BBMASK = "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-oe/recipes-extended/lighttpd|meta-linaro/recipes-core/netbase"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

