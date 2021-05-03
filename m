Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2C23252C70
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B3FF40C56
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:12:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4cduXdNKPB48 for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:12:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF99340AB7
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:12:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AD0FE1745D3; Mon,  3 May 2021 17:12:56 -0400 (EDT)
Date: Mon, 3 May 2021 17:12:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-ID: <20210503211256.GD21867@denix.org>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1616534107-46438-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [dunfell/master][PATCH 1/4] chromium: apply bbappend with fix dynamically based on "browser-layer" presence
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
X-List-Received-Date: Mon, 03 May 2021 21:12:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

Any plans to merge this series?

Even though the config is disabled by default, it does some recipe cleanup and 
establishes dynamic layer dependency framework.


On Tue, Mar 23, 2021 at 05:15:04PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This solves the dangling bbappend warning when browser-layer is not enabled.
> 
> As chromium still requires Python2, corresponding meta-python2 layer is required.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-arago-distro/conf/layer.conf                                     | 4 ++++
>  .../chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch     | 0
>  .../recipes-browser/chromium/chromium-ozone-wayland_%.bbappend        | 0
>  3 files changed, 4 insertions(+)
>  rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch (100%)
>  rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend (100%)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 2931bf9..9014511 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -24,6 +24,10 @@ LAYERRECOMMENDS_meta-arago-distro = " \
>      browser-layer \
>  "
>  
> +BBFILES_DYNAMIC += " \
> +    browser-layer:${LAYERDIR}/dynamic-layers/browser-layer/recipes*/*/*.bbappend \
> +"
> +
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> similarity index 100%
> rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> similarity index 100%
> rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

