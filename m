Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B69365209B
	for <meta-arago@arago-project.org>;
	Thu, 16 Nov 2017 21:02:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAGL2ThA023657
	for <meta-arago@arago-project.org>; Thu, 16 Nov 2017 15:02:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510866149;
	bh=cMMgJWM96RvE3eBzgMe71GRRBmD7qyX5nhWxS5UFKoA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hkf/Uf9OG9bVcZTZzHQloXLKkumIpCcs9td67xITPnkuc8J/Xq9xxGkIPQJsQcwJ7
	AhiciBY9cmVQVdWI0cvVZyujPxCXafus129Gytcn/nH1gOK1K6WliSyKtjuK/VhQaB
	sw7XI3D1dKMU0CHV94046UADnezI0BdWch+YdeOw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAGL2OqH025883
	for <meta-arago@arago-project.org>; Thu, 16 Nov 2017 15:02:24 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 16 Nov 2017 15:02:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 16 Nov 2017 15:02:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAGL2N4G015179;
	Thu, 16 Nov 2017 15:02:24 -0600
Date: Thu, 16 Nov 2017 16:02:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ramprasad N <x0038811@ti.com>
Message-ID: <20171116210208.GC32707@edge>
References: <1510824355-26185-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
In-Reply-To: <1510824355-26185-1-git-send-email-x0038811@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty PATCH V5] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Thu, 16 Nov 2017 21:02:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this patch upstreamable?


On Thu, Nov 16, 2017 at 02:55:55PM +0530, Ramprasad N wrote:
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>  ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> new file mode 100644
> index 0000000..1af90c1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> @@ -0,0 +1,33 @@
> +From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 2001
> +From: Ramprasad N <x0038811@ti.com>
> +Date: Fri, 13 Oct 2017 15:48:06 +0530
> +Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
> +
> +v4l2src plugin allocates 4 buffers for the pipeline.
> +To capture video in realtime the pipeline without frameloss,
> +four buffers are not sufficient. Increase the
> +number of buffers by 4 more.
> +
> +Signed-off-by: Ramprasad N <x0038811@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 549e06f..773f46d 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> +      * to fill the pipeline, the minimum required to decoder according to the
> +      * driver and 1 more, so we don't endup up with everything downstream or
> +      * held by the decoder. */
> +-    own_min = min + obj->min_buffers + 1;
> ++    /* Increase the number of buffers required by 4 more to capture video in
> ++     * realtime. With default number of 4 buffers, frame loss is observed */
> ++    own_min = min + obj->min_buffers + 5;
> + 
> +     /* If no allocation parameters where provided, allow for a little more
> +      * buffers and enable copy threshold */
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
> new file mode 100644
> index 0000000..29a07b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
> @@ -0,0 +1,8 @@
> +PR_append = ".arago0"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
> +      "
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

