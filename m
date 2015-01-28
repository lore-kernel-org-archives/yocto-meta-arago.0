Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 70D53529B3
	for <meta-arago@arago-project.org>;
	Wed, 28 Jan 2015 16:14:59 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0SGEv3C024563
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 10:14:58 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0SGEr35014315
	for <meta-arago@arago-project.org>; Wed, 28 Jan 2015 21:44:55 +0530
Received: from [172.22.217.94] (172.22.217.94) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 28 Jan 2015 21:44:51 +0530
Message-ID: <54C90AFB.9050302@ti.com>
Date: Wed, 28 Jan 2015 21:44:51 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
	<E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
In-Reply-To: <E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
X-Originating-IP: [172.22.217.94]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Wed, 28 Jan 2015 16:15:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ACK.

Validated on dra7xx-evm.

Regards
Karthik

On 28-Jan-15 12:04 PM, Devshatwar, Nikhil wrote:
> Hi,
> The patch http://dflvsu0004.dal.design.ti.com/patch/12353/ in meta-ti
> Splits the vpdma-fw and vpe-tests recipes
> This patch is needed to update the package group in meta-arago correspondingly
>
>
>> -----Original Message-----
>> From: Devshatwar, Nikhil
>> Sent: Wednesday, January 28, 2015 12:02 PM
>> To: meta-arago@arago-project.org
>> Cc: R, Karthik; Devshatwar, Nikhil
>> Subject: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests
>> packages
>>
>> The vpdma-fw and vpe-tests are independent packages now.
>> Adding them both in the packagegroup.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>> arago-test.bb b/meta-arago-distro/recipes-
>> core/packagegroups/packagegroup-arago-test.bb
>> index 6af1321..83ba20e 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>> test.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>> test.bb
>> @@ -44,7 +44,8 @@ ARAGO_TI_TEST_append_omap-a15 = " \
>>       "
>>
>>   ARAGO_TI_TEST_append_dra7xx = " \
>> -    vpe-vpdma \
>> +    vpdma-fw \
>> +    vpe-tests \
>>       "
>>
>>   RDEPENDS_${PN} = "\
>> --
>> 1.7.9.5
>


