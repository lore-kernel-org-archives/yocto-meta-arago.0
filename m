Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9C2B052979
	for <meta-arago@arago-project.org>;
	Mon,  1 May 2017 22:20:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41MKXia012395
	for <meta-arago@arago-project.org>; Mon, 1 May 2017 17:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493677233;
	bh=uhtC2EVAKhkVcCjysZr3cZTAsnjaSwf9fApZuUCmhFY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=a9YPj/SnDj7oF/eC58ISolrSZm27j9/N97iqVQvVil026BE3m3UW30hcayJUJOrgb
	eK9m02ZNdluc9t0EBlBkCOTlKA6/MFeXTagkZz/qVKUVYW1HePQduIB4uIlTK/0myH
	UlsgE9H8zU1ovu1a6K/6Z461k4WsMXhXne8EihLo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41MKXnf024244
	for <meta-arago@arago-project.org>; Mon, 1 May 2017 17:20:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 17:20:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41MKXLQ028971;
	Mon, 1 May 2017 17:20:33 -0500
Date: Mon, 1 May 2017 18:20:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170501222032.GY31608@edge>
References: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v3 1/2] arago-tisdk-addons: Add ti-ipc-rtos-fw for omapl138
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
X-List-Received-Date: Mon, 01 May 2017 22:20:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

I will take patch #1 here, so it gets into 2017.01-rc2 build tonight. Patch #2 
still has some comments.


On Fri, Apr 28, 2017 at 04:20:23PM -0400, Sam Nelson wrote:
> Adds ipc rtos test binaries
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous patch
> Fix error with quotes
> ---
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 5ad6655..9ed9bc2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -57,6 +57,8 @@ UTILS_append_omap-a15 = " mmc-utils \
>                            uio-module-drv-test \
>  "
>  
> +UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> +
>  UTILS_append_dra7xx = " canutils \
>                          dsptop \
>                          gdbc6x \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

