Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C962C5297E
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 16:28:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIGRxw4052290
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 10:27:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545150479;
	bh=7t/T0B1xm/hkovFj4x4B4beCYyfGha67tKQoJuAxVfQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Jbwjkctjc2RBPAH3DzOFoVyfTaWN8yLtS5UV5zVVmDdws8KxZKElNTe6yz4AXIko8
	WSdWbkU3y4wCBTXW6RaFjYUNpvZ5aWvKBYa+9iuRgKgqWJ1gDx2ggJT/gre3z3tf4B
	r+n2c1bmf83JLEd6Ufx8eeyZr6pn2PCx4L732L7Q=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIGRxoJ069742
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 10:27:59 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 10:27:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 10:27:58 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIGRwAd009939;
	Tue, 18 Dec 2018 10:27:58 -0600
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <1545145605-14789-1-git-send-email-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b4bb548a-dea4-79de-67f4-3118ca833d28@ti.com>
Date: Tue, 18 Dec 2018 11:27:58 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1545145605-14789-1-git-send-email-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] Add tidl-import to TIDL_PKGS.
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
X-List-Received-Date: Tue, 18 Dec 2018 16:28:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please update the shortlog to conform to 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages


- Jake


On 12/18/2018 10:06 AM, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> index b1b74a9..9bbb4e1 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> @@ -1,6 +1,6 @@
>   PR_append = ".tisdk1"
>   
> -TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils"
> +TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils tidl-import"
>   
>   EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
>   EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"

