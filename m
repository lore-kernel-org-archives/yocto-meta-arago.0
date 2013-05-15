Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id D820D52A5D
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:53:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMT00MT4MTGFNF0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 May 2013 22:53:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B3B8520087; Tue,
	14 May 2013 23:53:40 -0400 (EDT)
Date: Tue, 14 May 2013 23:53:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-id: <20130515035340.GA5021@denix.org>
References: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3] arago-console: Adding pciutils package
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
X-List-Received-Date: Wed, 15 May 2013 03:53:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

So, it only looked perfect, but there were still some issues and I had to 
massage the patch in, only because I already promised I'll take it...

1. You should submit patches against the mainline meta-arago, not against your 
forked and work-in-progress personal tree. I.e. your PR was at r5 already, 
while the one in meta-arago is at r4, and you appear to have removed ltrace 
from the list of ARAGO_UTILS.

2. The recipe in your tree has 755 permissions, which is wrong and happens 
when you edit files mounted from Windows. I see it quite a lot in your team 
and you should probably stop doing it...

-- 
Denys


On Tue, May 14, 2013 at 10:52:06PM +0000, Nelson, Sam wrote:
>    pciutils provides very basic utilities for
>    querying the devices on the pci bus, when pci
>    interface is supported in the platform and
>    useful to be part of the console package
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-console.bb    |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> index 5a80064..537f050 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> @@ -1,6 +1,8 @@
>  DESCRIPTION = "Extended task to get more basic and console apps"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> @@ -25,6 +27,7 @@ ARAGO_UTILS = "\
>      i2c-tools \
>      iproute2 \
>      strace \
> +    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
>      "
>  
>  ARAGO_SDK_PREREQ = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

