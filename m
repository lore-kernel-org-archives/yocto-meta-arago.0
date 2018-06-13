Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8CDE35299A
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 05:26:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5D5QPVA003414
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 00:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528867586;
	bh=PpKWWIKNvQuErOZaPRHUCLHrLS49T1amuPJOG27288M=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=tZIF3hAW7Gav4Q2CbMB5z2QfZ8VWrgfbkmda8kdKvgvcrHJREj8zuqbf+QFJjCI6/
	zUwhu8iLT+hQnlCIzAtOuf7RO52cBsUyy+FzyMW8LJQdHP+Qz7D4iHEngIIJbDk9go
	71Tamt81p0bdae6EJe36JbaN3jCr254aFkr+6Jgw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5D5QPfo024114
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 00:26:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 00:26:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 00:26:25 -0500
Received: from [172.24.158.83] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5D5QOB3028904;
	Wed, 13 Jun 2018 00:26:24 -0500
To: Ramprasad N <x0038811@ti.com>, <meta-arago@arago-project.org>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
	<1528778710-2395-2-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <8353004e-3797-51e5-35d4-87cc867ad5bd@ti.com>
Date: Wed, 13 Jun 2018 10:56:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528778710-2395-2-git-send-email-x0038811@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko V2 1/2] gstvpe: Bump SRCREV with latest fixes
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
X-List-Received-Date: Wed, 13 Jun 2018 05:26:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: Karthik Ramanan <a0393906@ti.com>


On 12-Jun-18 10:15 AM, Ramprasad N wrote:
> This update brings in following fixes
> * Set "Progressive" in output caps to avoid memcpy
> * Set vpe in process mode for progressive streams
>    to avoid OOM issues
>
> Remove the redeundant patch from the recipe
>
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   ...late-the-output-structure-with-progressiv.patch | 33 ----------------------
>   .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
>   2 files changed, 2 insertions(+), 36 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
>
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
> deleted file mode 100644
> index 3f35302..0000000
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 4a8ae45e17e1e2d6299353cc871e9427617fa12d Mon Sep 17 00:00:00 2001
> -From: Ramprasad N <x0038811@ti.com>
> -Date: Tue, 20 Mar 2018 19:05:18 +0530
> -Subject: [PATCH] gstvpe: Populate the output structure with progressive
> -
> -playbin shows performance drop with waylandsink due
> -to frame-copy of frame buffers. The caps between vpe and
> -videoconverter don't match hence this results in frame-copy.
> -By setting the interlace-mode capabilities match and
> -all components will be configured to pass through mode.
> -
> -Signed-off-by: Ramprasad N <x0038811@ti.com>
> ----
> - src/gstvpe.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/gstvpe.c b/src/gstvpe.c
> -index d795d4c..219e5e3 100644
> ---- a/src/gstvpe.c
> -+++ b/src/gstvpe.c
> -@@ -237,6 +237,9 @@ gst_vpe_set_output_caps (GstVpe * self)
> -       "width", G_TYPE_INT, self->output_width,
> -       "height", G_TYPE_INT, self->output_height, NULL);
> -
> -+  gst_structure_set (out_s, "interlace-mode", G_TYPE_STRING,
> -+                   "progressive", NULL);
> -+
> -   if (gst_structure_get_fraction (s, "pixel-aspect-ratio",
> -           &par_width, &par_height))
> -     gst_structure_set (out_s, "pixel-aspect-ratio", GST_TYPE_FRACTION,
> ---
> -1.9.1
> -
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> index 4e1543b..fe452f0 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> @@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>   
>   require gstreamer1.0-plugins-ti.inc
>   
> -PR = "${INC_PR}.17"
> -SRCREV = "4fe4beaa1498e27878bf04020aef0099c17f2262"
> +PR = "${INC_PR}.18"
> +SRCREV = "a1fe1f3e3ae0582a4f84ae8fa7ca052fff2e9f76"
>   
>   SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
>              file://ti-video.conf \
> -           file://0001-gstvpe-Populate-the-output-structure-with-progressiv.patch \
>   "
>   
>   do_install_append() {


