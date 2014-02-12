Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4A38352972
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 16:48:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CGmUHS015111
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 10:48:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGmUp5008183
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 10:48:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 10:48:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGmTj8004183;
	Wed, 12 Feb 2014 10:48:29 -0600
Date: Wed, 12 Feb 2014 11:48:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140212164829.GH4346@edge>
References: <1392163018-32052-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392163018-32052-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Wed, 12 Feb 2014 16:48:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2014 at 06:56:58PM -0500, Sam Nelson wrote:
> - linuxptp is an implementation of precision time protocol (PTP)
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous patch
> * Removed redundant setting of STAGING_KERNEL_DIR
> ---
> ---
>  .../recipes-bsp/linuxptp/linuxptp_1.0.bb           |   24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb

You keep adding everything to recipes-bsp... This one is not really BSP 
specific. For networking stuff, there's recipes-connectivity directory.

Otherwise looks good. BTW, does that SRCREV correspond to any official 
release? If it is, handling tarball would be easier than checking out from 
a git repository - release tarballs are usually mirrored much wider...


> diff --git a/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
> new file mode 100755
> index 0000000..6d3d3a1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
> +according to IEEE standard 1588 for Linux"
> +HOMEPAGE = "http://linuxptp.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS += "virtual/kernel"
> +PR = "r0"
> +
> +SRC_URI = "git://git.code.sf.net/p/linuxptp/code;protocol=git"
> +
> +SRCREV = "74e703727ec9b1c334c7bfbba9be1cabf4b7b461"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools 
> +
> +EXTRA_OEMAKE = "KBUILD_OUTPUT=${STAGING_KERNEL_DIR} CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH}"
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

