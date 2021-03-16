Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 56534529B7
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 19:12:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GJD95k018791;
	Tue, 16 Mar 2021 14:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615921989;
	bh=BuKO6YGLJk61ldtiF3kPYcD817+6KiOIwQBJ3G2s4eM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YxqlC1udcANWmEVH23cSzqCyc2UwSPo0Wh7UuKp1F1VESWiZangcnMs8o2zglpTHy
	uPwfwPLICtrZxGcbjN8NcAqdyY3UnHgxWUs7aLQAzQrDas54c+/GtFnCNyuGiab0Rg
	uRRQ7VH0j3PUZJ8HCqeou/btJmLVMILJNL0ZLiak=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GJD9F7061085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 14:13:09 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 14:13:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 14:13:09 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GJD9TB038908;
	Tue, 16 Mar 2021 14:13:09 -0500
To: Denys Dmytriyenko <denis@denix.org>, Nishanth Menon <nm@ti.com>
References: <20210316170857.9547-1-nm@ti.com>
	<20210316171801.l7ttk4ottbyocpzi@oxidize>
	<20210316184512.GJ18041@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <a2a1382e-63fc-5d1b-d010-195b7a857679@ti.com>
Date: Tue, 16 Mar 2021 14:13:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316184512.GJ18041@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH 0/2] arago-dunfell/dunfell-next: Move to
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
X-List-Received-Date: Tue, 16 Mar 2021 19:12:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/16/2021 1:45 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 16, 2021 at 12:18:01PM -0500, Nishanth Menon wrote:
>> On 12:08-20210316, Nishanth Menon wrote:
>>
>> I have no idea what ate up my $subject -> I intended to add "Move to
>> dunfell/dunfell-tip from upstream.
>>
>>>
>>> This brings arago-config and arago-next-config both in sync with latest
>>> dunfell and dunfell-next tips appropriately.
>>>
>>> This series obviously will need to be followed up at an appropriate time
>>> with a stable commit sha patch to pin things up.
>>
>> K, I might be missing the motivation here - the pinning may not be
>> required given that dunfell is always a rolling config.. and used only
>> in the cases of exceptions.. So, please ignore my comment.
> 
> Looks good to me.
> 
> Praneeth, I see you only merged one of two patches?

Yes , only pulled the dunfell-next config .. started the build job to 
check if builds are ok. Will pull the dunfell patch in couple of hrs.


> 

