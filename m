Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 92FFD52A8E
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 03:06:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2336W9K026876;
	Thu, 2 Mar 2017 21:06:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488510392;
	bh=QyraGBpG/fWLTns03aOGN56OysBVHtW79IiUPfg2EMM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sI0kGEgdSG4pLSYqZjdEN/RXowQclJkn9GKCxXiKXCnOrXRU9QPpXoGD57rclvVXu
	wkNvFhr8P1Zh/F+qNo5OFJUkgVC+sfnXUBq6VSvY84kw+NIhRTCaM7L5pPZvHDjiNV
	y1POLAu9BlXjQASXrW74HJMO5s1F5HzaHgTGZmuI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2336Wk6004603;
	Thu, 2 Mar 2017 21:06:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 21:06:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2336VPB018511;
	Thu, 2 Mar 2017 21:06:31 -0600
Date: Thu, 2 Mar 2017 22:06:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170303030630.GE12614@edge>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
	<1488509945-12853-6-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1488509945-12853-6-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH 05/12] packagegroup-*-connectivity: crda was blacklisted upstream for breakage
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
X-List-Received-Date: Fri, 03 Mar 2017 03:06:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should probably use "HACK:" prefix to easily spot in the future.

On Thu, Mar 02, 2017 at 09:58:58PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb             | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index f64998c..f870102 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -6,6 +6,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> +# Disabled in master:
> +#    crda
>  # WLAN support packages.
>  # These are the packages that all platforms use for WLAN support
>  WLAN_COMMON = "\
> @@ -18,7 +20,6 @@ WLAN_COMMON = "\
>      eventdump \
>      wlconf \
>      wpa-supplicant-wl18xx \
> -    crda \
>      hostap-daemon-wl18xx \
>      ti-wifi-utils-wl18xx \
>      wl18xx-target-scripts \
> -- 
> 2.7.4
> 

