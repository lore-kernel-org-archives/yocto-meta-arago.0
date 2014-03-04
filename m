Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BFE895208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 04:12:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s244CMU1005940
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:12:22 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s244CM63012272
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 22:12:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 22:12:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s244CL3w021589;
	Mon, 3 Mar 2014 22:12:21 -0600
Date: Mon, 3 Mar 2014 23:12:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140304041221.GD22125@edge>
References: <1393906061-15381-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393906061-15381-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v4] openntpd: Add recipe for building OpenNTPD
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
X-List-Received-Date: Tue, 04 Mar 2014 04:12:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 03, 2014 at 11:07:41PM -0500, Sam Nelson wrote:
> - OpenNTPD is a open source implementation of Network time protocol
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
> Changes in patch V4
> - Removed unused CFLAGS TI_ADD_SUPPORT_HW_TIMESTAMPING
> 
> Changes patch v3
> * Remove kernel dependency
> * removed Flags depending on staging  kernel
> ---
> ---
>  .../openntpd/openntpd_3.9p1.bb                     |   21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
> new file mode 100755
> index 0000000..ba8a9d3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
> +Network Time Protocol."
> +HOMEPAGE = "http://www.openntpd.org/"
> +SECTION = "console/network"
> +LICENSE = "BSD ISC"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> +
> +S = "${WORKDIR}/openntpd-${PV}"
> +EXTRA_OECONF = "--disable-strip"
> +inherit autotools
> +
> +LDFLAGS += "-lrt"
> +EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
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

