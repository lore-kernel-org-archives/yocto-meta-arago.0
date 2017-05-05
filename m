Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A5A06529A3
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 15:43:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v45FhWdn017003
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493999012;
	bh=v0sQzoFBrXvh2lJoUzRTQSgSDj74/P+4UGN4YRXw4cI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SMqm7tZjXglOBIbEYpDiu+z0WQsh0PXEPDQJ25i6B4X18XC6vQtSHfa4Y5ROMgqm4
	MhvQC5xTPvC7hog3lERTjZBILEuXlMyTDLmFOl6nVOxwXSV8FwtJxZSvbf0oXm+kth
	lsvZdBTh2joM5HKEXb0pgL7KrXYnP8mokJ46iLwY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v45FhWmq003903
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 10:43:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 May 2017 10:43:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v45FhWZH003283;
	Fri, 5 May 2017 10:43:32 -0500
Date: Fri, 5 May 2017 11:43:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pooja Prajod <a0132412@ti.com>
Message-ID: <20170505154331.GH20769@edge>
References: <1493993071-109815-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493993071-109815-1-git-send-email-a0132412@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago/morty] gstreamer1.0-plugins-vpe: Update SRC_REV and bump PR
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
X-List-Received-Date: Fri, 05 May 2017 15:43:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Fri, May 05, 2017 at 07:34:31PM +0530, Pooja Prajod wrote:
> Update SRC_REV to pick the following bug fixes:
> 1. gstvpe: Keep a copy of the negotiated v4l2 format
> 2. gstvpe: Change NV12 buffer to use one plane instead of two
> 
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> index e0fb640..a991e00 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
>  require gstreamer1.0-plugins-ti.inc
>  
> -PR = "${INC_PR}.14"
> -SRCREV = "6ec1a9c9fc17e0cae781aed067a2a6f2c1f92d68"
> +PR = "${INC_PR}.15"
> +SRCREV = "3c44b9f4769d8a2b1e3b3441d789a62047c7f940"
>  
>  SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
>             file://ti-video.conf \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

