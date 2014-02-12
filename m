Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9FBF75298A
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 17:52:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CHqrfm011612
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 11:52:53 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CHqr6j023754
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 11:52:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Feb 2014 11:52:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CHqr9D023622;
	Wed, 12 Feb 2014 11:52:53 -0600
Date: Wed, 12 Feb 2014 12:52:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140212175252.GI4346@edge>
References: <1391785246-19688-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391785246-19688-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Wed, 12 Feb 2014 17:52:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 07, 2014 at 10:00:46AM -0500, Sam Nelson wrote:
> - OpenNTPD is a open source implementation of Network time protocol
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-bsp/openntpd/openntpd_3.9p1.bb         |   27 ++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/openntpd/openntpd_3.9p1.bb

Same comment - recipes-connectivity seems better fit for networking 
tools/daemons.


> diff --git a/meta-arago-extras/recipes-bsp/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-bsp/openntpd/openntpd_3.9p1.bb
> new file mode 100755
> index 0000000..b4e3402
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/openntpd/openntpd_3.9p1.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
> +Network Time Protocol."
> +HOMEPAGE = "http://www.openntpd.org/"
> +SECTION = "console/network"
> +LICENSE = "BSD ISC"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
> +
> +DEPENDS += "virtual/kernel"
> +PR = "r0"
> +
> +SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> +
> +S = "${WORKDIR}/openntpd-${PV}"
> +EXTRA_OECONF = "--disable-strip"
> +inherit autotools
> +
> +LDFLAGS += "-lrt"
> +CFLAGS += "-DTI_ADD_SUPPORT_HW_TIMESTAMPING"
> +STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"

^^^ I don't think the above variable is correct any longer.

Plus, it's already properly defined for you, so why redefine it?


> +CPPFLAGS = "-I${STAGING_KERNEL_DIR}/include"
> +CPPFLAGS += "-I${STAGING_KERNEL_DIR}/arch/arm/include"
> +
> +EXTRA_OECONF += "CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}" \
> +                 --with-privsep-user=root --with-privsep-path=/${prefix}"
> +
> +SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
> +SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

