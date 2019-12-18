Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D3C23529C0
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 21:00:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIKwxNY096200
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:58:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576702739;
	bh=A2ytS1kNZzmE7YiNoAxV8+0jYXrm33OD43iEId57gpM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=pcS6XeMaUdoIcmWnJMA4jOvei08xTcBC497PzyOFe6diWBpaLLdmpsGVo1SxhWhkV
	5R2I8XRMZYNNJXlQC+0T1tZC3WAHt28L9e4pNM2+QQ5Orqpko/A6JABa3/AKsJ/O7I
	c286tE3OjxVTOs1WdKk/rzRpReCQloPIK3IZG23c=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIKwx1i099049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:58:59 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 14:58:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 14:58:59 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIKwvAZ059174;
	Wed, 18 Dec 2019 14:58:58 -0600
To: <meta-arago@arago-project.org>
References: <1576700507-10385-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8195ea9c-8a91-39a5-9df4-de8f9cad45ef@ti.com>
Date: Wed, 18 Dec 2019 15:58:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576700507-10385-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsaulnier@ti.com
Subject: Re: [master/thud/ti2019.05][PATCH] ti-tisdk-makefile: update pru-icss target
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
X-List-Received-Date: Wed, 18 Dec 2019 21:00:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you fast-track this into the ti2019.05 branch?


Thank you,

Jake

On 12/18/2019 3:21 PM, Jacob Stiffler wrote:
> * Update for recent changes to the recipe in meta-ti
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss             | 4 ++--
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
> index 9431004..10e5bf3 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
> @@ -7,7 +7,7 @@ pru-icss:
>   	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
>   	for dir in examples pru_cape/pru_fw lib/src labs; \
>   	do \
> -		make -C $$dir PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
> +		make -C $$dir PRU_SSP=$$PWD PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
>   	done
>   
>   pru-icss_clean:
> @@ -17,7 +17,7 @@ pru-icss_clean:
>   	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
>   	for dir in examples pru_cape/pru_fw lib/src labs; \
>   	do \
> -		make -C $$dir clean PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
> +		make -C $$dir clean PRU_SSP=$$PWD PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
>   	done
>   
>   pru-icss_install: __PRU_ICSS_INSTALL_TARGET__
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 2468bb4..89ac752 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -56,7 +56,7 @@ SRC_URI = "\
>       file://Makefile_jailhouse \
>   "
>   
> -PR = "r102"
> +PR = "r103"
>   
>   MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>                           refresh-screen \

