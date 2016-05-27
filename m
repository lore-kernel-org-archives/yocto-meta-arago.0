Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id EBA6E52AE7
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 02:06:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4R26U9l027239
	for <meta-arago@arago-project.org>; Thu, 26 May 2016 21:06:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4R26UEY018851
	for <meta-arago@arago-project.org>; Thu, 26 May 2016 21:06:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 26 May 2016 21:06:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4R26Tsr013436;
	Thu, 26 May 2016 21:06:29 -0500
Date: Thu, 26 May 2016 22:06:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160527020613.GC14462@edge>
References: <1464262490-15361-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1464262490-15361-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston-conf: set default backend to drm-backend
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
X-List-Received-Date: Fri, 27 May 2016 02:06:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 26, 2016 at 05:04:50PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> index 615a604..4178ed3 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> @@ -1,3 +1,6 @@
> +[core]
> +backend=drm-backend.so

Isn't that the default?


>  [shell]
>  locking=false
>  animation=zoom
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

