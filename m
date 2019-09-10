Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C71D85299A
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 06:36:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8A6Yvrh055507
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568097297;
	bh=PXNH697Er2scP3XTXF2kIvzaQxc8ypRVpehhm+ZoCXY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=p0o/EjFXNLuaKKzocaKxCY00W/WatKK9jEL9r4bFFxx+x4BU+zIZHxTaxmM9lyE7N
	nGovD5c7CtMtycGOR2JL3yXRRh8jvBvI6+3tmo5u9/gCgBu5oY0Rbz2TQODc4cuZ+3
	bWyfMoaaXLQaqMUoBICtydd4DT9Dhra6Fo/B2pNU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8A6YvJh095353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:34:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 01:34:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 01:34:57 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8A6YtVq095356;
	Tue, 10 Sep 2019 01:34:56 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1567760584-24235-1-git-send-email-nikhil.nd@ti.com>
	<20190906131219.GB2400@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <32aef5ef-7ad6-2f53-4d25-6ed6fccb4c1e@ti.com>
Date: Tue, 10 Sep 2019 12:04:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190906131219.GB2400@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ [thud/master] PATCH v1] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Tue, 10 Sep 2019 06:36:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/09/19 6:42 PM, Denys Dmytriyenko wrote:
> Please retain original authorthip.

Will resend
Nikhil D

> 
> On Fri, Sep 06, 2019 at 02:33:04PM +0530, Nikhil Devshatwar wrote:
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
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


