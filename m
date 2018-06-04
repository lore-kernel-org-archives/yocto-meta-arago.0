Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6E0C8529C0
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 17:42:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54HgDmd022092
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 12:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528134133;
	bh=gi1E59ZqA38K6HeBNZhF/cbuoMzDDzaM5NuD5WzNYpI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=l7dmVp0fiQVvwFAJOcmdwsKuIBJHyTcMHlJ8L4bGS54zRhf2/jxGout1oTpsGP2mO
	TerNZjd6mVF8REjfox/JQtUMyZl5dNdctHmsM/SkTeYpmboPbKorVebNndftPYsE3F
	hib6Dn3xBGnQDj4AkOAGvRe1pkVyMczNqLCQlTjs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54HgD0O022935
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 12:42:13 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 12:42:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 12:42:12 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54HgCET005792;
	Mon, 4 Jun 2018 12:42:12 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1528124204-19003-1-git-send-email-x0157990@ti.com>
	<1528124204-19003-2-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c5f38286-ae72-c2ec-9241-be1999f43df0@ti.com>
Date: Mon, 4 Jun 2018 13:42:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528124204-19003-2-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH 2/4] csl: update for common-csl-ip 3.3.0.11
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
X-List-Received-Date: Mon, 04 Jun 2018 17:42:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

You will also need a bbappend for common-csl-ip-rtos.


On 6/4/2018 10:56 AM, Djordje Senicic wrote:
> * csl: new release 3.3.0.11
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc | 5 +++++
>   recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend    | 1 +
>   2 files changed, 6 insertions(+)
>   create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
>   create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
>
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
> new file mode 100644
> index 0000000..dca0a73
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
> @@ -0,0 +1,5 @@
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.11"
> +CSL_SRCREV = "b18c65acf85f9d94226cc573a99ba94bfe822b88"
> +
> +PV = "03.03.00.11"
> +INC_PR = "r0"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
> new file mode 100644
> index 0000000..dbf994a
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
> @@ -0,0 +1 @@
> +require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc


