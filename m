Return-Path: <trini@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4A67252A48
	for <meta-arago@arago-project.org>;
	Tue,  9 Apr 2013 11:49:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r39BntwE008571
	for <meta-arago@arago-project.org>; Tue, 9 Apr 2013 06:49:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r39Bntkk014152
	for <meta-arago@arago-project.org>; Tue, 9 Apr 2013 06:49:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Apr 2013 06:49:54 -0500
Received: from [172.24.52.44] (h52-44.vpn.ti.com [172.24.52.44])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r39BnriD002651;
	Tue, 9 Apr 2013 06:49:54 -0500
Message-ID: <51640066.8000800@ti.com>
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1365170082-1087-1-git-send-email-Chase.Maupin@ti.com>
	<20130408175540.GA15209@denix.org>
	<7D46E86EC0A8354091174257B2FED101594D1663@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594D1663@DLEE11.ent.ti.com>
X-Enigmail-Version: 1.5.1
X-Mailman-Approved-At: Mon, 06 May 2013 21:48:42 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-addons: Add parted utility
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
Date: Tue, 09 Apr 2013 11:49:57 -0000
X-Original-Date: Tue, 9 Apr 2013 07:49:58 -0400
X-List-Received-Date: Tue, 09 Apr 2013 11:49:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 04/09/2013 07:01 AM, Maupin, Chase wrote:
> I'm OK with trying that.
> 
> Tom, will that utility work for your needs?

Well it's "everyone with a OMAP5 uEVM"s needs, but yes, something to
re-partition eMMC that groks GPT is what's needed, and that fits the bill.

> 
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/ 
> 
> 
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Monday, April 08, 2013 12:56 PM
>> To: Maupin, Chase
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH] tisdk-addons: Add parted
>> utility
>>
>> On Fri, Apr 05, 2013 at 08:54:42AM -0500, Chase Maupin wrote:
>>> * Add the parted utility to make working with eMMC GPT
>> partitions
>>>   possible from the Linux system.
>>
>> Since parted is GPLv3, may I suggest GPT fdisk (gdisk) instead,
>> which is
>> GPLv2? It appears there's no recipe for it yet, but it should it
>> relatively
>> easy to make, as it's quite portable:
>>
>> http://www.rodsbooks.com/gdisk/index.html
>>
>> --
>> Denys
>>
>>
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> ---
>>>  .../packagegroup-arago-tisdk-addons.bb             |    3 ++-
>>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-
>> core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-
>> arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>> addons.bb
>>> index 0f76f4f..5dade67 100644
>>> --- a/meta-arago-distro/recipes-
>> core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>> +++ b/meta-arago-distro/recipes-
>> core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>> @@ -1,6 +1,6 @@
>>>  DESCRIPTION = "Task to install additional utilities/demos for
>> SDKs"
>>>  LICENSE = "MIT"
>>> -PR = "r5"
>>> +PR = "r6"
>>>
>>>  inherit packagegroup
>>>
>>> @@ -16,6 +16,7 @@ UTILS = " \
>>>      arm-benchmarks \
>>>      dropbear \
>>>      openssh-sftp-server \
>>> +    parted \
>>>  "
>>>
>>>  # Add PRU examples for am180x-evm devices
>>> --
>>> 1.7.0.4
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>


-- 
Tom

