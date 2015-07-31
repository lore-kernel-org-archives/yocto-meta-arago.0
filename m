Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DA3B4529B5
	for <meta-arago@arago-project.org>;
	Fri, 31 Jul 2015 00:12:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6V0Cwfn025477
	for <meta-arago@arago-project.org>; Thu, 30 Jul 2015 19:12:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6V0CwEU021507
	for <meta-arago@arago-project.org>; Thu, 30 Jul 2015 19:12:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Jul 2015 19:12:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6V0CvGE004471;
	Thu, 30 Jul 2015 19:12:58 -0500
Date: Thu, 30 Jul 2015 20:12:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150731001242.GA1040@edge>
References: <1437992680-17958-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1437992680-17958-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [daisy, master 1/2] gstreamer1.0-plugins-bad: recipe revamp and bug fixes
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
X-List-Received-Date: Fri, 31 Jul 2015 00:12:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

This patch seems to use --irreversible-delete flag, which prevents it from 
being applied to the git tree. Can you please resubmit it. Thanks.

-- 
Denys


On Mon, Jul 27, 2015 at 03:54:39PM +0530, Karthik Ramanan wrote:
> The recipe update switches to a TI GLSDK hosted git repository.
> All the previously used private patches are updated on the git.
> 
> The following bug fixes have been done:
>  * Modify parser to interpolate pts
>  * drm buffer pool:
>   * Improved to fix memory leak
>   * GstDRMBufferPool support fix
>  * waylandsink:
>   * Remove drm bufferpool instance to fix socket leaks
>   * Fix memleak due to unfreed hash-table
>   * Cleanup buffer in NULL state
>   * Enable mouse pointer movement
>   * Workaround partial frame delay artifacts
>   * Solve segmentation fault in drm_handle_format
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../0001-Added-GstDRMBufferPool-support.patch      |  774 -----------
>  ...odified-waylandsink-to-accept-NV12-format.patch | 1017 --------------
>  .../0003-Added-KMSsink-support.patch               | 1457 --------------------
>  ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 -
>  ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 -
>  .../0006-GstDRMBufferPool-support-fix.patch        |   36 -
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   17 +-
>  7 files changed, 8 insertions(+), 3373 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
> deleted file mode 100644
> index c7015b2..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
> deleted file mode 100644
> index 875ff0b..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
> deleted file mode 100644
> index 8c19fa6..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
> deleted file mode 100644
> index 8c2e887..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
> deleted file mode 100644
> index 8ae79b5..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
> deleted file mode 100644
> index 0af1323..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index 2e91320..831b8ac 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -11,13 +11,12 @@ DEPENDS_append_omap-a15 = " \
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI_append = " \
> -        file://0001-Added-GstDRMBufferPool-support.patch \
> -        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
> -        file://0003-Added-KMSsink-support.patch \
> -        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
> -        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
> -        file://0006-GstDRMBufferPool-support-fix.patch \
> -"
> +SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
> +
> +PR_append = "-arago5"
>  
> -PR_append = "-arago3"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

