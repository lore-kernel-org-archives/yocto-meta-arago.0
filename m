Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 19AA1520E2
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 18:14:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CIDL3q082144
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568312001;
	bh=KSyIprW3JFFgzon8rX+UaoMAa7lzNdH6UnD6RnPybXg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qg0dv+6EKQ/Uke8PtnWEJ9zWGpBLmbfxaXE97WaH6lwsKs3FxaCIC65te3vpOE8Fq
	TwbBzxs0TJBVpL/sWWl0l4iVCvyuf+2X/Z1tPsi1Co290HKq/Umd7YVzJOhyxvJ+N2
	UXknEQdr4QD8cEsLpnGhbW7EZ+62GrvzAG3PnAEQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CIDKKL056909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:13:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 13:13:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 13:13:20 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CIDI3e098293;
	Thu, 12 Sep 2019 13:13:19 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
	<1568098140-193923-2-git-send-email-nikhil.nd@ti.com>
	<20190912164341.GG28369@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <24973bf4-262b-d90e-78dd-fbecf1954f15@ti.com>
Date: Thu, 12 Sep 2019 23:43:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190912164341.GG28369@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud PATCH v2 2/3] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Thu, 12 Sep 2019 18:14:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/09/19 10:13 PM, Denys Dmytriyenko wrote:
> Thanks, what about the test suite for ION?
This was mainly needed for PSDKRA use cases with Linux.
There was no request to add any tests.
> And I was planning to add those to meta-ti anyway...
That's fair, I don't have a specific choice.
as long as it gets packaged in the rootfs, I'm good.

Nikhil D
>
> On Tue, Sep 10, 2019 at 12:18:59PM +0530, Nikhil Devshatwar wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>> Changes from v1:
>> * Retained original authorship
>>
>>   meta-arago-extras/recipes-devtools/ion/libion_git.bb | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/ion/libion_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ion/libion_git.bb b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
>> new file mode 100644
>> index 0000000..7c93ed3
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "ION Userspace Memory Allocator Library"
>> +HOMEPAGE = "https://github.com/glneo/libion"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>> +
>> +PV = "1.0.0"
>> +
>> +BRANCH = "master"
>> +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
>> +SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake pkgconfig
>> -- 
>> 1.9.1
>>


