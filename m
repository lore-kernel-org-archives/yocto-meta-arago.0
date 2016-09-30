Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 51ABE52996
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 16:42:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8UGgXRh031415
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 11:42:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGgWjj005461
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 11:42:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Sep 2016 11:42:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGgVIK030857;
	Fri, 30 Sep 2016 11:42:31 -0500
Date: Fri, 30 Sep 2016 12:42:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pooja Prajod <a0132412@ti.com>
Message-ID: <20160930164231.GS7475@edge>
References: <1475248169-26535-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
In-Reply-To: <1475248169-26535-1-git-send-email-a0132412@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [V2] omapdrmtest: Update-SRCREV
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
X-List-Received-Date: Fri, 30 Sep 2016 16:42:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please briefly mention what this update fixes or enhances?

On Fri, Sep 30, 2016 at 08:39:29PM +0530, Pooja Prajod wrote:
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index a625e25..e219170 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
>  
>  inherit autotools pkgconfig
>  
> -PR = "r16"
> -SRCREV = "c3f20b080571f5f363bfb7e0956b6c56004004f8"
> +PR = "r18"
> +SRCREV = "e4a2932a836c54f4a20b4be9d541d11d3a246a31"
>  
>  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
>  "
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

