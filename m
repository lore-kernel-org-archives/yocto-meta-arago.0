Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0EA265299C
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 16:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB78440BFF;
	Tue, 23 Mar 2021 16:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JJOlKJYBq169; Tue, 23 Mar 2021 16:42:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C14CB400CF;
	Tue, 23 Mar 2021 16:42:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 86688174558; Tue, 23 Mar 2021 12:42:43 -0400 (EDT)
Date: Tue, 23 Mar 2021 12:42:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210323164243.GM18041@denix.org>
References: <20210323145133.9940-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210323145133.9940-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH] layer.conf: Add hardknott to compatible release branches
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
X-List-Received-Date: Tue, 23 Mar 2021 16:42:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2021 at 09:51:33AM -0500, Nishanth Menon wrote:
> This follows commit cfe3f78 ("layer.conf: add hardknott to compatible
> release branches") from meta-ti.
> 
> While we are at it, remove old releases before dunfell as we no longer
> support the build of such configurations.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> WARNING: there is a bunch of work to do to move to gatesgarth /
> hardknott .. https://pastebin.ubuntu.com/p/kKCqXvnDKf/
> 
> but this allows us to get started, I think.

Well, it's kind of premature to mark meta-arago as compatible yet...
Unlike meta-ti, which by itself builds fine with latest releases up to 
master, meta-arago is rather dunfell-specific, unfortunately.

Let me dust off my arago/master tree - I had bunch of fixes lined up there.


>  meta-arago-distro/conf/layer.conf | 2 +-
>  meta-arago-extras/conf/layer.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 2931bf9daf4a..1fa61207fe01 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-distro = "dunfell gatesgarth hardknott"
>  
>  LAYERDEPENDS_meta-arago-distro = " \
>      core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 7e3081b20ba8..d64a80f8890f 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-extras = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-extras = "dunfell gatesgarth hardknott"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> -- 
> 2.31.0
> 

