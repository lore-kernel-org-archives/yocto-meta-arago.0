Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 63386529C5
	for <meta-arago@arago-project.org>;
	Sat, 12 Dec 2020 18:13:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCIDEOV060329
	for <meta-arago@arago-project.org>; Sat, 12 Dec 2020 12:13:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607796794;
	bh=dC8a/9oBxD4oZBKzVD2HvGYhWiAiLiXV/+dmIZjUQx8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=dhrbGY5/SS8CxRYMZoMjNGMMzDOyc7C+r8OpHEpBywGahFyjQcV7m81cznXpAKKbn
	QiZKvnYK2Q0/HD+FlFe0wFJBLhdL5ovK99ECpUi8JDggx89mMKFCRzmAaC28prbaSV
	qHPBZ2BIAK8k40cUogAf+V830PJ8s8u7Ef9q45uk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCIDER9045673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 12 Dec 2020 12:13:14 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 12 Dec 2020 12:13:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 12 Dec 2020 12:13:14 -0600
Received: from [10.250.72.184] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCIDEhO021784;
	Sat, 12 Dec 2020 12:13:14 -0600
To: Dan Murphy <dmurphy@ti.com>
References: <20201212041813.16398-1-praneeth@ti.com>
	<cb2bb6b1-7116-90d3-92f2-3f66592ef08d@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <47fdf83b-9463-14f5-468b-a5ee72d47c81@ti.com>
Date: Sat, 12 Dec 2020 12:13:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb2bb6b1-7116-90d3-92f2-3f66592ef08d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell PATCH] optee-os: update recipe to pick 3.11
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
X-List-Received-Date: Sat, 12 Dec 2020 18:13:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/12/20 10:10 AM, Dan Murphy wrote:
>>   create mode 100644 
>> meta-arago-distro/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch 
>>
>>   create mode 100644 
>> meta-arago-distro/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch 
>>
> 
> This failed to build
> 
> 09:58:06 WARNING: optee-os-3.11-r0.arago0 do_fetch: Failed to fetch URL 
> file://0006-allow-setting-sysroot-for-libgcc-lookup.patch, attempting 
> MIRRORS if available

But this file "0006-allow-setting-sysroot-for-libgcc-lookup.patch" is 
included right inside this patch .

> 09:58:06 ERROR: optee-os-3.11-r0.arago0 do_fetch: Fetcher failure: 
> Unable to find file 
> file://0006-allow-setting-sysroot-for-libgcc-lookup.patch anywhere. The 
> paths that were searched were:
> 09:58:06 
> /OE/arago-dunfell-next-build/sources/meta-arm/meta-arm/recipes-security/

looks like we are searching in meta-arm/recipes-security/ , yes the file 
will not be there because they are not in meta-arm dunfell branch 
instead in master branch. Hence i picked them to meta-arago/* dunfell 
branch in this patch.

Is there a different way to fix this to find the patches ?

