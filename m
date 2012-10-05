Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 919AC529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 16:59:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95GxRnV027755;
	Fri, 5 Oct 2012 11:59:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95GxRvw001383;
	Fri, 5 Oct 2012 11:59:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Oct 2012 11:58:00 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q95Gw0Da023732;
	Fri, 5 Oct 2012 11:58:00 -0500
Date: Fri, 5 Oct 2012 12:58:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121005165800.GA31500@edge>
References: <1349419808-21687-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1349419808-21687-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Fri, 05 Oct 2012 16:59:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 05, 2012 at 01:50:08AM -0500, Franklin S. Cooper Jr wrote:
> * Upgrading to newer version of iperf.
> * Newer versions of iperf reduced CPU load thus increasing performance in
>   wl12xx tests.

And one more question - sorry for separate emails.


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34 ++++++++++++++++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> 
> diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> new file mode 100644
> index 0000000..aff06b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
> +HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
> +SECTION = "console/network"
> +LICENSE = "NewBSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> +
> +SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"

You dropped all the other patches that were part of 2.0.4 - did you verify 
they are already there in 2.0.5 tree or they no longer needed?

-- 
Denys


> +
> +SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
> +SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
> +
> +PR = "r0"
> +
> +inherit autotools
> +
> +S="${WORKDIR}/iperf-${PV}"
> +
> +EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> +
> +do_configure() {
> +	export ac_cv_func_malloc_0_nonnull=yes
> +	gnu-configize
> +	oe_runconf
> +}
> +
> +do_compile() {
> +	cd ${WORKDIR}/iperf-${PV}
> +	oe_runmake
> +}
> +
> +do_install() {
> +	cd ${WORKDIR}/iperf-${PV}/src
> +	oe_runmake DESTDIR=${D} install
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

