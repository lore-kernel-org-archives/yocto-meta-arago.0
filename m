Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 575D6529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:00:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J00LTCS0FS7N0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 18:00:16 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9700C20210; Wed,
	05 Feb 2014 19:00:15 -0500 (EST)
Date: Wed, 05 Feb 2014 19:00:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20140206000015.GC22890@denix.org>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-4-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1391630646-9727-4-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/6] arago-base-tisdk-image: add keystone support
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 00:00:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 05, 2014 at 02:04:04PM -0600, Chase Maupin wrote:
> * Add support to this image for keystone devices

And the server image doesn't use arago-base-tisdk-image directly.

So, I'll push the first 3 patches from the series.


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> index 2c0e217..ef47dc0 100644
> --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> @@ -4,7 +4,7 @@
>  require arago-image.inc
>  inherit remove-net-rules
>  
> -COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15"
> +COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15|keystone"
>  
>  IMAGE_INSTALL += "\
>      packagegroup-arago-base \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

