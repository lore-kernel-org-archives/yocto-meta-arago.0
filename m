Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7E81B52A8E
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 03:05:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2335LYX005365;
	Thu, 2 Mar 2017 21:05:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488510321;
	bh=nvWp5l/UdaXs/AZeEbAT0DbDXDW/vCFw5VYmD/ESroc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n8/g9sQ9WMJMfeIB7rapX5XvBeHGWl2xu9ihnjECUNF8w4sebrTGv+JIPvbRwOl2/
	Xt3Hm8wWGFHIIJDUsHvf1Dl1RVuk4p1nAdK1QHIINoCU/NCtD8OY2SatQF76/w9hJF
	sZau61lRCMDui76x7kEM2aUS3TLYDqA/oeWzlBEY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2335GmZ003415;
	Thu, 2 Mar 2017 21:05:16 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 21:05:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2335FN3032158;
	Thu, 2 Mar 2017 21:05:15 -0600
Date: Thu, 2 Mar 2017 22:05:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170303030514.GC12614@edge>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
	<1488509945-12853-10-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1488509945-12853-10-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH 09/12] packagegroup-*-qte: use qtdeclarative-qmlplugins instead of -plugins
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
X-List-Received-Date: Fri, 03 Mar 2017 03:05:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK.

On Thu, Mar 02, 2017 at 09:59:02PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> index 5030caa..2479af4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> @@ -28,7 +28,7 @@ QT4_ESSENTIALS = "\
>  
>  QT5_ESSENTIALS = "\
>      qtbase-plugins \
> -    qtdeclarative-plugins \
> +    qtdeclarative-qmlplugins \
>      qtdeclarative-qmlplugins \

^^^ this already has qmlplugins. Need to see why -plugins is no longer available...


>      qtlocation-plugins \
>      qtlocation-qmlplugins \
> -- 
> 2.7.4
> 

