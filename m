Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.2875.1646253914950638224
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xsdiwyvp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222KjBdM032440;
	Wed, 2 Mar 2022 14:45:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646253911;
	bh=8uB7XKTLcwv9lAgDgf5q0Hx7Qv2YkXfruIKKnYTJLhY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xsdiwyvp8DzSF9+DKP6fMZoEfDwMDj86snyT6XfkZcvGy5QkyzKK35Hng8of/MXXA
	 y+ClY060PQ5UN9L/XAxSQDLGjNkzq/VTcy1yO1AyOjbPDfRzSQJIfc/2dAJY/G3x30
	 uWP2Ad0t8njPAfCmGMuFqGOGLfMtOTlU6lze//Yo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222KjBR2061671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 14:45:11 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 14:45:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 14:45:10 -0600
Received: from [10.249.37.96] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222KjAkW007879;
	Wed, 2 Mar 2022 14:45:10 -0600
Message-ID: <47536470-8211-46fe-33ff-1294e4ecbc1e@ti.com>
Date: Wed, 2 Mar 2022 14:45:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arago][dunfell][PATCH] ti-tisdk-setup: Update SRCREV to latest
To: Denys Dmytriyenko <denis@denix.org>
CC: Aparna M <a-m1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <nikhil.nd@ti.com>, <devarsht@ti.com>
References: <20220225141125.15517-1-a-m1@ti.com>
 <46f32e91-bb5e-df34-6ad6-912a459cf314@ti.com>
 <20220302204340.GK1766@denix.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220302204340.GK1766@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

No, it was from feedback that Praneeth gave in webex teams.  I was 
capturing the comment on the mailing list.


On 3/2/2022 14:43, Denys Dmytriyenko wrote:
> On Wed, Mar 02, 2022 at 07:50:52AM -0600, Ryan Eatmon wrote:
>>
>>
>> On 2/25/2022 8:11, Aparna M wrote:
>>> Update SRCREV to include updates to create-sdcard.sh, uboot setup env
>>> scripts and tftp support for HS EVMs.
>>>
>>> Signed-off-by: Aparna M <a-m1@ti.com>
>>> ---
>>>   .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>>> index 886a8b55..2e35f6e2 100644
>>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
>>>   PR = "r46"
>>
>> The PR needs to bump also.  PR = "r47".
> 
> Ryan,
> 
> Was there a specific issue you saw with this?
> 
> 
>>>   BRANCH ?= "master"
>>> -SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
>>> +SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
>>>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>>>   S = "${WORKDIR}/git/"

-- 
Ryan Eatmon
reatmon@ti.com
