Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C304152972
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:19:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NIwmh007521
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:18:58 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NIvLF026432
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:18:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 18:18:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NIvQQ026841;
	Wed, 6 Aug 2014 18:18:57 -0500
Date: Wed, 6 Aug 2014 19:18:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140806231856.GO23523@edge>
References: <1407361067-25558-1-git-send-email-fcooper@ti.com>
	<1407361067-25558-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407361067-25558-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] packagegroup-arago-tisdk-qte: Pull in more Qt 5 example applications
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
X-List-Received-Date: Wed, 06 Aug 2014 23:19:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, Aug 06, 2014 at 04:37:47PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> index e745a08..c7e63ab 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add Qt embedded related packages"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
>  
>  inherit packagegroup
>  
> @@ -15,6 +15,10 @@ QT4_DEMOS = "\
>  QT5_DEMOS = "\
>      qtwayland-examples \
>      qtwebkit-examples-examples \
> +    qtdeclarative-examples \
> +    qtmultimedia-examples \
> +    qtbase-examples \
> +    qt3d-examples \
>  "
>  
>  QT_DEMOS = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

