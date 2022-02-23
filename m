Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2333.1645581388673982977
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 17:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dlpQiOaD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21N1uOxF006917;
	Tue, 22 Feb 2022 19:56:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645581384;
	bh=46v7q0feuMz5I928+lZw3fWNeVB8w+vGIta+ZyYLucg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dlpQiOaDkAgxGaNJUgLmnyGvrWTEU6o2eIrO08CVZiNe2ZBOXFk9J23Wqo/UFezuq
	 LkOQayJmUmwRz4BhdQ1YZ55vjpvn0SfkzYzfQr86DDsREXtmWJb6EeKaa9Gnih/6CE
	 ovT8S56zaL+HKRlnKImx1D6HhTAA4ZbK9FbblJSY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21N1uOgK117007
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Feb 2022 19:56:24 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 19:56:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Feb 2022 19:56:24 -0600
Received: from [10.250.220.93] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21N1uNlJ116902;
	Tue, 22 Feb 2022 19:56:23 -0600
Message-ID: <bf5044fd-a41e-0d87-f6d2-409966dd95b2@ti.com>
Date: Tue, 22 Feb 2022 19:56:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [meta-arago] [master][PATCH 1/2] README: update meta-ti new layer structure and maintainer
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220222234910.614211-1-denis@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220222234910.614211-1-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/2022 5:49 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> As meta-ti has recently been split into sublayers, update README accordingly.
> Also update the layer maintainer entry.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   meta-arago-distro/README | 3 ++-
>   meta-arago-extras/README | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> index 3e0d41d2..42d8e0fa 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -11,6 +11,7 @@ layers: meta
>   URI: git://git.yoctoproject.org/meta-ti
>   branch: master
>   revision: HEAD
> +layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
>   branch: master
> @@ -34,5 +35,5 @@ layers: meta-arago-extras
>   Send pull requests to meta-arago@arago-project.org
>   
>   Layer maintainers:
> -Praneeth Bajjuri <praneeth@ti.com>
> +Ryan Eatmon <reatmon@ti.com>
>   Denys Dmytriyenko <denys@konsulko.com>
> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
> index d754ffdf..c3e3de2c 100644
> --- a/meta-arago-extras/README
> +++ b/meta-arago-extras/README
> @@ -11,6 +11,7 @@ layers: meta
>   URI: git://git.yoctoproject.org/meta-ti
>   branch: master
>   revision: HEAD
> +layers: meta-ti-bsp, meta-ti-extras
>   
>   URI: git://git.yoctoproject.org/meta-arm
>   branch: master
> @@ -29,5 +30,5 @@ revision: HEAD
>   Send pull requests to meta-arago@arago-project.org
>   
>   Layer maintainers:
> -Praneeth Bajjuri <praneeth@ti.com>
> +Ryan Eatmon <reatmon@ti.com>
>   Denys Dmytriyenko <denys@konsulko.com>
