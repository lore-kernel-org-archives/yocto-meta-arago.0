Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B484352A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:07:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI7cYL012317
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930858;
	bh=+ufGhvHXehAhEi2MSwLdVQfrOLvb8fZBXOGei5x7wkg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BfAKgz4k8vpWuEY9fVzaPxroI2UKlrTyWR+ZT9O0yEeDYKJDvafwW0IaSJhz0i+3S
	ftDRC8rsjT9EBkYuNgHf0YMGI6I2aOpLslyZsEkk0m4AqO/bxDQmXxlST3KaebNVCw
	EeSr7cZ2pNU+B+z8TWW2rposiILCVwDF4xpgNQ5c=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7XhC013291
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:07:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:07:33 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7Xr3014857;
	Wed, 20 Sep 2017 13:07:33 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505924922-28987-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4479ec68-80c6-8458-bafd-bbdecd5876ba@ti.com>
Date: Wed, 20 Sep 2017 14:07:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505924922-28987-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] icss-emac-lld-rtos: add rtos recipe for icss-emac-lld
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
X-List-Received-Date: Wed, 20 Sep 2017 18:07:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed.


On 9/20/2017 12:28 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> new file mode 100644
> index 0000000..8ce16e5
> --- /dev/null
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "TI RTOS low level driver for ICSS-EMAC"
> +
> +inherit ti-pdk
> +require icss-emac-lld-01.00.00.inc
> +
> +PR = "${INC_PR}.0"
> +
> +DEPENDS_append = " osal-rtos \
> +                   pruss-lld-rtos \
> +"
> +DEPENDS_append_ti33x = " starterware-rtos \
> +"
> +DEPENDS_append_ti43x = " starterware-rtos \
> +"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
> +
> +INSANE_SKIP_${PN} = "arch"


