Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6054152A4F
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 18:04:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GI47v6007856
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489687448;
	bh=BB4s/Vx9Cq1Wk/as6KFkFyaNeP/2jplrqlcFPowvh0o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VrKBkelrF61R7twM6s05JEyU/V6hszx9ZWaNEbahCQEetBh4CH8NxESIcvoUKlVId
	BQJ1NfpUgUY0X//5pz6TqMuQ9O1mym6j0xzLkgXA0HEP6H20A05UqLMU665Xe5iUC9
	iPRVXVLCs+n/G8Qy/gQB4TKFZ0JIuKUDKtFsOXPA=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GI47FO020821
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:04:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 13:04:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GI47gK018447;
	Thu, 16 Mar 2017 13:04:07 -0500
Date: Thu, 16 Mar 2017 14:04:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170316180406.GK14484@edge>
References: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
	<1489685377-53666-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489685377-53666-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth][PATCH 2/3] gstreamer1.0-plugins-bad: kmssink: add YUYV support
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
X-List-Received-Date: Thu, 16 Mar 2017 18:04:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 16, 2017 at 01:29:36PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../0002-kmssink-add-YUYV-support.patch            | 81 ++++++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  2 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
> new file mode 100644
> index 0000000..a5791cc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
> @@ -0,0 +1,81 @@
> +From af348c890c04ce9626d411055aae0974f410219f Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Tue, 14 Mar 2017 17:24:07 -0400
> +Subject: [PATCH 2/2] kmssink: add YUYV support
> +
> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + sys/kms/gstkmsbufferpriv.c | 32 +++++++++++++++++++++++++++-----
> + sys/kms/gstkmssink.c       |  2 +-
> + 2 files changed, 28 insertions(+), 6 deletions(-)
> +
> +diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
> +index 172a4c3..57c01f8 100644
> +--- a/sys/kms/gstkmsbufferpriv.c
> ++++ b/sys/kms/gstkmsbufferpriv.c
> +@@ -41,22 +41,44 @@
> + static int
> + create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
> + {
> ++
> +   /* TODO get format, etc from caps.. and query device for
> +    * supported formats, and make this all more flexible to
> +    * cope with various formats:
> +    */
> +-  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
> +-
> ++  GstVideoFormat format = sink->format;
> ++  uint32_t fourcc;
> +   uint32_t handles[4] = {
> +-    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
> ++    omap_bo_handle (priv->bo),
> +   };
> +   uint32_t pitches[4] = {
> +-    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
> ++    GST_ROUND_UP_4 (sink->input_width),
> +   };
> +   uint32_t offsets[4] = {
> +-    0, pitches[0] * sink->input_height
> ++    0,
> +   };
> + 
> ++  /**
> ++   * Only two formats are supported:
> ++   * AM3/4: YUYV
> ++   * AM5: NV12, YUYV
> ++   */
> ++  if(format == GST_VIDEO_FORMAT_YUY2)
> ++  {
> ++    /* YUYV */
> ++    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
> ++    pitches[0] = GST_ROUND_UP_4 (sink->input_width*2);
> ++  }
> ++  else
> ++  {
> ++    /* NV12 */
> ++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
> ++    handles[1] = omap_bo_handle (priv->bo);
> ++    pitches[1] = GST_ROUND_UP_4 (sink->input_width);
> ++    offsets[1] = pitches[0] * sink->input_height;
> ++  }
> ++
> ++
> +   return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
> +       fourcc, handles, pitches, offsets, &priv->fb_id, 0);
> + }
> +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
> +index 9795bdf..b36d88f 100644
> +--- a/sys/kms/gstkmssink.c
> ++++ b/sys/kms/gstkmssink.c
> +@@ -50,7 +50,7 @@ static GstStaticPadTemplate gst_kms_sink_template_factory =
> + GST_STATIC_PAD_TEMPLATE ("sink",
> +     GST_PAD_SINK,
> +     GST_PAD_ALWAYS,
> +-    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
> ++    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("{NV12,YUY2}"))

YUY2 or YUYV?


> +     );
> + 
> + enum
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> index 2c903d4..317b19e 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -21,10 +21,12 @@ DEPENDS_append_ti33x = " \
>  
>  SRC_URI_append_omap-a15 = " \
>      file://0001-kmssink-remove-DCE-dependencies.patch \
> +    file://0002-kmssink-add-YUYV-support.patch \
>  "
>  
>  SRC_URI_append_ti43x = " \
>      file://0001-kmssink-remove-DCE-dependencies.patch \
> +    file://0002-kmssink-add-YUYV-support.patch \
>  "
>  
>  SRC_URI_append_ti33x = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

