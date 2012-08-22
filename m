Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id C4F9152A7A
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 22:05:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M9600M5IG0R0JO2@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 22 Aug 2012 17:05:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C65F42007F; Wed,
	22 Aug 2012 18:05:15 -0400 (EDT)
Date: Wed, 22 Aug 2012 18:05:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Message-id: <20120822220515.GB8846@denix.org>
References: <1345644077-4568-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1345644077-4568-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extras][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 22:05:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 22, 2012 at 09:01:17AM -0500, Franklin S Cooper Jr wrote:
> * Add av-examples from Arago
> * Convert svn repository to git. Update makefiles to create
>   needed directories since git doesn't allow empty directories
>   to be stored.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../av-examples/av-examples_1.0.bb                 |   33 ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> new file mode 100644
> index 0000000..1025f96
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Linux Audio Video Example Applications"
> +HOMEPAGE = "https://gforge.ti.com/gf/project/av_examples/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM := "file://COPYING;md5=80ea1ff5788f65d5c5b3206d50d4bc6c"
> +SECTION = "system"
> +PRIORITY = "optional"
> +
> +PR = "r0"
> +
> +DEPENDS += "virtual/kernel"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"

We need to relax our filters for compatible machines. Those are Audio/Video 
examples - are they really machine specific?

-- 
Denys


> +BRANCH ?= "master"
> +SRCREV = "ac75d09d29a805d89c49dd2741b79f3069e97827"
> +
> +SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKIP which would otherwise lead to discrepancies between host and arago binaries
> +INSANE_SKIP_${PN} = "True"
> +
> +do_compile() {
> +	touch debug
> +	export CROSS_COMPILE=${TARGET_PREFIX}
> +	make release LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${MACHINE}"
> +}
> +
> +do_install() {
> +	make DESTDIR=${D} install
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

