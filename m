Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D041652986
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 02:54:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s242sPBA010064
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 20:54:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s242sPTu002534
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 20:54:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 20:54:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s242sPkB028404;
	Mon, 3 Mar 2014 20:54:25 -0600
Date: Mon, 3 Mar 2014 21:54:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140304025424.GY22125@edge>
References: <1393797046-961-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393797046-961-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v4] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 04 Mar 2014 02:54:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Mar 02, 2014 at 04:50:46PM -0500, Sam Nelson wrote:
> - linuxptp is an implementation of precision time protocol (PTP)

Much better! Sorry, couple of comments I missed the last time.


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous patch
> * Removed dependency on kernel
> * Added flags for CLOCKADJTIME & ONESTEPSYNC
> ---
> ---
>  .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
> new file mode 100755
> index 0000000..0a36631
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb

The latest version is 1.4 and you are adding 1.3 - I only checked 1.4, but 
don't think it changed that much. Do you specifically need 1.3 or 1.4 will 
also work?


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

I didn't see any autotools file in the package - no configure script, no 
Makefile.am, no acinclude.m4 etc., etc.


> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
> +		EXTRA_CFLAGS=\"-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
> +		-DHAVE_ONESTEP_SYNC\""
> +
> +do_install() {
> +	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
> +}

Other than that, looks much cleaner. If you are tired re-iterating it, just 
answer my 2 questions above and I'll make the amends myself when applying your 
patch...

-- 
Denys

