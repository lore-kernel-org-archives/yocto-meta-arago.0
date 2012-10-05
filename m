Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id D1198529D6
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 21:30:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF0010MVQRSBF0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Oct 2012 16:30:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A761A20487; Fri,
	05 Oct 2012 17:30:27 -0400 (EDT)
Date: Fri, 05 Oct 2012 17:30:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005213027.GB27533@denix.org>
References: <1349472329-1054-1-git-send-email-fcooper@ti.com>
	<1349472329-1054-2-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349472329-1054-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] gst-plugins-bad: Add faad as a dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 21:30:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 04:25:29PM -0500, Franklin S. Cooper Jr wrote:
> * Add faad2 as a dependency and libfaad as a runtime dependency. This
>   insures gst-plugins-bad-faad package is created. The gstreamer faad
>   element is needed for the AAC related gstreamer demos.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> index 0c7035b..ba06fb4 100644
> --- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-arago1"
> +PR_append = "-arago2"
>  
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> @@ -11,3 +11,7 @@ EXTRA_OECONF += "--disable-rsvg"
>  EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
>  
>  SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
> +
> +# Add faad has a dependency to insure gst-plugins-bad-faad is built.
> +DEPENDS += "faad2"
> +RDEPENDS += "libfaad"
^^^^^^^^^^^

-- 
Denys

