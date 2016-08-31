Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id ED49252A7A
	for <meta-arago@arago-project.org>;
	Wed, 31 Aug 2016 23:35:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7VNZwx3024920
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 18:35:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VNZwWd012913
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 18:35:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 Aug 2016 18:35:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VNZwHi000572;
	Wed, 31 Aug 2016 18:35:58 -0500
Date: Wed, 31 Aug 2016 19:35:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160831233557.GV10236@edge>
References: <1472666993-16783-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1472666993-16783-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] openmpacc: add dev dependency on clacc
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
X-List-Received-Date: Wed, 31 Aug 2016 23:36:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack. I'll push outstanding patches tomorrow, after the release is out.

On Wed, Aug 31, 2016 at 02:09:53PM -0400, Jacob Stiffler wrote:
> * clacc is the openmpacc kernel compiler and is thus required when
>   developing with the openmpacc package.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> index 8fec0d1..a28a922 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> @@ -2,12 +2,13 @@ DESCRIPTION = "TI OpenMP-Acc host runtime and development packages"
>  
>  include openmpacc.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  inherit cmake
>  
>  DEPENDS = "boost boost-native opencl"
>  RDEPENDS_${PN} += "opencl-runtime"
> +RDEPENDS_${PN}-dev += "clacc"
>  
>  S = "${WORKDIR}/git/host"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

