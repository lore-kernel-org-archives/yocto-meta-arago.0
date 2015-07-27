Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DEA8D52987
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2015 11:00:00 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6RAxxXN011793
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 05:59:59 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RAxtRe026385
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 16:29:57 +0530
Received: from [172.24.158.136] (172.24.158.136) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 27 Jul 2015 16:29:55 +0530
Message-ID: <55B60F2C.4020201@ti.com>
Date: Mon, 27 Jul 2015 16:29:56 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1437992680-17958-1-git-send-email-a0393906@ti.com>
	<1437992680-17958-2-git-send-email-a0393906@ti.com>
In-Reply-To: <1437992680-17958-2-git-send-email-a0393906@ti.com>
X-Originating-IP: [172.24.158.136]
Subject: Re: [daisy, master 2/2] gstreamer1.0-plugins-good: optimize delay in v4l2src
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
X-List-Received-Date: Mon, 27 Jul 2015 11:00:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On further thought, I think this applies only to daisy.
Please ignore the merge request into master.

On 27-Jul-15 3:54 PM, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>   ...0002-gstv4l2src-Optimize-delay-in-capture.patch |   31 ++++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    5 ++--
>   2 files changed, 34 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
>
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
> new file mode 100644
> index 0000000..07c2f24
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
> @@ -0,0 +1,31 @@
> +From e989ef6143b222df6eb79bab626fc972d6513ead Mon Sep 17 00:00:00 2001
> +From: Pooja Prajod <a0132412@ti.com>
> +Date: Wed, 4 Mar 2015 16:40:26 +0530
> +Subject: [PATCH 2/2] gstv4l2src: Optimize delay in capture
> +
> +This patch reduces the delay in capture by reducing
> +the S_FMT ioctls for determining whether its interlaced capture.
> +It assumes capture is not interlaced if driver is vip
> +
> +Signed-off-by: Pooja Prajod <a0132412@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c |    3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index c3ed422..77d75c2 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -1706,6 +1706,9 @@ gst_v4l2_object_probe_caps_for_format_and_size (GstV4l2Object * v4l2object,
> +      * causes expensive and slow USB IO, so don't probe them for interlaced
> +      */
> +     interlaced = FALSE;
> ++  } else if (!strcmp ((char *) v4l2object->vcap.driver, "vip")) {
> ++    /* Interlaced detection using VIDIOC_TRY/S_FMT */
> ++    interlaced = FALSE;
> +   } else {
> +     /* Interlaced detection using VIDIOC_TRY/S_FMT */
> +     if (!gst_v4l2_object_get_nearest_size (v4l2object, pixelformat,
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> index 0548aa9..6b8df1d 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> @@ -1,6 +1,7 @@
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
>   SRC_URI_append = " \
> -        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
> +        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch \
> +        file://0002-gstv4l2src-Optimize-delay-in-capture.patch"
>
> -PR_append = "-arago0"
> +PR_append = "-arago1"
>


