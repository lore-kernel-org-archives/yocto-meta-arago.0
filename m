Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9CC0252980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:02:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD1ccw100438
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122098;
	bh=V2VYA+UUoEtkK4zzj9CGVzkxYQUCJEQPzO6UAI3ECNE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=vAbYRMsxDoFWwYTg8wMNI5e0RzM8vO0vBLuwTZQpJCiqMPyeFwl9DfP3WH2hsdJnH
	Wp23It6hzYRPCmYvCwb9n/qS3qIFsPiPMZyOzjk0R6maaV6J1i9QnGiRT4QNiLiTHv
	nWZmSZMR0VrV7MD09J1OdG4YciGx/WK8oBhk24wQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD1cWX127880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:01:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:01:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:01:38 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD1c5D037119;
	Fri, 21 Jun 2019 08:01:38 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190619181106.17439-1-x0157990@ti.com>
	<20190619181106.17439-2-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <aab76966-cfae-932f-7cad-64e50b4363cb@ti.com>
Date: Fri, 21 Jun 2019 09:01:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619181106.17439-2-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH 2/2] tidl-examples: Add to dra76x build
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
X-List-Received-Date: Fri, 21 Jun 2019 13:02:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 2:11 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index 2f5ca537..585582d5 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -8,7 +8,7 @@ require recipes-ti/includes/ti-paths.inc
>   
>   PR = "${INC_PR}.0"
>   
> -COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +COMPATIBLE_MACHINE = "dra7xx-evm|am57xx-evm|am57xx-hs-evm"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   DEPENDS = "opencv \

