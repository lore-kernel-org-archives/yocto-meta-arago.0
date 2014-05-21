Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 3B7D952A3E
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 16:40:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5X00K2BNLYXU60@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 21 May 2014 11:39:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A971720331; Wed,
	21 May 2014 12:39:34 -0400 (EDT)
Date: Wed, 21 May 2014 12:39:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: hzhang@ti.com
Message-id: <20140521163934.GB27324@denix.org>
References: <1400681214-9143-1-git-send-email-hzhang@ti.com>
MIME-version: 1.0
In-reply-to: <1400681214-9143-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [Re-submit: v3] keystone: tisdk-image: change TARGET_IMAGES from keystone-evm to k2hk-evm
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
X-List-Received-Date: Wed, 21 May 2014 16:40:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 21, 2014 at 10:06:54AM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Keystone II SoC family has multiple devices and EVM's: k2hk, k2l and k2e.
> All the EVM's share the same core tisdk image. The TARGET_IMAGES should
> be set to keystone SoC family rather than a keystone EVM machine config.

Hao,

Just a quick reminder - when you resubmit a new version of the same patch, it 
helps to include a brief description of what has changed. That normally goes 
after the --- line below...


> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---

A short description of the changes made to the patch itself...


>  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index f25db51..1dd9d6d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -27,7 +27,7 @@ DTB_FILTER_keystone = "k2hk"
>  TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
>  
>  # Some devices do not support display and use a server image instead
> -TARGET_IMAGES_keystone-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
> +TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
>  
>  TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

