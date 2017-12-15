Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8331E529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 20:45:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFKjf1I019859
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:45:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513370741;
	bh=ivpK27T+ndUmRqvrmNwLBEe031CmMyd6CF+cmyJTccQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iNY/WgW9ab1rLGn3WEuxQwNWZAOU+e0QIkv9N5lLBHXKim+UcIf0RLPH9wMewn0bH
	PmqxnYyRG2y10MF/Wrm+JoKDOYpDMP+pVrcUshGz0O5EV9FJdZBES6gW7pQzOW/P7/
	+qbC16dcRdAEw1USo+JhvlMHcCPPLuc+x0TE8hMY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKjaDS030381
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:45:36 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 14:45:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 14:45:35 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKjZla032364;
	Fri, 15 Dec 2017 14:45:35 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513370196-15761-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2a36b340-a184-613a-e79a-c1f7136e7c9a@ti.com>
Date: Fri, 15 Dec 2017 15:45:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513370196-15761-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] usb-lld-rtos: Update to version 1.0.0.12B & add omapl1 support
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
X-List-Received-Date: Fri, 15 Dec 2017 20:45:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

NAK. This needs to be a bbappend.


On 12/15/2017 3:36 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>   create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
> new file mode 100644
> index 0000000..0407e06
> --- /dev/null
> +++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
> @@ -0,0 +1,7 @@
> +COMPATIBLE_MACHINE_append = "|omapl1"
> +
> +# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.12B"
> +USB_LLD_SRCREV = "c055edbc2e6bf6aad95aa6e83e46a9ff03ee026b"
> +
> +PV = "01.00.00.12B"
> +PR = "r0"


