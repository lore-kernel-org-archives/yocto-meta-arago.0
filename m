Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 35DBA52A5F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:31:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKVhmd007405
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:31:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKVhcc028480
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 15:31:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 15:31:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKVgAA020717;
	Fri, 23 Aug 2013 15:31:43 -0500
Date: Fri, 23 Aug 2013 16:31:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130823203141.GF27308@edge>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1377209433-10830-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] gst-plugins-bad: Remove with-plugins from configuration
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
X-List-Received-Date: Fri, 23 Aug 2013 20:31:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 22, 2013 at 05:10:30PM -0500, Franklin S. Cooper Jr wrote:
> * The with-plugins option restricts gst-plugins-bad from building any plugin
>   beyond those specified.
> * Remove this option to allow as many plugins as possible to be built.

I don't believe the description here is correct for this patch. Looks like 
we've been already removing --with-plugins option before, we just need to 
update it to match the upstream, right?


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> index 8ae8050..a13dd54 100644
> --- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago3"
> +PR_append = "-arago4"
>  
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> @@ -9,7 +9,7 @@ EXTRA_OECONF += "--disable-rsvg"
>  
>  # Remove the restriction of which plugins are built. Previously fbdevsink
>  # was not built which is needed by the gstreamer demos included in the SDK.
> -EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
> +EXTRA_OECONF := "${@oe_filter_out('--with-plugins=wavpack,mpegvideoparse','${EXTRA_OECONF}', d)}"
>  
>  SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

