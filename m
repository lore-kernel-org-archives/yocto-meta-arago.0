Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 12DF3529CC
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 16:57:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHGvR3J124219
	for <meta-arago@arago-project.org>; Thu, 17 Dec 2020 10:57:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608224247;
	bh=bymKN3YCFRFE3QnjO63YgpgHLP/l4aFa7c7FP5ftu/k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qiB2XuvOKperDSfiQqpWCVfoEZEGzGh9DxS9FsIj7XK6Q14c1rK0+DkSBpcj722uO
	HYAtZtAWoGoJeeBMzc9yZzA4s8T+CgL3zKddUAiItMek3y4b86AUEJg5u61aL9bCXj
	EGcB6MgJlPhby0hdvy82TzXtM70aXxkqxFIkNGgw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHGvRER082559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Dec 2020 10:57:27 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Dec 2020 10:57:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Dec 2020 10:57:27 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHGvRgD058340;
	Thu, 17 Dec 2020 10:57:27 -0600
To: Dan Murphy <dmurphy@ti.com>, <meta-arago@arago-project.org>
References: <20201204214738.26411-1-praneeth@ti.com>
	<1cee1931-7474-5e6d-fb9c-999dbd13bf25@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <1b6ceb41-762b-5082-dca1-d48ec2c86a63@ti.com>
Date: Thu, 17 Dec 2020 10:57:27 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1cee1931-7474-5e6d-fb9c-999dbd13bf25@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master PATCH] optee-os: update SRCREV to pick latest
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
X-List-Received-Date: Thu, 17 Dec 2020 16:57:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/7/2020 1:40 PM, Dan Murphy wrote:
> Praneeth
> 
> On 12/4/20 3:47 PM, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> updating SRCREV to pick the latest commit on
>> repo: ti-optee-os.git
>> branch: ti-optee-os
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git 
>> a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend 
>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 677c6dd0..8a52833e 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -4,4 +4,4 @@ SRC_URI = 
>> "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>              file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>   "
>>   BRANCH = "ti-optee-os"
>> -SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
>> +SRCREV = "f414104d552c8ab96ccc3c4182c395c20e3a0a34"
> 
> Are you updating this to a new version or reverting to an older 
> version?  If so you probably want to add a PV = "3.xx" here.
> 
> meta-arm has the PV set to 3.8 unless you are moving to 3.8.

There is no change in OPTEE version between those commit sha.

> 
> Since the git.ti.com repo does not contain the optee upstream tags it is 
> difficult to know what version this is. (Yes I know you just picked up 
> the maintenance).

Dan , Please go ahead and pull this update ( we will continue to be on 3.8)

> 
> Dan
> 

