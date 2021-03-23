Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4B2FA5299C
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E8AC40BFF;
	Tue, 23 Mar 2021 16:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Sdsv0BJqVmzb; Tue, 23 Mar 2021 16:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F1DB3400CF;
	Tue, 23 Mar 2021 16:37:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9EE4A174558; Tue, 23 Mar 2021 12:37:06 -0400 (EDT)
Date: Tue, 23 Mar 2021 12:37:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: praneeth@ti.com
Message-ID: <20210323163706.GL18041@denix.org>
References: <20210323160239.22613-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210323160239.22613-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: Re: [dunfell PATCH] layer.conf: remove releases before dunfell as compatible
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
X-List-Received-Date: Tue, 23 Mar 2021 16:36:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 11:02:39AM -0500, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> This follows commit 00eb3341 ("layer.conf: remove releases
> before dunfell as compatible") from meta-ti.
> 
> removing older than dunfell releases.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/conf/layer.conf | 2 +-
>  meta-arago-extras/conf/layer.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 2931bf9d..9abd5eee 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-distro = "dunfell"
>  
>  LAYERDEPENDS_meta-arago-distro = " \
>      core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 7e3081b2..3c33bc37 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-extras = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-extras = "dunfell"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> -- 
> 2.17.1

