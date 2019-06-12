Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 86B4B52A00
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 11:32:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBW6XK054051
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560339126;
	bh=Rhh3LLWNGP5/N6XnrKrAZ4edL++BZhy5ABEj1e1R8Bs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rm5jX7egYar1t85bTAi7h8HBkbaNOnRocAUiH+cJU4GqBBwVJOVjzB8tDdUpbL364
	nhxWsWf2fpTdWyLnF9CVhQLyoxL1qi4SGVs+Jyuxl+oEy1Hv+ifFVDzNnvlgtCi8g7
	rllygFoOUEpqxCackISpQM41ym/BweCaQoWoHx1Y=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBW6iM022895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:32:06 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 06:32:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 06:32:06 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBW5pN076602;
	Wed, 12 Jun 2019 06:32:05 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190611180913.10651-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0e4a6d58-4e17-50fb-4759-063769615a10@ti.com>
Date: Wed, 12 Jun 2019 07:32:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611180913.10651-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATH] point-cloud-viewer: New binary compiled with gcc8 toolchain
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
X-List-Received-Date: Wed, 12 Jun 2019 11:32:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to the ti2019.01 branch?


Thank you,

Jake

On 6/11/2019 2:09 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index e477448b..9ee4ff0b 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -11,9 +11,9 @@ BRANCH = "master"
>   
>   SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
>   
> -SRCREV = "ac8f7a8334b6458676810349ab84f718ecd16975"
> +SRCREV = "c4800b186744e9379c798299c5caa67f6a4468f0"
>   
> -PV = "2.0"
> +PV = "2.1"
>   
>   S = "${WORKDIR}/git"
>   

