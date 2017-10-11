Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D28835209B
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 19:45:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BJjkvc022438
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 14:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507751146;
	bh=OiEa/hBu7HmKyA8SxMz9TLZZgj0WDEYaK+oqpC+KH1Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RlZIJFVAYJ7trNmgRE2Z+RhIvONW4jIM4gb2xa6/L8NHkNCNXNUAUpoMcd2InNYG+
	Uq94kz6y9jdvOokqgXrW7tNW0ZHy1kEujySOq9Dc5vmUbzLWxSvAVRynfIU+J2oRFC
	He3DSFCWIoA+YkZzOnGuPzUdC8CROIh20SxdV1nw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BJjkqq030178
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 14:45:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 14:45:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 14:45:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BJjkIg008179;
	Wed, 11 Oct 2017 14:45:46 -0500
Date: Wed, 11 Oct 2017 15:45:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20171011194528.GZ16210@edge>
References: <1507626126-149180-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1507626126-149180-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth 1/6] gstreamer1.0-*vpe: Update SRCREV
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
X-List-Received-Date: Wed, 11 Oct 2017 19:45:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I believe this is a consolidated set of backports from morty as well - see my 
comments to JJ in another thread about properly formatting them in the future.

-- 
Denys


On Tue, Oct 10, 2017 at 02:32:01PM +0530, Karthik Ramanan wrote:
> This update brings the following changes:
>  * Increase number of buffers in pool
>  * Keep a copy of the negotiated v4l2 format
>  * Change NV12 buffer to use one plane instead of two
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> index e0fb640..d33b646 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
>  require gstreamer1.0-plugins-ti.inc
>  
> -PR = "${INC_PR}.14"
> -SRCREV = "6ec1a9c9fc17e0cae781aed067a2a6f2c1f92d68"
> +PR = "${INC_PR}.15"
> +SRCREV = "4fe4beaa1498e27878bf04020aef0099c17f2262"
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

