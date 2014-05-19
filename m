Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B9195529E1
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:31:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJV9cg018810
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:31:09 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJV99K025890
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:31:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:31:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJV8FQ018767;
	Mon, 19 May 2014 14:31:08 -0500
Date: Mon, 19 May 2014 15:31:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140519193107.GF21819@edge>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-4-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400527207-17021-4-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 03/19] gst-plugins-bad: Append with TI version of plugins
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
X-List-Received-Date: Mon, 19 May 2014 19:31:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 19, 2014 at 02:19:51PM -0500, Chase Maupin wrote:
> From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> 
> * Migrated the bbappend from meta-arago-glsdk and preserved
>   authorship for Mrinmayee
> * This append pulls the plugin sources from the git.ti.com/glsdk
>   repository which has modifications for using gstreamer with TI
>   devices.
> * Cleaned up the following for upstreaming:
>     * Restructured the recipe code to flow better
>     * Removed libdri2 dependencies since this was for X11 support
>       which was not ported.
>     * Removed LICENSE settings since these were over-riding the
>       base recipe LICENSE values.
>     * Removed unneeded FILESEXTRAPATHS setting
> * Make machines specific due to changed SRC_URI
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> new file mode 100644
> index 0000000..74cc9ce
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> @@ -0,0 +1,22 @@
> +DEPENDS_append_omap-a15 = " omap5-sgx-ddk-um-linux libdce libdrm wayland "
> +
> +# Make MACHINE specific since we pull different sources per MACHINE
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PR_append = "-arago1"
> +
> +SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"

How will this work with the same SRCREV in different repositories?


> +SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
> +
> +S_omap-a15 = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += " --disable-pvr"
> +
> +do_configure_prepend_omap-a15() {
> +	git submodule init && git submodule update
> +	autopoint -f
> +}
> +
> +FILES_${PN} += "\
> +                ${libdir}/*.so \
> +                ${libdir}/gstreamer-0.10/*"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

