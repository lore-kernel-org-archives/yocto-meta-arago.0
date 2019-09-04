Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BB8F252960
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 18:29:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84ISjeI074372
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 13:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567621725;
	bh=4Hq5tdBx3o9dVpqZqwAtqJvarG+nRdPfMHD87Tu8dpg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aJk/7jkrtsdxR8krJT6CP9ph/pRJ9IcYWHmuAeZ7thyq/3RztrJa7DKLfHE09u8yj
	Zepr2KLvQDu8F46BiRIpS06XS6P4eRiDgwBRRB+GJ+s39ZXSD1gpNw2FIUOQDyAMVA
	x8rIdcVsjHW4jdlLR9aE5JfBYtc6RCiebb6av7io=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84ISjiY066947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 13:28:45 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 4 Sep 2019 13:28:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 4 Sep 2019 13:28:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84ISis4081902;
	Wed, 4 Sep 2019 13:28:44 -0500
Date: Wed, 4 Sep 2019 14:28:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Angela Stegmaier <angelabaker@ti.com>
Message-ID: <20190904182844.GB6620@beryl>
References: <1567621187-12852-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <1567621187-12852-1-git-send-email-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud][PATCH] gstreamer1.0*-good: Add YUV422M support for v4l2 plugin
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
X-List-Received-Date: Wed, 04 Sep 2019 18:29:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 04, 2019 at 01:19:47PM -0500, Angela Stegmaier wrote:
> The v4l2 decoder can return YUV422M decoded output. This
> support was missing in the v4l2plugin, however. This patch
> adds the missing support.
> 
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>  ...Update-formats-table-to-include-YUV422-mu.patch | 61 ++++++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.14.4.bbappend      |  3 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
> new file mode 100644
> index 0000000..c7f7a6f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
> @@ -0,0 +1,61 @@
> +From 57370dbe73c970077ad028fa1008cb6303445c21 Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Tue, 20 Aug 2019 15:59:02 -0500
> +Subject: [PATCH] v4l2object: Update formats table to include YUV422
> + multiplanar
> +
> +YUV422 multiplanar is missing from the table. Add the support
> +for this format.

Upstream-Status: for the patch is missing here.


> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index c32608c..87d262f 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -129,6 +129,7 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
> +   {V4L2_PIX_FMT_UYVY, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_VYUY, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_YUV422P, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_YUV422M, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_YUV411P, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_Y41P, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_YUV444, TRUE, GST_V4L2_RAW},
> +@@ -1088,6 +1089,7 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
> +       rank = YUV_BASE_RANK + 4;
> +       break;
> +     case V4L2_PIX_FMT_YUV422P: /* Y42B, 16 bits per pixel */
> ++    case V4L2_PIX_FMT_YUV422M:
> +       rank = YUV_BASE_RANK + 8;
> +       break;
> + 
> +@@ -1343,6 +1345,7 @@ gst_v4l2_object_v4l2fourcc_to_video_format (guint32 fourcc)
> +       format = GST_VIDEO_FORMAT_Y41B;
> +       break;
> +     case V4L2_PIX_FMT_YUV422P:
> ++    case V4L2_PIX_FMT_YUV422M:
> +       format = GST_VIDEO_FORMAT_Y42B;
> +       break;
> +     case V4L2_PIX_FMT_YVYU:
> +@@ -1484,6 +1487,7 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
> +     case V4L2_PIX_FMT_YVU420:
> +     case V4L2_PIX_FMT_UYVY:
> +     case V4L2_PIX_FMT_YUV422P:
> ++    case V4L2_PIX_FMT_YUV422M:
> +     case V4L2_PIX_FMT_YVYU:
> +     case V4L2_PIX_FMT_YUV411P:{
> +       GstVideoFormat format;
> +@@ -1714,6 +1718,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> +         break;
> +       case GST_VIDEO_FORMAT_Y42B:
> +         fourcc = V4L2_PIX_FMT_YUV422P;
> ++        fourcc_nc = V4L2_PIX_FMT_YUV422M;
> +         break;
> +       case GST_VIDEO_FORMAT_NV12:
> +         fourcc = V4L2_PIX_FMT_NV12;
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> index e262424..98b0123 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".arago1"
> +PR_append = ".arago2"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> @@ -7,4 +7,5 @@ SRC_URI += " \
>        file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
>        file://0001-v4l2-Sync-kernel-header-with-linuxtv-tree.patch \
>        file://0002-v4l2videodec-Add-HEVC-decoder-support.patch \
> +      file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
>        "
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

