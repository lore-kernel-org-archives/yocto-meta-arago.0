Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C3DD45208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 04:11:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s244BY6g028521
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:11:34 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s244BXqg011941
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:11:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 22:11:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s244BX94022361;
	Mon, 3 Mar 2014 22:11:33 -0600
Date: Mon, 3 Mar 2014 23:11:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140304041133.GC22125@edge>
References: <1393905551-11880-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393905551-11880-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v6] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 04 Mar 2014 04:11:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 03, 2014 at 10:59:11PM -0500, Sam Nelson wrote:
> - linuxptp is an implementation of precision time protocol (PTP)
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> 
> ---
> Change in Patch v6:
> * Removed inherit autotools
> 
> Change in Patch v5
> * Fix issues with passing extra Cflags
> ---
> ---
>  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> new file mode 100755
> index 0000000..85062aa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
> +according to IEEE standard 1588 for Linux"
> +HOMEPAGE = "http://linuxptp.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +PR = "r0"
> +
> +SRC_URI = "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tgz"
> +SRC_URI[md5sum] = "664706a86fe1413391d4536080548501"
> +SRC_URI[sha256sum] = "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad3085"
> +
> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
> +		EXTRA_CFLAGS="-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
> +		-DHAVE_ONESTEP_SYNC""
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

