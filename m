Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5E6BF52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:35:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICZDkI084964
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861313;
	bh=XNyEJyms0UTHfS5TPeJ3znct+7SdaELH5HwUkSnq1sA=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=h+BvL4NKY8+oflH2oOVDPk6ZTKEYup5CiW9bxEwueBWmmtVbflDmZq/xR8Va9nhOj
	/e8a6qniPfh7n0cRjrg+POwdaUYX9MWvKG0rRvVJnUuflY5AnonN0Yw/Yu2wyMW1EZ
	Nhz1z/9AZGamAbQWUUqUKnCOS182ZkMZNAvdwYcQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICZDH4121562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:35:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:35:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 07:35:12 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ICZC8W116552;
	Tue, 18 Jun 2019 07:35:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190607140503.29694-1-e-ruei1@ti.com>
	<20190607140503.29694-2-e-ruei1@ti.com>
	<997ffbfd-cd22-f126-6ead-e8608ad4143d@ti.com>
Message-ID: <a94ace22-bf40-c945-e2f2-8fdf4cc97d60@ti.com>
Date: Tue, 18 Jun 2019 08:35:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <997ffbfd-cd22-f126-6ead-e8608ad4143d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH 2/2] matrix-gui-apps-git:bump SRCREV to put deform back to full-screen mode
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
X-List-Received-Date: Tue, 18 Jun 2019 12:35:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

On 6/12/2019 7:30 AM, Jacob Stiffler wrote:
> Denys,
>
> Can you please backport this to the ti2019.01 branch?
>
>
> Thank you,
>
> Jake
>
> On 6/7/2019 10:05 AM, Eric Ruei wrote:
>> Restore deform to full-screen mode because the display problem has been
>> fixed at Weston 5.0
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc 
>> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>> index 1ef1e9b9..487f1544 100644
>> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = 
>> "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>>     SRC_URI = 
>> "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
>> -SRCREV = "42ccd978004ec75b4e05313466abe92806d14a29"
>> +SRCREV = "2b41ee1f8e0dfe6b5f78d56e13a51aab115aaff0"
>>   BRANCH = "master"
>> -INC_PR = "r69"
>> +INC_PR = "r70"
>>     # Pull in the base package for installing matrix applications
>>   require matrix-gui-apps.inc

