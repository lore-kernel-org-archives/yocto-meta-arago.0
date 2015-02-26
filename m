Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 41788529CB
	for <meta-arago@arago-project.org>;
	Thu, 26 Feb 2015 16:59:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QGxirt002299
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 10:59:44 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QGxhXf028190
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 10:59:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 10:59:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QGxhHA006661;
	Thu, 26 Feb 2015 10:59:43 -0600
Date: Thu, 26 Feb 2015 11:59:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150226165942.GD6052@edge>
References: <1424898335-24940-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424898335-24940-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-mcsdk: Add opengl to mcsdk DISTRO_FEATURES
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
X-List-Received-Date: Thu, 26 Feb 2015 16:59:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 25, 2015 at 04:05:35PM -0500, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../conf/distro/include/branding-mcsdk.inc         |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> index 9fca5af..238b803 100644
> --- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> @@ -3,7 +3,7 @@
>  # Use the MCSDK supported versions
>  PREFERRED_VERSION_libnl = "3.2.24"
>  
> -DISTRO_FEATURES += "x11"
> +DISTRO_FEATURES += "x11 opengl"

Reason?


>  # Java preferences.
>  PREFERRED_VERSION_icedtea7-native = "2.1.3"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

