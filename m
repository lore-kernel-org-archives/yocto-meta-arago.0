Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 7D62552A24
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 21:36:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS00G2FS0D0H70@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 16:36:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D00E4200D3; Mon,
	19 Aug 2013 17:36:13 -0400 (EDT)
Date: Mon, 19 Aug 2013 17:36:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130819213613.GF32524@denix.org>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1375317112-1690-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Mon, 19 Aug 2013 21:36:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 31, 2013 at 07:31:46PM -0500, Franklin S. Cooper Jr wrote:
> * This is the version that was originally being using in arago/oe-classic based
>   SDK.

Why do we need 2.6.33? All our old kernels are at least 2.6.37 now and there 
is corresponding linux-libc-headers available...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../linux-libc-headers_2.6.33.bb                   |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> 
> diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> new file mode 100644
> index 0000000..eb8cb19
> --- /dev/null
> +++ b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> @@ -0,0 +1,10 @@
> +require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +
> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-headers/${PN}"
> +
> +PR = "r0"
> +
> +SRC_URI += " file://connector-msg-size-fix.patch"
> +SRC_URI[md5sum] = "c3883760b18d50e8d78819c54d579b00"
> +SRC_URI[sha256sum] = "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6"
> +
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

