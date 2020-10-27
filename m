Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DB12E52999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 02:48:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2jXFY096741
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766733;
	bh=bQzE3pdjOcgel7kxgTLbp6o/DhK5Jv4a6HS6nz4qy6U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZEhjNsbmhvBoI6gH5wImD/Mtl3XeYgmxV+Ov2MN21xV9qt5s4DBuWvaP75USUrFWs
	DD/QBLjLQqLGnG4EbewdZjzm930cGl+rL9j9cB0byNN3A5A9xLlhBM7LSBUBMYo5wP
	y5Kwt7G67c/CQz6cVt2KLpINYb3f07SUoIMugCbw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2jXMv082462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:45:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 21:45:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 21:45:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2jX35017811;
	Mon, 26 Oct 2020 21:45:33 -0500
Date: Mon, 26 Oct 2020 22:45:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20201027024533.GR19741@beryl>
References: <20201027024112.5330-1-s-anna@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201027024112.5330-1-s-anna@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Tue, 27 Oct 2020 02:48:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 26, 2020 at 09:41:12PM -0500, Suman Anna wrote:
> Add the ti-rpmsg-char dev packages to make the public headers available in
> the target fileystem so that applications can be compiled natively on the
> target.

-sdk-target is not for the target filesystem!
It is for the target sysroot in the devkit.


> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index e372dd67744e..b55c79a4d4df 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
>  LICENSE = "MIT"
> -PR = "r43"
> +PR = "r44"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -143,7 +143,11 @@ UTILS_append_dra7xx = " can-utils-dev \
>                          elfutils-staticdev \
>  "
>  UTILS_append_k2g = " can-utils-dev"
> -UTILS_append_k3 = " can-utils-dev"
> +UTILS_append_k3 = "\
> +	can-utils-dev \
> +	ti-rpmsg-char-dev \
> +	ti-rpmsg-char-staticdev \
> +"
>  
>  EXTRA_LIBS = ""
>  EXTRA_LIBS_append_ti43x = "\
> -- 
> 2.28.0
> 

