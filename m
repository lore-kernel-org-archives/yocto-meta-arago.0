Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0DBA05296D
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:18:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s76NImWk029086
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:18:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NImbS026360
	for <meta-arago@arago-project.org>; Wed, 6 Aug 2014 18:18:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 18:18:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s76NImrG009627;
	Wed, 6 Aug 2014 18:18:48 -0500
Date: Wed, 6 Aug 2014 19:18:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140806231847.GN23523@edge>
References: <1407361067-25558-1-git-send-email-fcooper@ti.com>
	<1407361067-25558-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407361067-25558-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] packagegroup-arago-qte: Pull in Qt3D when using Qt 5
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
X-List-Received-Date: Wed, 06 Aug 2014 23:19:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, Aug 06, 2014 at 04:37:46PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-qte.bb        |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> index b2dd546..7e00a55 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add Qt embedded related packages"
>  LICENSE = "MIT"
> -PR = "r5"
> +PR = "r6"
>  
>  inherit packagegroup
>  
> @@ -32,6 +32,7 @@ QT5_ESSENTIALS = "\
>      qtlocation-plugins \
>      qtmultimedia-plugins \
>      qtwayland-plugins \
> +    qt3d \
>  "
>  
>  RDEPENDS_${PN} = "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

