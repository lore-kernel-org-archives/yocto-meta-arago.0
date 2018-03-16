Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id F1AC852986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:31:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGUvSL006025
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521217857;
	bh=mQ1f+bdMDJd5angVQybCXz63ngE2eKKgRjqg72HMX2U=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BkxOqvHA6AE7bxEBnlFugJQnsgwMAd8DhWpKAndqKoNQ8yFslKSX/MdSl2Hfxcrv4
	gnvZNYx4dZg8FfpPEP2d/ZP6E2x8uvmXd6M+GFQVx/jWERneZT00zZsmOSACDYe/in
	tgjDR+GdPUnEzpzYusXt+QHAivYltbRkXkKtfuOI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGUvf6003523
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:30:57 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:30:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:30:57 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGUukO020483;
	Fri, 16 Mar 2018 11:30:57 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521215398-26773-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <752db368-d24e-f530-a118-0a204b691872@ti.com>
Date: Fri, 16 Mar 2018 12:30:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521215398-26773-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] edma3-lld-rtos: Updating to version 02.12.05.30C
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
X-List-Received-Date: Fri, 16 Mar 2018 16:31:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/16/2018 11:49 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc  | 7 +++++++
>   recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 1 +
>   recipes-bsp/edma3-lld/edma3-lld_git.bbappend      | 1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc
>   create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
>   create mode 100644 recipes-bsp/edma3-lld/edma3-lld_git.bbappend
>
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc b/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc

This filename does not match what is being included in the bbappends. 
The filename uses underscores in the version, while the bbappends are 
looking for a file which uses dots.

> new file mode 100644
> index 0000000..15413f7
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld-02_12_05_30C.inc
> @@ -0,0 +1,7 @@
> +# Below commit ID corresponds to version 2.12.05.30C
> +EDMA3_LLD_SRCREV = "a52b8f2a4bd4ca584bbd5bebba30563add353c5a"
> +
> +PV = "2.12.05.30C"
> +INC_PR = "r0"
> +
> +
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
> new file mode 100644
> index 0000000..5f7a9f3
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc
> diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
> new file mode 100644
> index 0000000..5f7a9f3
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-bsp/edma3-lld/edma3-lld-02.12.05.30C.inc


