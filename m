Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 97368529D6
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 18:47:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QIlKId018929
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 13:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498502840;
	bh=uWydxLGMgrA8CpMYI7aUEX/bfwdJd3kin5sVf2J0mnM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dYvKK9Cgv7scX7Mh2P+vGOytX2POv5jkX59TFX7pDCFvnhWsKMoDLcn2OMHC5sqQe
	J6KYXRLv+zLCbXCyzT3XvsFZkxp5DT1pQM+4VvgBtxBs5H1uo7SUGNtKFm7d0ABDHB
	GGmB3KN6iH6///HSMuAa9rQXQ0GZcdzXIINL3J0Y=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIlFIt001212
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 13:47:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 13:47:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIlFx0020156;
	Mon, 26 Jun 2017 13:47:15 -0500
Date: Mon, 26 Jun 2017 14:47:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170626184713.GD14665@edge>
References: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
	<1498498997-30316-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1498498997-30316-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v3 2/2] arago-tisdk-addons: Add big-data-ipc-demo for host linux
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
X-List-Received-Date: Mon, 26 Jun 2017 18:47:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 26, 2017 at 01:43:17PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index c623b37..360890b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r60"
> +PR = "r61"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -119,7 +119,10 @@ EXTRA_PACKAGES_omapl138 = " \
>  
>  EXTRA_PACKAGES_append_ti33x = " voxelsdk"
>  EXTRA_PACKAGES_append_ti43x = " voxelsdk"
> -EXTRA_PACKAGES_append_omap-a15 = " voxelsdk"
> +EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
> +                                   big-data-ipc-demo-linux \
> +                                   big-data-ipc-demo-linux-firmware \
> +"

I only see you are adding it for omap-a15, but not keystone - on purpose?


>  EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
>  EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

