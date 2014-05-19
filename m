Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 04AFD52094
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 14:11:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JEBmYN008261
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 09:11:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JEBmsE009096
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 09:11:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 09:11:48 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JEBmJl025683;
	Mon, 19 May 2014 09:11:48 -0500
Message-ID: <537A1124.1040609@ti.com>
Date: Mon, 19 May 2014 10:11:48 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1400507721-22387-1-git-send-email-hzhang@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D028610@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D028610@DLEE11.ent.ti.com>
X-Enigmail-Version: 1.6
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [Re-submit: v2] keystone: tisdk-image: change machine config from keystone-evm to k2hk-evm
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
X-List-Received-Date: Mon, 19 May 2014 14:11:49 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/19/2014 10:09 AM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Zhang, Hao
>> Sent: Monday, May 19, 2014 8:55 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [Re-submit: v2] keystone: tisdk-image:
>> change machine config from keystone-evm to k2hk-evm
>>
>> From: Hao Zhang <hzhang@ti.com>
>>
>> Keystone II SoC family has multiple devices and EVM's: k2hk, k2l
>> and k2e.
>> Each EVM should have a machine specific tisdk image, and keystone-
>> evm
>> machine name should be renamed to k2hk-evm.
>>
>> Signed-off-by: Hao Zhang <hzhang@ti.com>
>> ---
>> .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-
>> tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-
>> core-tisdk-image.inc
>> index f25db51..1dd9d6d 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>> image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>> image.inc
>> @@ -27,7 +27,7 @@ DTB_FILTER_keystone = "k2hk"
>> TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
>>
>> # Some devices do not support display and use a server image
>> instead
>> -TARGET_IMAGES_keystone-evm = "arago-base-tisdk-image tisdk-
>> server-rootfs-image"
>> +TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-
>> rootfs-image"
> 
> This doesn't match the description and summary above.  This looks right for setting to SOC Family though.
> 

You are right, I updated the change with Denys's comment, but forgot to
change description. I will update the description and re-submit.

>>
>> TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


