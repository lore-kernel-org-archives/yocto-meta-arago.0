Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 727FF52A5D
	for <meta-arago@arago-project.org>;
	Mon,  8 Apr 2013 17:56:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKY003L974TBGY3@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Apr 2013 12:55:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3250F200F4; Mon,
	08 Apr 2013 13:55:40 -0400 (EDT)
Date: Mon, 08 Apr 2013 13:55:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130408175540.GA15209@denix.org>
References: <1365170082-1087-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1365170082-1087-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-addons: Add parted utility
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
X-List-Received-Date: Mon, 08 Apr 2013 17:56:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 05, 2013 at 08:54:42AM -0500, Chase Maupin wrote:
> * Add the parted utility to make working with eMMC GPT partitions
>   possible from the Linux system.

Since parted is GPLv3, may I suggest GPT fdisk (gdisk) instead, which is 
GPLv2? It appears there's no recipe for it yet, but it should it relatively 
easy to make, as it's quite portable:

http://www.rodsbooks.com/gdisk/index.html

-- 
Denys


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons.bb             |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 0f76f4f..5dade67 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
>  
>  inherit packagegroup
>  
> @@ -16,6 +16,7 @@ UTILS = " \
>      arm-benchmarks \
>      dropbear \
>      openssh-sftp-server \
> +    parted \
>  "
>  
>  # Add PRU examples for am180x-evm devices
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

