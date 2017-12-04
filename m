Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0DB6852A27
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 19:54:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4JsD76031601
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:54:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512417253;
	bh=27VPnQrCn3JSiu4NmrgSjFzYh3cImhPjTSKcpy90kvM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m1qvsT5wTVdS7G6nBORYIXgBRhxYvg1zFYWgMoUo14l8FmQoga8u0/UpQDDEiwG1y
	/W7Gy4ow12SeUiGEvJxTb3DDXH5PrIYRoC7ox/mU/E0thkbKGTgsFhcxJV2dTV7AbB
	UutQAkylvN4PZM8nnWzmuEfjrPC15QUqzcb7nEm8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4Js8Au018410
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:54:08 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 13:54:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 13:54:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4Js7VC031488;
	Mon, 4 Dec 2017 13:54:08 -0600
Date: Mon, 4 Dec 2017 14:53:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20171204195352.GD15340@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B364A85BA@DFRE01.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B364A85BA@DFRE01.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] wpa-supplicant-wl18xx: update recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 19:54:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Dec 03, 2017 at 05:38:39AM -0500, Reizer, Eyal wrote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-wl18xx.bb              | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> index 9e98080..1b3b8d0 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> @@ -4,19 +4,19 @@
>  require wpa-supplicant.inc
>  
>  LICENSE = "GPLv2 | BSD"
> -LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880 \
> -                    file://../README;md5=7f393579f8b109fe91f3b9765d26c7d3 \
> -                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8a3131126465e08eb6b8d17ea880e162"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=292eece3f2ebbaa25608eed8464018a3 \
> +                    file://../README;md5=3f01d778be8f953962388307ee38ed2b \
> +                    file://wpa_supplicant.c;beginline=1;endline=17;md5=35e6d71fea6b15f61a9fac935bcf410f"

Why did license checksums change? If those are valid changes, please provide 
explanantion in the commit log. Thanks!


>  FILESEXTRAPATHS_append := ":${THISDIR}/wpa-supplicant"
>  
> -# Tag: R8.6
> -SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
> -BRANCH = "upstream_24"
> -PR_append = "a"
> +# Tag: R8.7_SP3
> +SRCREV = "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
> +BRANCH = "upstream_25_rebase"
> +PR_append = "b"
>  
>  # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
> -PV = "R8.6-devel-ti+git${SRCPV}"
> +PV = "R8.7_SP3-devel-ti+git${SRCPV}"
>  
>  PROVIDES += "wpa-supplicant"
>  RPROVIDES_${PN}  += "wpa-supplicant"
> -- 
> 2.7.4
> 

