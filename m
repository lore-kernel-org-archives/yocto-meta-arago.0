Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E62E352986
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 19:42:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJgGnu013083
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:42:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJgGAT028766
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:42:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:42:16 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJgFUA011461;
	Fri, 16 May 2014 14:42:15 -0500
Message-ID: <53766A17.3090702@ti.com>
Date: Fri, 16 May 2014 15:42:15 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1400268469-25050-1-git-send-email-hzhang@ti.com>
	<20140516193522.GL18053@edge>
In-Reply-To: <20140516193522.GL18053@edge>
X-Enigmail-Version: 1.6
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] keystone: ti-sdk: add k2e-evm core ti-sdk image
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
X-List-Received-Date: Fri, 16 May 2014 19:42:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/16/2014 3:35 PM, Denys Dmytriyenko wrote:
> On Fri, May 16, 2014 at 03:27:49PM -0400, hzhang@ti.com wrote:
>> From: Hao Zhang <hzhang@ti.com>
>>
>> ---
>>  .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
>> index 9bbeaf1..dc8a1e5 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
>> @@ -29,6 +29,7 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
>>  # Some devices do not support display and use a server image instead
>>  TARGET_IMAGES_k2hk-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
>>  TARGET_IMAGES_k2l-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
>> +TARGET_IMAGES_k2e-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
> 
> Just use SOC_FAMILY override - it's specifically created to reduce 
> duplication!
> 
> TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
> 
> 
will use keystone machine.

>>  TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>>  
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


