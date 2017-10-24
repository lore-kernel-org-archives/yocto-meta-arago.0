Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 620C1529D1
	for <meta-arago@arago-project.org>;
	Tue, 24 Oct 2017 17:44:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9OHipuW029544
	for <meta-arago@arago-project.org>; Tue, 24 Oct 2017 12:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508867091;
	bh=5QRvupRnpQ/Z9W1ldu/ZXedXT7gB9q3MJHD3KAZS384=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=pfocSxJ7u89g5frA21dAW4oHsMTh1WaWQGWpzxPuLxieLjxs1hLYL6PiBr9Kn/oRy
	TsOa39UDNLlpxA/Qm7FwFLSuuU48Ox6vHCMaEAkBaYSKxaHNRWvR/nxGwoe3cg4qcP
	YmqsEsHX3/67kafUx+0wAthqQQWpCkAWDVT1kSAg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OHipUC010152
	for <meta-arago@arago-project.org>; Tue, 24 Oct 2017 12:44:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 24 Oct 2017 12:44:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 24 Oct 2017 12:44:51 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OHioae007511;
	Tue, 24 Oct 2017 12:44:51 -0500
To: Emily Curry <esc@ti.com>, <meta-arago@arago-project.org>
References: <20171023215711.36722-1-esc@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d58e46b0-58c4-53c4-7926-88c7c8460de0@ti.com>
Date: Tue, 24 Oct 2017 13:44:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171023215711.36722-1-esc@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] ocl: Update to v01.01.14.06
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
X-List-Received-Date: Tue, 24 Oct 2017 17:44:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK

I tested these changes build for am57xx-evm.

Tested-by: Jacob Stiffler <j-stiffler@ti.com>


On 10/23/2017 5:57 PM, Emily Curry wrote:
> * Fix OpenCL example cross-compile failure
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 5cd1e02f..d036dfc6 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.14.5"
> +PV = "1.1.14.6"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>   OCL_GIT_PROTOCOL = "git"
>   OCL_GIT_BRANCH = "master"
>   
> -OCL_SRCREV = "e77c89ddd5c9da66ad0a0eec859958c3d8728f87"
> +OCL_SRCREV = "03e89944c6dc4ab508698610baef623231de436d"
>   
>   BRANCH = "${OCL_GIT_BRANCH}"
>   SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"


