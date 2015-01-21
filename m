Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 99EF65297F
	for <meta-arago@arago-project.org>;
	Wed, 21 Jan 2015 18:50:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LIojcB006594
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 12:50:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LIojHT020894
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 12:50:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 12:50:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LIojug013667;
	Wed, 21 Jan 2015 12:50:45 -0600
Date: Wed, 21 Jan 2015 13:50:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150121185044.GC21328@edge>
References: <1421857781-32763-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421857781-32763-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] nativesdk-qt4-tools: Add -no-pch to configure to fix build errors
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
X-List-Received-Date: Wed, 21 Jan 2015 18:50:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 21, 2015 at 10:29:41AM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Nativesdk-qt4-tools has been failing with many errors similar to the ones
>   below :
> 
>   <long path>/stdc-predef.h:59:1: error: use -Winvalid-pch for more information
>   <long path>/stdc-predef.h:59:1: fatal error:
>                 .pch/release-static-emb-auto/QtCore: No such file or directory

I've seen this issue intermittently, but it usually goes away on a consecutive 
clean build. Do you see the same issue with target Qt build as well, or only 
with nativesdk-tools?


> * Based on http://qt-project.org/forums/viewthread/26781 and looking at the
>   main Qt 4 recipe this error can be fixed by disabling pch by passing -no-pch
>   to configure.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../qt4/nativesdk-qt4-tools_4.8.5.bbappend         |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> index 6296fbe..8391cdd 100644
> --- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> @@ -1,7 +1,9 @@
> -PR_append = "-arago2"
> +PR_append = "-arago3"
>  
>  # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
>  # For our distribution purposes we only use LGPLv2.1
>  LICENSE = "LGPLv2.1"
>  
>  DEPENDS := "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
> +
> +EXTRA_OECONF += " -no-pch"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

