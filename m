Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E6FAC5209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 14:29:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEETsee026281
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:29:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513261794;
	bh=h9aJT3d4iA1rqcolaI5QZODVvAS8DKTd1IbUutuYJGo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BcctuEs+qEiZpip61A7xAISxaieZ5X6PjED+V5zur7PnSgzXWp3jctPHl0SylyMMS
	HkfXndLjP2KFbz7yYiZsEEb7cPEW03+R8PahgruD/2zgs8lOEf89aUonLbc/x+3O7Y
	O8D5qogFcgIaNLgAITTmQP5sC9eoUiaLOG/xPoso=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEETsmi013234
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 08:29:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 08:29:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 08:29:54 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEETrdZ021055;
	Thu, 14 Dec 2017 08:29:53 -0600
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513202222-22795-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6e3889f5-5b41-2421-0713-195f883cda6b@ti.com>
Date: Thu, 14 Dec 2017 09:29:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513202222-22795-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH ] uart-lld-rtos: Updating to revisoin 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 14:29:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/13/2017 4:57 PM, Mahesh Radhakrsihnan wrote:
> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>
> ---
>   recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>   create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb

This should be a bbappend.

>
> diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> new file mode 100644
> index 0000000..67249f5
> --- /dev/null
> +++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> @@ -0,0 +1,5 @@
> +# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.09"
> +UART_LLD_SRCREV = "f3670e497186b5ec5258d0e51fb1ebdaa3d60577"
> +
> +PV = "01.00.00.09"
> +PR = "r0"


