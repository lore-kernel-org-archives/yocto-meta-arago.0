Return-Path: <dmurphy@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BB7AD52A65
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 17:49:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MHnC2i011403
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 12:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506102552;
	bh=A2rm1bXRFZHEwRDWvIPbB/kZe36BN8QOM2dBUQO7Lio=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=X/E+CLT/7d1FsjZrA7KFibVXllZBR8SpM/YaIA5tsG3McLM/kEPVo+kVjm0xljRf9
	gV5cZFxCDuTtZMEJ9m+TsVCYJZfvFL+DP9RdgeG7Xez7DCYJtn01xBPim6R6AzSsDl
	XiR31XM5rMilxrzYKVVYbHi4/0nqgjtUVNODGX6s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MHnCmA005279
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 12:49:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 12:49:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 12:49:12 -0500
Received: from [172.22.143.71] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MHnChL020322;
	Fri, 22 Sep 2017 12:49:12 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1506098041-19036-1-git-send-email-a0271529@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <77949247-bfd4-6b7c-820a-66780bd83768@ti.com>
Date: Fri, 22 Sep 2017 12:49:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506098041-19036-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processsor-sdk] [PATCH] prueth-fw: update the firmwares to 5.1.4
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
X-List-Received-Date: Fri, 22 Sep 2017 17:49:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/22/2017 11:34 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  recipes-bsp/prueth-fw/prueth-fw_git.bbappend | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bbappend b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> new file mode 100644
> index 0000000..6e8ca3e
> --- /dev/null
> +++ b/recipes-bsp/prueth-fw/prueth-fw_git.bbappend
> @@ -0,0 +1,4 @@
> +PV = "5.1.4"
> +PR = "r0"
> +
> +SRCREV = "b9d9e4bef2f32d4b55a63ecfec2e21f7b1eaaa34"
> 

NACK!!!!!!!!!!!!!


Dan

-- 
------------------
Dan Murphy

