Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25E3C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:05:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6774.1788210326534376032
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB10F40C3E;
	Mon, 31 Aug 2026 21:05:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1L8i0nneAyv; Mon, 31 Aug 2026 21:05:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9019940B13;
	Mon, 31 Aug 2026 21:05:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4864117C887; Mon, 31 Aug 2026 17:05:22 -0400 (EDT)
Date: Mon, 31 Aug 2026 17:05:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Drop
 unneeded patches
Message-ID: <20260831210522.GO19759@denix.org>
References: <20260831205242.3284673-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831205242.3284673-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17631

On Mon, Aug 31, 2026 at 03:52:42PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent version bump in oe-core [1] has moved to a version where these
> two patches are no longer needed.  Drop them.

I was looking into this as well and I don't believe the patches are no longer 
needed. They are definitely no longer apply, but I don't see they got accepted 
nor even submitted upstream. I see the code has changed around these 2 patches 
enough for them to no longer apply. I think someone needs to re-do them again 
for the new version...


> [1] https://git.openembedded.org/openembedded-core/commit/?id=171b0ae0160d38e423c9447b883a4fd709808be8
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ence-to-contiguous-format-if-support.patch | 52 -------------------
>  ...pt-non-contiguous-if-contiguous-form.patch | 35 -------------
>  .../gstreamer1.0-plugins-good_1.28-arago.inc  |  2 -
>  3 files changed, 89 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
> deleted file mode 100644
> index ff617655..00000000
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 0238a430b19e5302dc924321225a3e24778bd2b0 Mon Sep 17 00:00:00 2001
> -From: Devarsh Thakkar <devarsht@xilinx.com>
> -Date: Fri, 9 Mar 2018 10:30:47 -0800
> -Subject: [PATCH] v4l2: Give preference to contiguous format if supported
> -
> -Currently gstreamer uses single format GST_VIDEO_FORMAT_NV12 for both
> -NV12 (which uses single contiguous buffer for luma and chroma)
> -and NV12M (uses two non-contiguous buffers for luma and chroma )
> -and if device supports both NV12M and NV12 then it gives preference
> -to NV12M over NV12.
> -
> -The logic to give preference to NV12 before NV12M whenever GST_VIDEO_FORMAT_NV12
> -is set.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> -Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ----
> - sys/v4l2/gstv4l2object.c | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> -index e9026da..ad9f630 100644
> ---- a/sys/v4l2/gstv4l2object.c
> -+++ b/sys/v4l2/gstv4l2object.c
> -@@ -2013,17 +2013,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> -   }
> -
> --  /* Prefer the non-contiguous if supported */
> --  v4l2object->prefered_non_contiguous = TRUE;
> -+  /* Prefer the contiguous if supported */
> -+  v4l2object->prefered_non_contiguous = FALSE;
> -
> --  if (fourcc_nc)
> --    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
> -+  if (fourcc)
> -+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
> -   else if (fourcc == 0)
> -     goto unhandled_format;
> -
> -   if (fmt == NULL) {
> --    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
> --    v4l2object->prefered_non_contiguous = FALSE;
> -+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
> -+    v4l2object->prefered_non_contiguous = TRUE;
> -   }
> -
> -   if (fmt == NULL)
> -     goto unsupported_format;
> ---
> -2.39.0
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> deleted file mode 100644
> index 4878ea49..00000000
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
> -From: Brandon Brnich <b-brnich@ti.com>
> -Date: Tue, 10 Mar 2026 19:47:35 -0500
> -Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format isn't
> - present
> -
> -Gstreamer previously had logic that would set fourcc even if the format
> -being negotiated didn't have a contiguous option - YUYV for example. A fix
> -was sent to properly set either forcc/forcc_nc properly. For formats that
> -don't have contiguous formats, that would mean attempting non-contiguous
> -options wouldn't happen. Attempt non-contiguous formats before erroring
> -out if applicable.
> -
> -Upstream-Status: Inappropriate [TI-custom]
> -
> -Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ----
> - sys/v4l2/gstv4l2object.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> -index dbfe4992be..b4a7c32f31 100644
> ---- a/sys/v4l2/gstv4l2object.c
> -+++ b/sys/v4l2/gstv4l2object.c
> -@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> -
> -   if (fourcc)
> -     fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
> --  else if (fourcc == 0)
> -+  else if (fourcc_nc == 0)
> -     goto unhandled_format;
> -
> -   if (fmt == NULL) {
> ---
> -2.43.0
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> index a2204efb..d9e0df88 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
> @@ -4,10 +4,8 @@ SRC_URI:append = " \
>      file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
>      file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>      file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> -    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>      file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>      file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
> -    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
>  "
>  
>  PR:append = ".arago0"
> -- 
> 2.43.0

