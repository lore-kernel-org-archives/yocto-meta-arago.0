Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 885BC52973
	for <meta-arago@arago-project.org>;
	Wed, 18 Nov 2015 19:11:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAIJBLOP029079
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:11:21 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJBLCr009340
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:11:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Nov 2015 13:11:21 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJBKQI010393;
	Wed, 18 Nov 2015 13:11:20 -0600
Message-ID: <564CCD58.9030009@ti.com>
Date: Wed, 18 Nov 2015 14:11:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1447872779-21321-1-git-send-email-j-stiffler@ti.com>
	<20151118190411.GY3272@edge>
In-Reply-To: <20151118190411.GY3272@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-core-tisdk-image: Do not unset DEPLOY_SPL_NAME for all keystone
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
X-List-Received-Date: Wed, 18 Nov 2015 19:11:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/2015 2:04 PM, Denys Dmytriyenko wrote:
> Just to clarify - that only affects final SDK packaging. Relevant images are
> still built and deployed for supported machines in the deploy area.

Yes. We'll need this file in the prebuilt-images directory for the 
create_sdcard.sh script.

>
> On Wed, Nov 18, 2015 at 01:52:59PM -0500, Jacob Stiffler wrote:
>> * DEPLOY_SPL_NAME is required for k2g-evm to provide the MLO
>>    for MMC boot
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> index f313494..06884ae 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> @@ -1,7 +1,9 @@
>>   require arago-core-tisdk-image.inc
>>   
>>   DEPLOY_SPL_NAME_omapl138 = ""
>> -DEPLOY_SPL_NAME_keystone = ""
>> +DEPLOY_SPL_NAME_k2hk-evm = ""
>> +DEPLOY_SPL_NAME_k2l-evm = ""
>> +DEPLOY_SPL_NAME_k2e-evm = ""
>>   
>>   ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
>>   export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


