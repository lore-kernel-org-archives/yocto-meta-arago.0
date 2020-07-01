Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A53DA52A1C
	for <meta-arago@arago-project.org>;
	Wed,  1 Jul 2020 17:28:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 061HQAnW105121
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 12:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593624370;
	bh=K604buEM/tS/8Y3g/21YW3n+MLFONwTyTcbBBGTLKFE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IABcKzpEejEeyTBIE1apZPabBoZRKDZC/ZMyNi/pW7BqT+2B+hMqe8ttktKfrsQAY
	o1Y5Chikpvo8ewFkgyIfiSaztoj104n9cJsKSRcIkSmte16KDoQBLfSX1oFbZme7IQ
	Iqz7U+bbIXEmgNs0k1BtRaAd2censQDzuiGx9l5o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 061HQAG4129291
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 12:26:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 1 Jul 2020 12:26:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 1 Jul 2020 12:26:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 061HQA5Y011832;
	Wed, 1 Jul 2020 12:26:10 -0500
Date: Wed, 1 Jul 2020 13:26:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <prao@ti.com>
Message-ID: <20200701172609.GC15879@beryl>
References: <20200630232631.27654-1-prao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200630232631.27654-1-prao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: .master/dunfell] recipes-tisdk: ti-tisdk-makefile: Fix Makefile for sysfw-image
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
X-List-Received-Date: Wed, 01 Jul 2020 17:28:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks fine, but can you please fix the commit log, specifically prefix:
.master/dunfell]


On Tue, Jun 30, 2020 at 06:26:31PM -0500, prao@ti.com wrote:
> From: Praveen Rao <prao@ti.com>
> 
> The sysfw-image name changed from system-firmware-image to k3-image.
> Fix the Makefile to reflect this update.
> 
> Signed-off-by: Praveen Rao <prao@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> index ab7ff727..a6e6f866 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> @@ -32,14 +32,14 @@ sysfw-image: linux-dtbs
>  	@echo =============================
>  	@echo    Building SYSFW Image
>  	@echo =============================
> -	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; \
> +	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; \
>  		make $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
>  
>  sysfw-image_clean:
>  	@echo =============================
>  	@echo    Cleaning SYSFW Image
>  	@echo =============================
> -	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; make clean
> +	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; make clean
>  
>  sysfw-image_install:
>  	@echo =============================
> -- 
> 2.17.1
> 

