Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AA5F1529E0
	for <meta-arago@arago-project.org>;
	Wed,  7 Jan 2015 03:29:29 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t073TRCb025409
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 21:29:28 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t073TOaZ032309
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 08:59:26 +0530
Received: from [172.22.216.188] (172.22.216.188) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 7 Jan 2015 08:59:23 +0530
Message-ID: <54ACA814.7040105@ti.com>
Date: Wed, 7 Jan 2015 08:59:24 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jacob Stiffler <j-stiffler@ti.com>
References: <1420556002-20165-1-git-send-email-j-stiffler@ti.com>
	<20150106181856.GY4759@edge>
In-Reply-To: <20150106181856.GY4759@edge>
X-Originating-IP: [172.22.216.188]
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
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
X-List-Received-Date: Wed, 07 Jan 2015 03:29:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Jake,


On 06-Jan-15 11:48 PM, Denys Dmytriyenko wrote:
> So, this will break MM for dra7xx-evm, but we still don't have OpenCL enabled
> by default. Should this be more conditional, if both of those can't co-exist?

>
>
> On Tue, Jan 06, 2015 at 09:53:22AM -0500, Jacob Stiffler wrote:
>> * This is to avoid conflict with OpenCL firmware.
>>

Could you please give more details about the conflict with OpenCL firmware?

Regards
Karthik

>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../packagegroup-arago-tisdk-multimedia.bb         |    3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>> index 81d5ee1..c51a02c 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Task to add multimedia related packages"
>>   LICENSE = "MIT"
>> -PR = "r10"
>> +PR = "r11"
>>
>>   inherit packagegroup
>>
>> @@ -49,7 +49,6 @@ ACCEL_FW_append_omap5-evm = " \
>>
>>   ACCEL_FW_append_dra7xx-evm = " \
>>       ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>> -    dspdce-fw \
>>       vis \
>>       "
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


