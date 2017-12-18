Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E10B65299D
	for <meta-arago@arago-project.org>;
	Mon, 18 Dec 2017 18:10:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBIIAULI008818
	for <meta-arago@arago-project.org>; Mon, 18 Dec 2017 12:10:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513620630;
	bh=azvGmXnuRYs5pVmMi6RzKGbGhk5zrU1j/c/ok6XU0bc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Ugcn/a8t2UI9sZkrvzC9c/03AzISFxL57IsV9QqKLyFBM3V0mvRQCXrJ5oOdf2WG7
	ZiTfF0DtY/41PP7jNFOhQWmYRA6iWziP2QirfwxyrBspO8OLEsdt1TymYVGCCITSoU
	YP1b/OumRR63EYYCiXbNQwHcMbTya2Xw0+8OyqXg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIIAUMC029670
	for <meta-arago@arago-project.org>; Mon, 18 Dec 2017 12:10:30 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 12:10:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 18 Dec 2017 12:10:30 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIIATOk019214;
	Mon, 18 Dec 2017 12:10:29 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513381477-17961-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <38c9e4ea-0574-bc7e-63d0-753b5d3fd8f5@ti.com>
Date: Mon, 18 Dec 2017 13:10:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513381477-17961-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] serdes-diag-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Mon, 18 Dec 2017 18:10:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thank you. This has been pushed.


On 12/15/2017 6:44 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend | 5 +++++
>   1 file changed, 5 insertions(+)
>   create mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
>
> diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
> new file mode 100644
> index 0000000..00da3e1
> --- /dev/null
> +++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
> @@ -0,0 +1,5 @@
> +# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.09"
> +SERDES_DIAG_SRCREV = "22c47cc6e1784a3d2813424da5b469e4168659a6"
> +
> +PV = "01.00.00.09"
> +PR = "r0"


