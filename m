Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 05915529B5
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 20:21:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6KJajJ002230;
	Fri, 6 Dec 2019 14:19:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575663576;
	bh=FcpzmpsHBEaIlv6ucjR8lrXPN30m0ss9Lt+ddWqAx9I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YDnNOhkHy479FnLeYI+AucFLpPwemSuyBSLVNc94YliDXLBhngHxmPbvpU2nsXybg
	B6LaIFY0K/PFWKYmJdr0Zy2yNcTBzHL07HgQ/Zt3hQ6YsJ6frOqfyubNAm1NypCetZ
	TByz+xE5a/KG4kZRzvcd+hw+GDN17ELl8E3JXeW4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6KJZVD091518
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2019 14:19:36 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Dec 2019 14:19:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Dec 2019 14:19:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6KJZOL049573;
	Fri, 6 Dec 2019 14:19:35 -0600
Date: Fri, 6 Dec 2019 15:19:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hari Nagalla <hnagalla@gmail.com>
Message-ID: <20191206201935.GX24609@beryl>
References: <20191206201639.18381-1-hnagalla@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191206201639.18381-1-hnagalla@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ 1/1] Use wireless-regdb-static for K4.15 and later
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
X-List-Received-Date: Fri, 06 Dec 2019 20:21:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, is "uim" still needed or not? In v1 you tried to remove it, but it got 
renamed to "uim-sysfs" to avoid confusion with other uim package. I'm just 
trying to see if we still need it or can simply drop the recipe from meta-ti.

Denys


On Fri, Dec 06, 2019 at 02:16:38PM -0600, Hari Nagalla wrote:
> ---
>  .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 72b72d6c..a44c4063 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -8,13 +8,13 @@ inherit packagegroup
>  
>  # WLAN support packages.
>  # These are the packages that all platforms use for WLAN support
> -# add wireless-regdb
> +# add wireless-regdb-static
>  WLAN_COMMON = "\
>      iw \
>      softap-udhcpd-config \
>      eventdump \
>      wlconf \
> -    wireless-regdb \
> +    wireless-regdb-static \
>      linux-firmware-iwlwifi-8000c \
>      linux-firmware-iwlwifi-8265 \
>      linux-firmware-iwlwifi-3160-17 \
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

