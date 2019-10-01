Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 04EA1520DF
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 12:38:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91CbE8d111920
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569933434;
	bh=XvJMqgINMHydAbYkqL7RiznHQFTpxWw55T7Ah/+A2ig=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iOO7jmkb9qrcxyhYOxM+KyzYbE3Bb5gNRtagVVP/A/eb1otvfIP4LYw9XvUmSlSnY
	necTVt9AZ7lVN4sXLmrJJnWm9VtBKFfUKRVeDOq6VzYPNaHt9o/oNGL/JGKhz1PgC4
	KX38SkuF+PCBx2OyQJ1S+htA6zUsb3dBwUpTxIv4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91CbEUE014215
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:37:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 07:37:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 07:37:04 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91CbD9M008280;
	Tue, 1 Oct 2019 07:37:14 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-arago@arago-project.org>
References: <1569533574-55188-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4f9685f3-7b0e-c670-bc2c-b29a3d4c63d0@ti.com>
Date: Tue, 1 Oct 2019 08:37:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569533574-55188-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-tisdk-makefile: Update to fix build issue with arm-oe-linux-gnueabi
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
X-List-Received-Date: Tue, 01 Oct 2019 12:38:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03


Thank you,

Jake


On 9/26/2019 5:32 PM, Sam Nelson wrote:
> With arm-oe-linux-gnueabi toolchain, the sysroot path is not picked up
> by default.
>
> This fixes problem with building the ipc examples using top level make,
> in platforms using arm-oe-linux-gnueabi toolchain
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc   | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> index 53f9c88..682a791 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
> @@ -100,6 +100,7 @@ ti-ipc-linux-examples: ti-ipc-rtos-path-check
>   		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
>   		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
>   		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
> +		LINUX_SYSROOT_DIR=$(SDK_PATH_TARGET) \
>   		$(IPC_TOOLS_PATHS)
>   
>   ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examples
> @@ -131,5 +132,6 @@ ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
>   		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
>   		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
>   		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
> +		LINUX_SYSROOT_DIR=$(SDK_PATH_TARGET) \
>   		$(IPC_TOOLS_PATHS)
>   

