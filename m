Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8E57952A59
	for <meta-arago@arago-project.org>;
	Fri, 14 Aug 2015 15:01:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7EF1Tvi013743
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 10:01:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EF1T8Q023553
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 10:01:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 10:01:29 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EF1TDO007332;
	Fri, 14 Aug 2015 10:01:29 -0500
Message-ID: <55CE02C9.80008@ti.com>
Date: Fri, 14 Aug 2015 11:01:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
	<20150814145315.GE30560@edge>
In-Reply-To: <20150814145315.GE30560@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 1/2] package-sdks: Remove assumption of TISDK_VERSION from webgen.mak path
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
X-List-Received-Date: Fri, 14 Aug 2015 15:01:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/14/2015 10:53 AM, Denys Dmytriyenko wrote:
> What's the reason for the change?
>

It seems restrictive to force TISDK_VERSION in the webgen.mak path when 
the same can be accomplished through the config (see PATCH 2/2).

Also, it is preferable to not maintain the webgen.mak for every release 
made as we can use git to obtain an old version.

> On Thu, Aug 13, 2015 at 09:25:16AM -0400, Jacob Stiffler wrote:
>> * The same effect can be obtained though the config.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   lib/oesdk/package-sdks | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
>> index 31a44b6..498ee79 100644
>> --- a/lib/oesdk/package-sdks
>> +++ b/lib/oesdk/package-sdks
>> @@ -304,7 +304,7 @@ generate_webgen_page() {
>>       m="$1"
>>   
>>       
>> -    webgen_make="$WEBGEN_MAK_ROOT/$TISDK_VERSION/$m/webgen.mak"
>> +    webgen_make="$WEBGEN_MAK_ROOT/$m/webgen.mak"
>>   
>>       if [ ! -e $webgen_make ]
>>       then
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


