Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B882E529DD
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 18:55:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UItUdJ007608
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:55:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UItTIu008191
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:55:29 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 12:55:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UItS7e022908	for
	<meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:55:28 -0600
Date: Fri, 30 Jan 2015 13:55:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150130185527.GO21328@edge>
References: <1422408768-26587-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1422408768-26587-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] gst-plugins-*-mm-accel: sync up on customizations between gst plugins
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
X-List-Received-Date: Fri, 30 Jan 2015 18:55:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Can you please validate that this patch doesn't break anything for you? 
Thanks.

-- 
Denys


On Tue, Jan 27, 2015 at 08:32:48PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend          | 9 +++++++++
>  .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend         | 6 ++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
>  create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
> new file mode 100644
> index 0000000..e6d72ba
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
> @@ -0,0 +1,9 @@
> +PR_append = "-arago0"
> +
> +PACKAGECONFIG = "bzip curl faad"
> +
> +# Disable features that have potential commercial licensing restrictions
> +EXTRA_OECONF += "\
> +    --disable-mpeg2enc \
> +    --disable-acm \
> +"
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
> new file mode 100644
> index 0000000..4cb0608
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
> @@ -0,0 +1,6 @@
> +PR_append = "-arago0"
> +
> +DEPENDS := "${@oe_filter_out('gconf','${DEPENDS}', d)}"
> +DEPENDS := "${@oe_filter_out('gconf-native','${DEPENDS}', d)}"
> +
> +EXTRA_OECONF += "--disable-gconftool --disable-gconf"
> -- 
> 2.2.0
> 

