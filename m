Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 810AB52A7A
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 03:23:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAX00L84TEDLH80@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 25 Sep 2012 22:23:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AE93E201C1; Tue,
	25 Sep 2012 23:23:00 -0400 (EDT)
Date: Tue, 25 Sep 2012 23:23:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120926032300.GC8181@denix.org>
References: <1348587502-25473-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348587502-25473-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] dt: Port dt recipe
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
X-List-Received-Date: Wed, 26 Sep 2012 03:23:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 25, 2012 at 10:38:22AM -0500, Franklin S. Cooper Jr wrote:
> * Port dt recipe from oe-core

Why is this ported from oe-core? Can you bbappend it instead?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-devtools/dt/dt/no_aio.patch            |   17 +++++++++++
>  meta-arago-extras/recipes-devtools/dt/dt_17.07.bb  |   30 ++++++++++++++++++++
>  2 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
> new file mode 100644
> index 0000000..8253e86
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
> @@ -0,0 +1,17 @@
> +---
> + Makefile.linux |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: dt.d-WIP/Makefile.linux
> +===================================================================
> +--- dt.d-WIP/Makefile.linux
> ++++ dt.d-WIP/Makefile.linux
> +@@ -68,7 +68,7 @@ LINTLIBS=
> +
> + PORG      = -O3
> +
> +-CFLAGS= $(PORG) -DAIO -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> ++CFLAGS= $(PORG) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> + CPP=	/lib/cpp
> + CPPOPTS= -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE
> + LDFLAGS=
> diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
> new file mode 100644
> index 0000000..22fd6ac
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
> @@ -0,0 +1,30 @@
> +HOMEPAGE = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/dt.html"
> +DESCRIPTION = "The Data Test Program (dt) is a generic data test program used to verify proper \
> +operation of peripherals, file systems, device drivers, or any data stream supported by the \
> +operating system."
> +
> +SECTION = "console/tests"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fb073c94d1f584010fc75867b686d6d3"
> +
> +INC_PR = "r0"
> +
> +SRC_URI = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz"
> +S = "${WORKDIR}/dt.d"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_compile() {
> +	${MAKE} -f Makefile.linux
> +}
> +
> +SRC_URI_append_libc-uclibc = " file://no_aio.patch "
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 dt ${D}${bindir}
> +}
> +
> +SRC_URI[md5sum] = "fc3373e30868698b90f02cc5fab9aabd"
> +SRC_URI[sha256sum] = "6a213b8da2b8907c4f1633c3b90229085ac239e4d43aa5879b0123c21f951cab"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

