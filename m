Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4AB925297D
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2020 15:41:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088FcmoN065561
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 10:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599579528;
	bh=J7Tf3cpo4z8zsj9oEE66L+XvrXrmEgRwxaF3JlQP9vQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RXD4cnCRDZppkw2tTbn3cKpJ7gsAv1x8TqA9r9bhT1tkm3fIO8R1H9VVvZtmYzANU
	y7MiNQ7gA1IOsckZR3XrkeS25ubd1fubkGrpVNtJSoVEj5p6T7vjTEKT2Rtr+aao50
	+zf4Ae6jXui3eSHr2UJGHf+Bd7BGt28QUGi4HQWw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088Fcmfq126653
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 10:38:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 8 Sep 2020 10:38:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 8 Sep 2020 10:38:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088FclX9004362;
	Tue, 8 Sep 2020 10:38:48 -0500
Date: Tue, 8 Sep 2020 11:38:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Subhajit Paul <a0132170@ti.com>
Message-ID: <20200908153847.GB1562@beryl>
References: <20200907063717.20038-1-a0132170@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200907063717.20038-1-a0132170@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH] tisdk-default-image: add opencv
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
X-List-Received-Date: Tue, 08 Sep 2020 15:41:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK!

This is wrong on so many levels...
It adds individual packages directly to the image, not a packagegroup.
It adds those packages to all platforms, regardless of the support.
It adds development packages to the rootfs, which would bring tons of 
dependencies, especially to low-level platforms with limited resources.
If this is needed for a specific Product Line, please add it there, not to 
CoreSDK.

-- 
Denys


On Mon, Sep 07, 2020 at 12:07:17PM +0530, Subhajit Paul wrote:
> Signed-off-by: Subhajit Paul <a0132170@ti.com>
> ---
>  .../images/tisdk-default-image.bb             | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index ce4287ae..3b3a61b5 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -24,6 +24,43 @@ IMAGE_INSTALL += "\
>      ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
>      ti-analytics \
>      ti-demos \
> +    python3-opencv \
> +    libopencv-aruco-dev \
> +    libopencv-bgsegm-dev \
> +    libopencv-bioinspired-dev \
> +    libopencv-calib3d-dev \
> +    libopencv-ccalib-dev \
> +    libopencv-core-dev \
> +    libopencv-face-dev \
> +    libopencv-features2d-dev \
> +    libopencv-flann-dev \
> +    libopencv-fuzzy-dev \
> +    libopencv-hfs-dev \
> +    libopencv-highgui-dev \
> +    libopencv-img-hash-dev \
> +    libopencv-imgcodecs-dev \
> +    libopencv-imgproc-dev \
> +    libopencv-line-descriptor-dev \
> +    libopencv-ml-dev \
> +    libopencv-objdetect-dev \
> +    libopencv-optflow-dev \
> +    libopencv-photo-dev \
> +    libopencv-plot-dev \
> +    libopencv-quality-dev \
> +    libopencv-reg-dev \
> +    libopencv-rgbd-dev \
> +    libopencv-saliency-dev \
> +    libopencv-sfm-dev \
> +    libopencv-shape-dev \
> +    libopencv-stitching-dev \
> +    libopencv-structured-light-dev \
> +    libopencv-surface-matching-dev \
> +    libopencv-tracking-dev \
> +    libopencv-video-dev \
> +    libopencv-videoio-dev \
> +    libopencv-xfeatures2d-dev \
> +    libopencv-ximgproc-dev \
> +    libopencv-xphoto-dev \
>  "
>  
>  export IMAGE_BASENAME = "tisdk-default-image"
> -- 
> 2.17.1
> 

