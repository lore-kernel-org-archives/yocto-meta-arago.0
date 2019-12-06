Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0E33352A6B
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 01:08:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB617K4R025908;
	Thu, 5 Dec 2019 19:07:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575594440;
	bh=swkfFH5OYLL/Rv4b+N6thzrMns3dh29Qoet0Hhm3Gls=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Eb9O8S8/qpYgZ2O4wtvemTTf/BYmHQhryYnNLUw654r1YnmZbrQUgr1VI1x9LNCrO
	dCA/Hw5UAUXYP8v/S9Vxp0HiKqxj91pB/FJRSkutH8RXBywJNV/1/6uz2d/TlV/LID
	c32R34mEG6Dxj6XqYdMs2VV76duTEZ0wDA5FTT6Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB617K0s019368;
	Thu, 5 Dec 2019 19:07:20 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Dec 2019 19:07:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Dec 2019 19:07:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB617Jib033363;
	Thu, 5 Dec 2019 19:07:19 -0600
Date: Thu, 5 Dec 2019 20:07:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hari Nagalla <hnagalla@gmail.com>
Message-ID: <20191206010719.GS24609@beryl>
References: <20191205191635.7598-1-hnagalla@gmail.com>
	<20191205191635.7598-2-hnagalla@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191205191635.7598-2-hnagalla@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ 1/1] use wireless-regdb-static for > K4.15 kernels
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
X-List-Received-Date: Fri, 06 Dec 2019 01:08:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 05, 2019 at 01:16:35PM -0600, Hari Nagalla wrote:
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb     | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 21dc6d0f..24401815 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -14,7 +14,7 @@ WLAN_COMMON = "\
>      softap-udhcpd-config \
>      eventdump \
>      wlconf \
> -    wireless-regdb \
> +    wireless-regdb-static \
>      linux-firmware-iwlwifi-8000c \
>      linux-firmware-iwlwifi-8265 \
>      linux-firmware-iwlwifi-3160-17 \
> @@ -45,7 +45,6 @@ BT_COMMON = "\
>  "
>  
>  BT_TI = "\
> -    uim \

Which branch are you using? Package uim has been renamed already some time 
ago. Please fix and re-submit. Thanks.

-- 
Denys

>      bt-enable \
>      bt-fw \
>  "
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

