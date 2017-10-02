Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 61B5D529E2
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 13:37:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92DbfUO005061
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506951461;
	bh=VJVzql9gSQAy0+61FEnXnAMLw3pPl1KAkZ5nKqxaIgY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Q0/lXI49rbm+BCRoGOFyQw0WdfM1k9GBBXssTOx2RrIHFTweu/yBTy2IJocEj9BCG
	mPkZoGmBFKQKkcuaLANW0gDQDKbA+U/+E92kjnOdWyI+c3ZxRhU/MBttYiekUkXy63
	NE93hydcY9CJrzmWGFVgmv2X8rmbXtllSdViUu0Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92DbfUG017378
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 08:37:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 08:37:40 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 08:37:40 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92Dbe3T014704;
	Mon, 2 Oct 2017 08:37:40 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
	<1506709407-16448-3-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9641a48b-7d52-fecf-4d92-23dc77284a6f@ti.com>
Date: Mon, 2 Oct 2017 09:37:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506709407-16448-3-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][morty-x11-experimen tal][PATCH 02/layer.conf: select sgx-ddk based on ddk window support (xsgx vs, sgx)
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
X-List-Received-Date: Mon, 02 Oct 2017 13:37:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/29/2017 2:23 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   conf/layer.conf | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 0334463..8e2c5a1 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>   BBFILE_COLLECTIONS += "meta-processor-sdk"
>   BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-processor-sdk = "15"
> +
> +SIGGEN_EXCLUDERECIPES_ABISAFE_remove = " ti-sgx-ddk-km  ti-sgx-ddk-um"
> +SIGGEN_EXCLUDERECIPES_ABISAFE_append = " \

There should be no need to replace these in this list. As not all of 
these recipes are applicable in every build, you should only need to add 
'ti-xsgx-ddk-km' to this list.

> +    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-km", "ti-sgx-ddk-km", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-um", "ti-sgx-ddk-um", d)} \
> +"


