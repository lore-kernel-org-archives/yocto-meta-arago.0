Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1CFED5298A
	for <meta-arago@arago-project.org>;
	Fri, 24 Mar 2017 17:43:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2OHgxiQ022063
	for <meta-arago@arago-project.org>; Fri, 24 Mar 2017 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490377380;
	bh=mbLdn5GAu9UrX8ez/M8y/KVwpBYDer4llMWX5PxeX+s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WPSel9W7XlyeBBAMoBZJOXV36nlhIYcTpS8x2j/S3vQlEgZWwvXhmKOSPU8kZu4xM
	k5hzwInxCAru/uq0PRAxassmwU/a8pSm5cIHZzvNvKDwE4IdnsiR1nD0pBqJ/rAkSt
	Cx7aV2uZ0IGlH45DW7qTEertxeCrV8j8VZVBSbjo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2OHgsw5027524
	for <meta-arago@arago-project.org>; Fri, 24 Mar 2017 12:42:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 12:42:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2OHgs2p018941;
	Fri, 24 Mar 2017 12:42:54 -0500
Date: Fri, 24 Mar 2017 13:42:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pooja Prajod <a0132412@ti.com>
Message-ID: <20170324174253.GJ29187@edge>
References: <1490363106-54029-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490363106-54029-1-git-send-email-a0132412@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty gst-plugins-base] gst-plugin-base: Add bbappend for gst-base
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
X-List-Received-Date: Fri, 24 Mar 2017 17:43:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> Subject: Re: [meta-arago] [morty gst-plugins-base] gst-plugin-base: Add bbappend for gst-base

^^ Malformed - missing [PATCH] and has unnecessary [gst-plugins-base].


On Fri, Mar 24, 2017 at 07:15:06PM +0530, Pooja Prajod wrote:
> A hack patch : 0001-playbin-HACK-Change-default-value-of-flags.patch
> needs to be added for low fps issue with playbin. Hence adding append file.

Hacks should not be added to meta-arago-extras. Use meta-arago-distro instead.


> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  ...laybin-HACK-Change-default-value-of-flags.patch | 30 ++++++++++++++++++++++
>  .../gstreamer1.0-plugins-base_1.8.3.bbappend       |  6 +++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
> new file mode 100644
> index 0000000..321f281
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
> @@ -0,0 +1,30 @@
> +From 436543acab9441ebb121da74b6433eae43bc8786 Mon Sep 17 00:00:00 2001
> +From: Pooja Prajod <a0132412@ti.com>
> +Date: Fri, 24 Mar 2017 18:24:15 +0530
> +Subject: [morty gst-plugins-base] playbin HACK: Change default value of flags

^^ This is a patch for gstreamer source code, hence morty doesn't even apply. 
Still missing [PATCH] though.


> +
> +The deinterlace flag in playbin is causing
> +high cpu load which in turn lowers fps of the playback.
> +The behavior is not yet rootcaused. This is a workaround.
> +
> +Signed-off-by: Pooja Prajod <a0132412@ti.com>
> +---
> + gst/playback/gstplaybin2.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst/playback/gstplaybin2.c b/gst/playback/gstplaybin2.c
> +index ad63600..13439e3 100644
> +--- a/gst/playback/gstplaybin2.c
> ++++ b/gst/playback/gstplaybin2.c
> +@@ -524,7 +524,7 @@ struct _GstPlayBinClass
> + #define DEFAULT_SUBURI            NULL
> + #define DEFAULT_SOURCE            NULL
> + #define DEFAULT_FLAGS             GST_PLAY_FLAG_AUDIO | GST_PLAY_FLAG_VIDEO | GST_PLAY_FLAG_TEXT | \
> +-                                  GST_PLAY_FLAG_SOFT_VOLUME | GST_PLAY_FLAG_DEINTERLACE | \
> ++                                  GST_PLAY_FLAG_SOFT_VOLUME | \
> +                                   GST_PLAY_FLAG_SOFT_COLORBALANCE
> + #define DEFAULT_N_VIDEO           0
> + #define DEFAULT_CURRENT_VIDEO     -1
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
> new file mode 100644
> index 0000000..c1d437f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
> @@ -0,0 +1,6 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI_append = " \
> +    file://0001-playbin-HACK-Change-default-value-of-flags.patch \
> +"
> +PR = "r3"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

