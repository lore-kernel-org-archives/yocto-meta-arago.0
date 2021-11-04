Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9439.1636017779348642632
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 02:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cDVPCwWK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A49Mt77111324;
	Thu, 4 Nov 2021 04:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636017775;
	bh=d06LMmO3aEeb/SEzI7Rduqb7AP4wGHBwvCdRoEmdqFs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=cDVPCwWKWlxacVxrnCnsE6gxoqyykOI6heNICCHekWUqxBdLEOCB8+v/+LJ9cn+7Q
	 UnindjFKffkJvh1xFu4xCO00oCflWgYRdL6oWiurbM1h1pOKj9dkbpoQPHAZlWDs0t
	 iUj7swbfgznuxQJksT+88s2ZSrNr85ay6nzBHo0M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A49Msvt103272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Nov 2021 04:22:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Nov 2021 04:22:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Nov 2021 04:22:54 -0500
Received: from [10.250.234.228] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A49MqUd018623;
	Thu, 4 Nov 2021 04:22:53 -0500
Subject: Re: [meta-arago] [dunfell/master][PATCH] recipes: update github SRC_URIs
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <1635979050-37317-1-git-send-email-denis@denix.org>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
Message-ID: <065e455e-9bce-989d-9c9e-7f4c9c23c9a7@ti.com>
Date: Thu, 4 Nov 2021 14:52:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1635979050-37317-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys

On 11/4/21 4:07 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> GitHub is deprecating unauthenticated protocols, including git:// so update
> SRC_URIs with protocol=https
> 
> Explicitly pass branch=master where omitted, as bitbake now requires it.

I hope there is plan to move away from git:// for non github URL too as 
cloning of git:// URLs no longer works reliably with git version 2.33.0+ 
behind proxies [1]. Suggestion is to move away from git:// to https://

[1] https://lore.kernel.org/git/20210830161149.xggfosjthnjxcoxp@box.shutemov.name/T/

Regards
Vignesh

