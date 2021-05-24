Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 267A2529A5
	for <meta-arago@arago-project.org>;
	Mon, 24 May 2021 11:42:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OBgtJk085209
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 06:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621856575;
	bh=Pp4UCL+bMJ1svwRNuKzlCEsv/q68o6MHNeskIABWEEY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YyrHQ7oF1MscXWhbGH5nSTW4drxsymoxT5jIB7DxPtgvhxETQxoc7buHCHYju6U0j
	J+jpJDqGkPPvuNtEvyf2SU/jmhNGKEYlW8tc1Y/6xdmeGJRb8PvPVEE8+DBkQeG6wp
	EUCUPzZBiOAOQyANrl3rE1xqN37DhnQAUZrqaLY0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OBgtv9012473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 06:42:55 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 24 May 2021 06:42:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 24 May 2021 06:42:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OBgsqq070613;
	Mon, 24 May 2021 06:42:55 -0500
Date: Mon, 24 May 2021 06:42:54 -0500
From: Nishanth Menon <nm@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20210524114254.ref3c3rdvdw3gi25@prepay>
References: <20210524095203.13658-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210524095203.13658-1-nikhil.nd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, shyam.jagannathan@ti.com
Subject: Re: [dunfell/master][PATCH] packagegroups: arago-tisdk-addons: Add packages to allow building on target
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
X-List-Received-Date: Mon, 24 May 2021 11:42:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:22-20210524, Nikhil Devshatwar wrote:
> Add packages in the tisdk-addons which allows to build Gstreamer and
> other GST based demo applications from the target filesystem.
> 
> All these are open source packages, recipes for which are already
> present in upstream layers.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 287cba63..2c3fff5c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r79"
> +PR = "r80"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -67,7 +67,14 @@ UTILS_append_k3 = " mmc-utils \
>  UTILS_append_am64xx = " ti-rtos-firmware"
>  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>  UTILS_append_j7 = " ti-rtos-firmware"
> -UTILS_append_j7-evm = " pru-icss"
> +UTILS_append_j7-evm = " \
> +    pru-icss \
> +    cmake \
> +    libyaml \
> +    python3-pyyaml \
> +    boost \
> +    ninja \
> +"
>  UTILS_append_j7-hs-evm = " pru-icss"
>  
>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"


Should'nt we go the other direction of making the core layer thinner and
add the packages as part of the dependencies of what ever the demos we'd
want to add?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

