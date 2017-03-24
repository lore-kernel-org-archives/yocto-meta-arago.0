Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1EEB252A34
	for <meta-arago@arago-project.org>;
	Fri, 24 Mar 2017 17:26:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2OHQtgH024946
	for <meta-arago@arago-project.org>; Fri, 24 Mar 2017 12:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490376415;
	bh=jTKcGZSbrVfRzFFRVROqyZhexTBf28w5GzjI11rJAH8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Bs+bpN2CBLDkH2N+P6qTg95JybjH+oOJuEQEKPujryUqdeRbMbpd1Zs7+IuQC7A6N
	ckX/6Y86+ZrqFekWSMRn3S22jFKVloDW7Q0j423EDlnKyaaBDa5pshTiK+1KalOIUC
	IwiGjfMFCIZtGwMbtbr8Cn6KY77B7JYdck9lqFFo=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2OHQtHM005999
	for <meta-arago@arago-project.org>; Fri, 24 Mar 2017 12:26:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 12:26:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2OHQtAH012284;
	Fri, 24 Mar 2017 12:26:55 -0500
Date: Fri, 24 Mar 2017 13:26:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170324172654.GI29187@edge>
References: <1490307847-23237-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490307847-23237-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/krogoth][PATCH] opencv: bump SRCREV
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
X-List-Received-Date: Fri, 24 Mar 2017 17:26:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please briefly mention the changes picked up by the new commit id.


On Thu, Mar 23, 2017 at 06:24:07PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
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

