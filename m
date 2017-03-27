Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2569D529E6
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 19:06:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RJ6p1K003023
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 14:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490641611;
	bh=welWr0tKMT7n3cDDug6MC5Q69BiGvVnODtGUQK4EPEM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wAgq4tpt8flgiINUN6AE+27jYdNflTkncuFo53m4y0oLdbR4SQv/K0wWm0zMYSv9p
	EjLQKzqBKgdG9EkDhoxwHGWLo8xq95SRErs33uX6Sq30QqeGC6Z/XKNNW95g6If8BI
	CdRQJfwKv6ggRTb5Sbydu4l+xCbKrZJ+DCwSGFpI=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RJ6oXp009524
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 14:06:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 14:06:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RJ6o6F019987;
	Mon, 27 Mar 2017 14:06:50 -0500
Date: Mon, 27 Mar 2017 15:06:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170327190649.GF29187@edge>
References: <1490640205-1304-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490640205-1304-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Djordje Senicic <d-senicic1@ti.com>
Subject: Re: [morty/krogoth][PATCH v2] opencv: bump SRCREV to pick up enhancement and bug fix
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
X-List-Received-Date: Mon, 27 Mar 2017 19:06:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for sending v2 - merging it now.


On Mon, Mar 27, 2017 at 02:43:25PM -0400, Hongmei Gou wrote:
> * Two more kernels are added for OpenCL DSP offload: minmax and absdiff
> 
> * Change priority of gstreamer videoconvert plugin so that it can be
>   selected over autovideoconvert. This is to address the decoding
>   issue with test clip 768x576.avi.
> 
> Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> V2 changes:
> * Update commit message to describe the changes picked up by the new commit id
> 
>  meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> index eea040f..bcfd8dd 100644
> --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> +++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> @@ -1,4 +1,4 @@
> -PR = "r2"
> +PR = "r3"
>  
>  BRANCH = "tiopencvrelease_3.1"
>  
> @@ -11,7 +11,7 @@ SRC_URI_append += "\
>       file://setupEnv.sh \
>  "
>  
> -SRCREV_opencv = "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"
> +SRCREV_opencv = "ffb1eb48afbb1888670f461135c023dcdb6c9aca"
>  
>  DEPENDS_remove_keystone = "qtbase"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

