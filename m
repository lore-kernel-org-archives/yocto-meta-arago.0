Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DD1DE52988
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 23:33:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PNVlTw026274
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:31:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582673507;
	bh=jsYnJGff5GSJIpjc3pguT7qgwsGoiYbQ7H02PN2ErH4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iwcrC/06wpHr4rHene7jXsJVi7RtNDmaHZKKUirIdtX8FwklT8t2oS4N3A8OLNZcb
	MjWidcVitSGt5bpejg7grw+XemP2U2vwK9ISp5ojgJXkNHB4ybyXq94JU4w60WMhP0
	jQYMkGeDHqbIe5yV7SRddmheVvDtwlc1Nv5oFWvE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PNVlds128763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:31:47 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 25 Feb 2020 17:31:46 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 25 Feb 2020 17:31:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01PNVkkP025810; 
	Tue, 25 Feb 2020 17:31:46 -0600
Date: Tue, 25 Feb 2020 18:31:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20200225233146.GG22188@beryl>
References: <20200225231226.24898-1-a0271529@ti.com>
	<20200225231226.24898-3-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200225231226.24898-3-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master] [PATCH 3/3] packagegroup-arago-tisdk-addons: replace tensorflow-lite-examples with tensorflow-lite and add tensorflow-lite-demo
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
X-List-Received-Date: Tue, 25 Feb 2020 23:33:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 25, 2020 at 06:12:26PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons.bb             | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index a68662a7..2ed1abf7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r76"
> +PR = "r77"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -156,14 +156,16 @@ VOXEL_PACKAGES = ""
>  EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
> -                                tensorflow-lite-examples \
> +                                tensorflow-lite \
> +                                tensorflow-lite-demo \

tensorflow-lite-demo already depdens on tensorflow-lite - no need to 
explicitly pull both.


>                                  pdm-anomaly-detection \
>  "
>  
>  EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
> -                                tensorflow-lite-examples \
> +                                tensorflow-lite \
> +                                tensorflow-lite-demo \
>                                  pdm-anomaly-detection \
>  "
>  
> @@ -172,13 +174,15 @@ EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
>                                     big-data-ipc-demo-linux-firmware \
>                                     arm-compute-library \
>                                     ${ARMNN_PACKAGES} \
> -                                   tensorflow-lite-examples \
> +                                   tensorflow-lite \
> +                                   tensorflow-lite-demo \
>                                     pdm-anomaly-detection \
>  "
>  
>  EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
>                               ${ARMNN_PACKAGES} \
> -                             tensorflow-lite-examples \
> +                             tensorflow-lite \
> +                             tensorflow-lite-demo \
>                               pdm-anomaly-detection \
>  "
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

