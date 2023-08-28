Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D50C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 20:27:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2182.1693254445024901887
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 13:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wFLIokNR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SKRKc2027615;
	Mon, 28 Aug 2023 15:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693254440;
	bh=7AdLhgWqOdprV53KRZsfqHEIp4ksPcFVHPuaMTNIwTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wFLIokNR2YcNUP2j11V/Jr30mUAdIl2+oDd0FCr3436hz5QMOBTyjEOvNfMjajNTn
	 /4qf9o9fRR7RmHTp1WGFAYFK72WkEJ3O0/OSVWF/c3cCYKII3xkBn5cZsSK5BZ1Zff
	 ANfpcu/2i+kkFosxQ2ixcBbaNq8I0jCrtrteOIiM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SKRKSt074359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 15:27:20 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 15:27:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 15:27:19 -0500
Received: from [10.249.36.124] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SKRJju076380;
	Mon, 28 Aug 2023 15:27:19 -0500
Message-ID: <75371da7-e922-8949-652b-22bf7adf3611@ti.com>
Date: Mon, 28 Aug 2023 15:27:19 -0500
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
 <8e77e3dd-bd61-839d-eb17-bd03c6c102f8@ti.com>
 <20230828200127.GP3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230828200127.GP3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 20:27:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14874



On 8/28/2023 3:01 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 28, 2023 at 12:19:02PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 8/28/2023 10:02 AM, Denys Dmytriyenko wrote:
>>> On Fri, Aug 18, 2023 at 04:23:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> The 3.9p1 version is really old, and we ran into compile issues with the
>>>> latest upstream testing.  Take this opportunity to upgrade to the latest
>>>> version.
>>>
>>> 1. a proper diff would have been nice
>>
>> In this case it is a remove and add.  So no diff possible as the
>> receipt file name changed.  Is there a more preferred way of showing
>> this kind of diff?  I think this is my first time doing a recipe
>> change like this.
> 
> -M[<n>], --find-renames[=<n>]
> 
>      Detect renames. If n is specified, it is a threshold on the similarity
> index (i.e. amount of addition/deletions compared to the file's size). For
> example, -M90% means Git should consider a delete/add pair to be a rename if
> more than 90% of the file hasn't changed. Without a % sign, the number is to
> be read as a fraction, with a decimal point before it. I.e., -M5 becomes 0.5,
> and is thus the same as -M50%. Similarly, -M05 is the same as -M5%. To limit
> detection to exact renames, use -M100%. The default similarity index is 50%.
> 
> -C[<n>], --find-copies[=<n>]
> 
>      Detect copies as well as renames. See also --find-copies-harder. If n is
> specified, it has the same meaning as for -M<n>.
> 
> --find-copies-harder
> 
>      For performance reasons, by default, -C option finds copies only if the
> original file of the copy was modified in the same changeset. This flag makes
> the command inspect unmodified files as candidates for the source of copy.
> This is a very expensive operation for large projects, so use it with caution.
> Giving more than one -C option has the same effect.
> 
> 
>>> 2. I see LIC_FILES_CHKSUM has changed - needs a brief explanation
>>
>> Since it has already been merged is an explanation in this email
>> enough, or should I post another patch to explain it?
>>
>> Basically, the LICENSE file disappeared from the latest tar balls of
>> the source code.  So I searched through the files and found that it
>> had kind of been renamed to COPYING.  Nothing nefarious about it.
>> Same license, they just changed the file name.
>>
>> And the tarball we were pointing at was from 2005, and the latest is
>> much more recent.  Not sure I could even track down the why of the
>> change.
> 
> No need for a separate patch. But the purpose of tracking license checksum in
> LIC_FILES_CHKSUM is to detect any and all changes in the license text, which
> could potentially mean legal liabilities, as the LICENSE value could no longer
> be valid or correct. Hence you want to manually check such checksum changes
> and document them in the same commit for due diligence and CYA purposes :)
> 
> And simply renaming the file won't change the checksum, so something else has
> changed in the text...


yes.  Here is the diff.  Looks like they removed three sub-licenses from 
the file.



 > diff openntpd-3.9p1/LICENCE openntpd-6.8p1/COPYING
32,103d31
<
< Specific parts of the portability layer have the following licences.
<
< bsd-snprintf.c is from OpenSSH and has the following licence:
< /*
<  * Copyright Patrick Powell 1995
<  * This code is based on code written by Patrick Powell
<  * (papowell@astart.com) It may be used for any purpose as long as this
<  * notice remains intact on all source code distributions
<  */
<
< The following files are from OpenSSH or OpenBSD and are under a 2-term
< BSD license with the noted copyright holders:
<
< atomicio.c: Theo de Raadt, Anil Madhavapeddy
< atomicio.h, bsd-poll.h: Theo de Raadt
<
< /*
<  * Redistribution and use in source and binary forms, with or without
<  * modification, are permitted provided that the following conditions
<  * are met:
<  * 1. Redistributions of source code must retain the above copyright
<  *    notice, this list of conditions and the following disclaimer.
<  * 2. Redistributions in binary form must reproduce the above copyright
<  *    notice, this list of conditions and the following disclaimer in the
<  *    documentation and/or other materials provided with the distribution.
<  *
<  * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
<  * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES
<  * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
<  * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
<  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
(INCLUDING, BUT
<  * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
OF USE,
<  * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
<  * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
<  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
USE OF
<  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
<  */
<
< The following files are from OpenSSH and are under a 3-term BSD license
< with the noted copyright holders:
<
< fake-rfc2553.c, fake-rfc2553.h: WIDE Project, Damien Miller.
< daemon.c, sys-queue.h: The Regents of the University of California
<
< /*
<  * Redistribution and use in source and binary forms, with or without
<  * modification, are permitted provided that the following conditions
<  * are met:
<  * 1. Redistributions of source code must retain the above copyright
<  *    notice, this list of conditions and the following disclaimer.
<  * 2. Redistributions in binary form must reproduce the above copyright
<  *    notice, this list of conditions and the following disclaimer in the
<  *    documentation and/or other materials provided with the distribution.
<  * 3. Neither the name of the project nor the names of its contributors
<  *    may be used to endorse or promote products derived from this 
software
<  *    without specific prior written permission.
<  *
<  * THIS SOFTWARE IS PROVIDED BY THE PROJECT AND CONTRIBUTORS ``AS IS'' AND
<  * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
<  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE
<  * ARE DISCLAIMED.  IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE 
LIABLE
<  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL
<  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
<  * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
<  * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
STRICT
<  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
ANY WAY
<  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
<  * SUCH DAMAGE.
<  */
<
< $Id: LICENCE,v 1.6 2005/07/03 14:02:40 dtucker Exp $







> 
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>>   .../openntpd/openntpd_3.9p1.bb                | 21 ---------------
>>>>   .../openntpd/openntpd_6.8p1.bb                | 26 +++++++++++++++++++
>>>>   2 files changed, 26 insertions(+), 21 deletions(-)
>>>>   delete mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>>>>   create mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>>>>
>>>> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>>>> deleted file mode 100644
>>>> index 008d4d33..00000000
>>>> --- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>>>> +++ /dev/null
>>>> @@ -1,21 +0,0 @@
>>>> -DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
>>>> -Network Time Protocol."
>>>> -HOMEPAGE = "http://www.openntpd.org/"
>>>> -SECTION = "console/network"
>>>> -LICENSE = "BSD-3-Clause & ISC"
>>>> -LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
>>>> -
>>>> -PR = "r0"
>>>> -
>>>> -SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
>>>> -
>>>> -S = "${WORKDIR}/openntpd-${PV}"
>>>> -EXTRA_OECONF = "--disable-strip"
>>>> -inherit autotools
>>>> -
>>>> -LDFLAGS += "-lrt"
>>>> -EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
>>>> -                 --with-privsep-user=root --with-privsep-path=/${prefix}"
>>>> -
>>>> -SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
>>>> -SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
>>>> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>>>> new file mode 100644
>>>> index 00000000..e4aa27fc
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
>>>> @@ -0,0 +1,26 @@
>>>> +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
>>>> +Network Time Protocol."
>>>> +HOMEPAGE = "http://www.openntpd.org/"
>>>> +SECTION = "console/network"
>>>> +LICENSE = "BSD-3-Clause & ISC"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fe922aad2b6ad1c359cf2adfdaaab1b6"
>>>> +
>>>> +PR = "r0"
>>>> +
>>>> +SRC_URI = "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
>>>> +SRC_URI[md5sum] = "7c68ce2627b2ea13f2b95db1ef4fcfc5"
>>>> +SRC_URI[sha256sum] = "8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46"
>>>> +
>>>> +S = "${WORKDIR}/openntpd-${PV}"
>>>> +inherit autotools
>>>> +
>>>> +LDFLAGS += "-lrt"
>>>> +EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
>>>> +                 --with-privsep-user=root"
>>>> +
>>>> +do_install:append() {
>>>> +    # don't install empty /var/run and /run to avoid conflict with base-files
>>>> +    rm -rf ${D}${localstatedir}/run
>>>> +    rm -rf ${D}/run
>>>> +}
>>>> +
>>>> -- 
>>>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

