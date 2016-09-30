Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7282052996
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 16:49:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8UGngL7014971
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 11:49:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGnf6J011391
	for <meta-arago@arago-project.org>; Fri, 30 Sep 2016 11:49:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Sep 2016 11:49:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGneve004814;
	Fri, 30 Sep 2016 11:49:40 -0500
Date: Fri, 30 Sep 2016 12:49:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pooja Prajod <a0132412@ti.com>
Message-ID: <20160930164940.GU7475@edge>
References: <1475162931-5956-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
In-Reply-To: <1475162931-5956-1-git-send-email-a0132412@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: omapdrmtest: Update SRCREV to c3f20b080571f5
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
X-List-Received-Date: Fri, 30 Sep 2016 16:49:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Would be nice to mention what gets fixed, if this update is specifically to 
fix a bug...

On Thu, Sep 29, 2016 at 08:58:51PM +0530, Pooja Prajod wrote:
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index b086379..a625e25 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
>  
>  inherit autotools pkgconfig
>  
> -PR = "r15"
> -SRCREV = "a30dd9a5fc1ae7cdfb8c17a4685efb7eaf693ddc"
> +PR = "r16"
> +SRCREV = "c3f20b080571f5f363bfb7e0956b6c56004004f8"
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

