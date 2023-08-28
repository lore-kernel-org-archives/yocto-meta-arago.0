Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DFFC83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:19:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.59.1693243149024139963
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 10:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GGDiezqX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SHJ3Yd108597;
	Mon, 28 Aug 2023 12:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693243143;
	bh=TLFxqLEd2DVXdvGkw2WLSq22JAKH4Gc/9d5LwZRpbM4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GGDiezqXpS3u+WwHPH+eBAIKGYLW0FpuqO2mGvLCKFKtQYhwcGAfgpuCCDzS15zEf
	 ygkdolAwutDKdHkn51AuC+7ZDywb7mvsjVh4VTMzDVIvTc/KMkL0GLqiKYppn+CUFw
	 hLHxaLJ84DUqeyNkATQqVNO3TPGj7kZzDCv0kTPg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SHJ3qK094123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 12:19:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 12:19:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 12:19:03 -0500
Received: from [10.249.36.124] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SHJ3lx042505;
	Mon, 28 Aug 2023 12:19:03 -0500
Message-ID: <8e77e3dd-bd61-839d-eb17-bd03c6c102f8@ti.com>
Date: Mon, 28 Aug 2023 12:19:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] openntpd: Update to version
 6.8p1
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230818212349.1060-1-reatmon@ti.com>
 <20230828150243.GO3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230828150243.GO3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 17:19:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14872



On 8/28/2023 10:02 AM, Denys Dmytriyenko wrote:
> On Fri, Aug 18, 2023 at 04:23:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The 3.9p1 version is really old, and we ran into compile issues with the
>> latest upstream testing.  Take this opportunity to upgrade to the latest
>> version.
> 
> 1. a proper diff would have been nice

In this case it is a remove and add.  So no diff possible as the receipt 
file name changed.  Is there a more preferred way of showing this kind 
of diff?  I think this is my first time doing a recipe change like this.


> 2. I see LIC_FILES_CHKSUM has changed - needs a brief explanation

Since it has already been merged is an explanation in this email enough, 
or should I post another patch to explain it?

Basically, the LICENSE file disappeared from the latest tar balls of the 
source code.  So I searched through the files and found that it had kind 
of been renamed to COPYING.  Nothing nefarious about it.  Same license, 
they just changed the file name.

And the tarball we were pointing at was from 2005, and the latest is 
much more recent.  Not sure I could even track down the why of the change.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../openntpd/openntpd_3.9p1.bb                | 21 ---------------
>>   .../openntpd/openntpd_6.8p1.bb                | 26 +++++++++++++++++++
>>   2 files changed, 26 insertions(+), 21 deletions(-)
>>   delete mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>>   create mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>>
>> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>> deleted file mode 100644
>> index 008d4d33..00000000
>> --- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
>> -Network Time Protocol."
>> -HOMEPAGE = "http://www.openntpd.org/"
>> -SECTION = "console/network"
>> -LICENSE = "BSD-3-Clause & ISC"
>> -LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
>> -
>> -PR = "r0"
>> -
>> -SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
>> -
>> -S = "${WORKDIR}/openntpd-${PV}"
>> -EXTRA_OECONF = "--disable-strip"
>> -inherit autotools
>> -
>> -LDFLAGS += "-lrt"
>> -EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
>> -                 --with-privsep-user=root --with-privsep-path=/${prefix}"
>> -
>> -SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
>> -SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
>> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>> new file mode 100644
>> index 00000000..e4aa27fc
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
>> +Network Time Protocol."
>> +HOMEPAGE = "http://www.openntpd.org/"
>> +SECTION = "console/network"
>> +LICENSE = "BSD-3-Clause & ISC"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fe922aad2b6ad1c359cf2adfdaaab1b6"
>> +
>> +PR = "r0"
>> +
>> +SRC_URI = "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
>> +SRC_URI[md5sum] = "7c68ce2627b2ea13f2b95db1ef4fcfc5"
>> +SRC_URI[sha256sum] = "8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46"
>> +
>> +S = "${WORKDIR}/openntpd-${PV}"
>> +inherit autotools
>> +
>> +LDFLAGS += "-lrt"
>> +EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
>> +                 --with-privsep-user=root"
>> +
>> +do_install:append() {
>> +    # don't install empty /var/run and /run to avoid conflict with base-files
>> +    rm -rf ${D}${localstatedir}/run
>> +    rm -rf ${D}/run
>> +}
>> +
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

