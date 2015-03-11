Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BB7B7529F8
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 17:02:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BH2itX029708
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 12:02:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BH2h9J011975
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 12:02:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 12:02:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BH2gXr024428;
	Wed, 11 Mar 2015 12:02:42 -0500
Date: Wed, 11 Mar 2015 13:02:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150311170242.GK22394@edge>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
	<1426074538-21653-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426074538-21653-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago 2/2] packagegroup-*-graphics: Deprecate bltsville
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
X-List-Received-Date: Wed, 11 Mar 2015 17:02:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, Mar 11, 2015 at 05:18:58PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-graphics.bb           |    6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index 1043ce5..4cb45dd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -41,13 +41,7 @@ GRAPHICS_RDEPENDS_omap-a15 = "\
>      omapdrm-pvr \
>      "
>  
> -GRAPHICS_BLTSVILLE = ""
> -GRAPHICS_BLTSVILLE_omap-a15 = " \
> -    bltsville   \
> -    "
> -
>  RDEPENDS_${PN} = "\
>      ${@base_conditional('QT_PROVIDER', 'qt4e', "", "${GRAPHICS_WESTON}", d)} \
>      ${GRAPHICS_RDEPENDS} \
> -    ${GRAPHICS_BLTSVILLE} \
>  "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

