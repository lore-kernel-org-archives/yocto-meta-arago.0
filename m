Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AC81B5299C
	for <meta-arago@arago-project.org>;
	Thu, 25 Mar 2021 16:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3042640C29;
	Thu, 25 Mar 2021 16:09:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id etmXMG7LBEVF; Thu, 25 Mar 2021 16:09:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 059E540952;
	Thu, 25 Mar 2021 16:09:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4AC37174558; Thu, 25 Mar 2021 12:09:53 -0400 (EDT)
Date: Thu, 25 Mar 2021 12:09:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210325160953.GR18041@denix.org>
References: <20210324191522.23836-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210324191522.23836-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: Re: [dunfell/master][PATCH] arago.conf: enable examples pkg for qtdeclarative
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
X-List-Received-Date: Thu, 25 Mar 2021 16:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 02:15:22PM -0500, Gowtham Tammana wrote:
> qtdeclarative-examples package was disabled due to build issues.
> Reenable it as there are no build issues now.

Does it work for you? It still seems to break for me.
I guess Praneeth can throw it on the build farm to try...


> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 7c702814..3c715447 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -125,7 +125,7 @@ PACKAGECONFIG_append_pn-qtmultimedia = " gstreamer"
>  
>  # Add examples in Qt5 package configurations
>  PACKAGECONFIG_append_pn-qtcharts = " examples"
> -#PACKAGECONFIG_append_pn-qtdeclarative = " examples"
> +PACKAGECONFIG_append_pn-qtdeclarative = " examples"
>  PACKAGECONFIG_append_pn-qtlocation = " examples"
>  PACKAGECONFIG_append_pn-qtmultimedia = " examples"
>  PACKAGECONFIG_append_pn-qtscript = " examples"
> -- 
> 2.31.0

