Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 723EC52A4B
	for <meta-arago@arago-project.org>;
	Wed, 10 Feb 2016 22:23:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1AMNF3t007227
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 16:23:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AMNFIk007528
	for <meta-arago@arago-project.org>; Wed, 10 Feb 2016 16:23:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Feb 2016 16:23:15 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1AMNFfX029574;
	Wed, 10 Feb 2016 16:23:15 -0600
Message-ID: <56BBB852.7050003@ti.com>
Date: Wed, 10 Feb 2016 17:23:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1455127224-19289-1-git-send-email-j-stiffler@ti.com>
	<20160210220420.GO31480@edge>
In-Reply-To: <20160210220420.GO31480@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-addons: Add protobuf for am3/4/5
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
X-List-Received-Date: Wed, 10 Feb 2016 22:23:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/2016 5:04 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 10, 2016 at 01:00:24PM -0500, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb    | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> index ff2ca83..1762a43 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>>   LICENSE = "MIT"
>> -PR = "r39"
>> +PR = "r40"
> Are you missing another patch? This recipe is at r39 now.

Ah, I have another one locally which I am not quite ready to submit. I 
would like to get this one accepted asap, so I will submit the v2.

>
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> @@ -102,14 +102,17 @@ DEVTOOLS = " \
>>   
>>   DEVTOOLS_append_ti33x = " \
>>       nodejs \
>> +    protobuf \
>>   "
>>   
>>   DEVTOOLS_append_ti43x = " \
>>       nodejs \
>> +    protobuf \
>>   "
>>   
>>   DEVTOOLS_append_omap-a15 = " \
>>       nodejs \
>> +    protobuf \
>>   "
>>   
>>   RDEPENDS_${PN} = "\
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


