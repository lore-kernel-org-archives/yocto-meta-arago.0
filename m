Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EA314529C0
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 14:24:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPEMeI5050738
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2019 08:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574691760;
	bh=Y0G7I5xq7743qbcug/43iaLG/kuQGW2G5fkCIFawNQU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=c5Be9Y8XTu1x+joTiSAwhO6knWYZ5N+J45PQ630P+9MChbXD2L1deuxZR7GaV4bpe
	ZpOsHYmmbwgZg7WZ57AVDLV5rMLMjO3C3oQPrGOXfASuWIObnLTk5LZdZzClbeZvxW
	H+Z3zQvlvHM0XqxW80tEq4uCENy1eNNNApOGosGI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPEMeMN005981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2019 08:22:40 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 25 Nov 2019 08:22:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 25 Nov 2019 08:22:40 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPEMePL115146;
	Mon, 25 Nov 2019 08:22:40 -0600
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <20191120165422.9897-1-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f13f97a3-268b-df80-d106-5e97e922e076@ti.com>
Date: Mon, 25 Nov 2019 09:22:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120165422.9897-1-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Mon, 25 Nov 2019 14:24:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/20/2019 11:54 AM, Jianzhong Xu wrote:
> * move dlr shared library to python sitepackages dlr folder
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   recipes-support/neo-ai/neo-ai-dlr_git.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
> index cbf4447..e81a939 100644
> --- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
> +++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
> @@ -57,6 +57,7 @@ do_install() {
>   
>       # setup.py install some libs under datadir, but we don't need them, so remove.


Can you also update the above comment as it is no longer relevant?


>       rm ${D}${datadir}/dlr/*.so
> +    mv ${D}${libdir}/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
>   
>       # Now install python test scripts
>       install -d ${D}${datadir}/dlr/tests

