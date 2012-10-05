Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 24890529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 16:11:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF0001KGYFCNG0@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 11:11:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 64CEE20088; Fri,
	05 Oct 2012 12:11:03 -0400 (EDT)
Date: Fri, 05 Oct 2012 12:11:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005161103.GC23366@denix.org>
References: <1349419299-21431-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349419299-21431-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] bt-obex: Port recipe from arago
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
X-List-Received-Date: Fri, 05 Oct 2012 16:11:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 01:41:39AM -0500, Franklin S. Cooper Jr wrote:
> * Port recipe from Arago.
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-connectivity/bt-obex/bt-obex.bb        |   33 ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> new file mode 100644
> index 0000000..594e5bc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "BT Obex - Agentfor OBEXD (OPP/FTP profile)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +RDEPENDS += "bluez4"

Like I told you on irc - any run-time specific variable (RREPLACES, 
RCONFLICTS, RDEPENDS) requires package specifier, e.g.:

RDEPENDS_${PN} += "bluez4"
RDEPENDS_bt-obex += "bluez4"
RDEPENDS_${PN}-dev += "bluez4"

Unfortunately, I wasn't paying attention and passed few recipes where this was 
not done properly...

-- 
Denys


> +DEPENDS += "glib-2.0 dbus-glib"
> +
> +PR = "r0+gitr${SRCREV}"
> +
> +SRCREV = "171181b6ef6c94aefc828dc7fd8de136b9f97532"
> +
> +SRC_URI = "git://gitorious.org/bluez-tools/bluez-tools.git;protocol=git \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 755 ${S}/src/bt-adapter ${D}${bindir}
> +       install -m 755 ${S}/src/bt-agent   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-audio   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-device  ${D}${bindir}
> +       install -m 755 ${S}/src/bt-input   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-monitor ${D}${bindir}
> +       install -m 755 ${S}/src/bt-network ${D}${bindir}
> +       install -m 755 ${S}/src/bt-obex    ${D}${bindir}
> +       install -m 755 ${S}/src/bt-serial  ${D}${bindir}
> +}
> +
> +SRC_URI[md5sum] = "36080a767e63e54878cd6bcfb20c4f3b"
> +SRC_URI[sha256sum] = "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

