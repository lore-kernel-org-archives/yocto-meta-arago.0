Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B2AE352982
	for <meta-arago@arago-project.org>;
	Fri, 24 Aug 2018 20:32:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OKWU5t039731
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 15:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535142750;
	bh=yVqzC9HD9Oj1eQnz84+N9bB8pmKN/4vI9VUYHFGQSjs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QfUwQwzLrVxelhKxKCx26paa0tV53lBwHsPxKTbWcF5rMqwI4DsBtl2XxTGV/w/3D
	ApHFFWr+BV07Ufz0hS8h32K9C/xpcrd2lPgRqaW2S/YoXb+Mz1hoFG7o/ZqMda2qyT
	7LZakwTRxm2cB1x54tavcgjwk8PbCbyVZKPJgTtA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKWTNU014733
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 15:32:29 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 15:32:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 15:32:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKWTan007518;
	Fri, 24 Aug 2018 15:32:29 -0500
Date: Fri, 24 Aug 2018 16:31:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180824203136.GD9228@beryl>
References: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
	<1535138718-6772-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1535138718-6772-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/4] packagegroup-*-sdk-host: k3: add missing sources
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
X-List-Received-Date: Fri, 24 Aug 2018 20:32:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 24, 2018 at 03:25:16PM -0400, Jacob Stiffler wrote:
> Add:
> * cryptodev-module-src
> * matrix-gui-browser

Changelog says "add matrix-gui-browser", but it doesn't seem to correspond to 
the actual change made below.


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb          | 3 ++-
>  .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb          | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> index 59593e8..e87d8c2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install crypto sources in SDK"
>  LICENSE = "MIT"
> -PR = "r10"
> +PR = "r11"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -16,6 +16,7 @@ CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
>  CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
>  CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
>  CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-src"
> +CRYPTO_RDEPENDS_append_k3 = " cryptodev-module-src"
>  
>  RDEPENDS_${PN} = "\
>      ${CRYPTO_RDEPENDS} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
> index 078adab..11355fc 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
>  LICENSE = "MIT"
> -PR = "r6"
> +PR = "r7"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -13,7 +13,6 @@ MATRIX_GUI = " \
>  
>  MATRIX_GUI_keystone = ""
>  MATRIX_GUI_omapl138 = ""
> -MATRIX_GUI_k3 = ""
>  
>  RDEPENDS_${PN} = "\
>      matrix-gui-src \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

