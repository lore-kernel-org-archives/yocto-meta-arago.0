Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9E42752A22
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 03:03:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2433Em6010781
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:03:14 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2433Ejg007359
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 21:03:14 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 21:03:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2433ELi015720;
	Mon, 3 Mar 2014 21:03:14 -0600
Date: Mon, 3 Mar 2014 22:03:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140304030313.GZ22125@edge>
References: <1393800786-23695-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393800786-23695-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v5] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 04 Mar 2014 03:03:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Mar 02, 2014 at 05:53:06PM -0500, Sam Nelson wrote:
> - linuxptp is an implementation of precision time protocol (PTP)

Ah, didn't see you sent v5 after v4, sorry...

> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous patch
> * Fix issues with passing extra Cflags

BTW, you can keep previous patch revisions here as well, just accumulate them 
and say something like "Changes in v5". That's basically the Changelog of the 
patch itself, it won't go into git commit message... But it's not a strict 
requirement - it's up to you whether to keep full history of changes in the 
patch, or just the latest one.

> ---
> ---
>  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> new file mode 100755
> index 0000000..d2e39f0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> @@ -0,0 +1,23 @@
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
> +inherit autotools 
> +
> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
> +		EXTRA_CFLAGS="-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
> +		-DHAVE_ONESTEP_SYNC""

Are you sure you don't need to escape quotes in the middle? Or alternatively, 
you can use single quotes in the middle, inside outer double quotes...


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

