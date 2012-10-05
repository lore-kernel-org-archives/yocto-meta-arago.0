Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0B46652AB6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:26:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95KQGjh017242;
	Fri, 5 Oct 2012 15:26:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95KQGis025685;
	Fri, 5 Oct 2012 15:26:16 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Oct 2012 15:26:16 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q95KQGb0012389;
	Fri, 5 Oct 2012 15:26:16 -0500
Date: Fri, 5 Oct 2012 16:26:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121005202616.GB32317@edge>
References: <1349470067-26340-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1349470067-26340-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] bt-obex: Port recipe from arago
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
X-List-Received-Date: Fri, 05 Oct 2012 20:26:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 05, 2012 at 03:47:47PM -0500, Franklin S. Cooper Jr wrote:
> * Port recipe from Arago.
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use proper RDEPENDS syntax.

Ack, will push it probably tonight.

-- 
Denys


>  .../recipes-connectivity/bt-obex/bt-obex.bb        |   33 ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> new file mode 100644
> index 0000000..5c561f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "BT Obex - Agentfor OBEXD (OPP/FTP profile)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +RDEPENDS_${PN} += "bluez4"
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

