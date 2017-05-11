Return-Path: <jreeder@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3F0C552A33
	for <meta-arago@arago-project.org>;
	Thu, 11 May 2017 18:56:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4BIukDF023686
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 13:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494529006;
	bh=iddjZwsBofFr4v5wi3BisMNG85wXDIAn2BWn+sYFru8=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=lJ5r2huLiM92yzwE3ArtBSLcXocvofzsJ6a0YhG4sLrf6uIAk0pColUlcEiVKL0nX
	GqiD0iUtXVErDhVYgkkZ2yKpAIFHHGs5l724f5ZBcNAQXfGaHnc8FHG2ayWQ0s529S
	R+jGrDje35A5y05zgvJ2Ib+i8U1/Id2E5hKu2cfg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BIujkm024197
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 13:56:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 11 May 2017 13:56:45 -0500
Received: from [10.219.21.82] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BIujwH009071;
	Thu, 11 May 2017 13:56:45 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1494353215-51061-1-git-send-email-denis@denix.org>
	<59121D31.4050807@ti.com> <20170509200204.GD20769@edge>
	<20170511183246.GF32329@edge>
From: Jason Reeder <jreeder@ti.com>
Message-ID: <5914B3ED.70006@ti.com>
Date: Thu, 11 May 2017 13:56:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20170511183246.GF32329@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH 1/6] systemd: remove first upstreamed network patch, now in 232
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
X-List-Received-Date: Thu, 11 May 2017 18:56:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 05/11/2017 01:32 PM, Denys Dmytriyenko wrote:
> Jason,
> 
> Any comments?
> 
> On Tue, May 09, 2017 at 04:02:04PM -0400, Denys Dmytriyenko wrote:
>> Jason,
>>
>> Ah, you are right - it just failed to apply cleanly and I assumed it was 
>> already merged in.

Does the 0002 patch apply cleanly against 232? I just tried it locally and it
seemed to have conflicts as well. 0003 applied cleanly though.

>>
>> We either need to update the patch against 232, or since this is master, there 
>> are high chances for systemd to be updated in OE-Core before the next release 
>> later in the fall, which would have this patch integrated in upstream.
>>
>> Preferences?

I can update the patches against 232. I just update the patches and then replace
them in the meta-arago repo right? Wasn't there a tag to use to denote upstreamed/
backported when I send out the meta-arago patch?

>>
>> -- 
>> Denys
>>
>>
>> On Tue, May 09, 2017 at 02:49:05PM -0500, Jason Reeder wrote:
>>> Denys, this first patch didn't make it into systemd until v233. The next two
>>> patches have been merged upstream but won't be in a tagged release until the 
>>> upcoming v234.
>>>
>>> Jason
>>>
>>> On 05/09/2017 01:06 PM, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>> ---
>>>>  ...emd-network-ipv4ll-probe-conflict-counter.patch | 48 ----------------------
>>>>  .../recipes-core/systemd/systemd_%.bbappend        |  1 -
>>>>  2 files changed, 49 deletions(-)
>>>>  delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
>>>>
>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
>>>> deleted file mode 100644
>>>> index 557a297..0000000
>>>> --- a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
>>>> +++ /dev/null
>>>> @@ -1,48 +0,0 @@
>>>> -From 1e47842a0144c501cc6fd7ccc7996761f3e32ea9 Mon Sep 17 00:00:00 2001
>>>> -From: Jason Reeder <jasonreeder@gmail.com>
>>>> -Date: Mon, 3 Apr 2017 12:07:17 -0500
>>>> -Subject: [PATCH 1/3] libsystemd-network: ipv4ll probe conflict counter
>>>> -
>>>> -A bug exists where the conflict counter is cleared
>>>> -regardless of whether or not the next probe attempt leads to
>>>> -a successful address acquisition. This causes 'bursts' of
>>>> -MAX_CONFLICTS probes followed by a delay of
>>>> -RATE_LIMIT_INTERVAL instead of a single probe each
>>>> -RATE_LIMIT_INTERVAL when beyond MAX_CONFLICTS.
>>>> -
>>>> -The conflict counter should only be cleared after an
>>>> -address is successfully acquired. This commit achieves that
>>>> -goal.
>>>> -
>>>> -From RFC3927:
>>>> -A host should maintain a counter of the number of address
>>>> -conflicts it has experienced in the process of trying to
>>>> -acquire an address, and if the number of conflicts exceeds
>>>> -MAX_CONFLICTS then the host MUST limit the rate at which it
>>>> -probes for new addresses to no more than one new address per
>>>> -RATE_LIMIT_INTERVAL.  This is to prevent catastrophic ARP
>>>> -storms in pathological failure cases, such as a rogue host
>>>> -that answers all ARP probes, causing legitimate hosts to go
>>>> -into an infinite loop attempting to select a usable address.
>>>> -
>>>> -Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
>>>> ----
>>>> - src/libsystemd-network/sd-ipv4acd.c | 2 --
>>>> - 1 file changed, 2 deletions(-)
>>>> -
>>>> -diff --git a/src/libsystemd-network/sd-ipv4acd.c b/src/libsystemd-network/sd-ipv4acd.c
>>>> -index cc7436d..97f37f2 100644
>>>> ---- a/src/libsystemd-network/sd-ipv4acd.c
>>>> -+++ b/src/libsystemd-network/sd-ipv4acd.c
>>>> -@@ -249,8 +249,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
>>>> -                         r = ipv4acd_set_next_wakeup(ll, RATE_LIMIT_INTERVAL, PROBE_WAIT);
>>>> -                         if (r < 0)
>>>> -                                 goto out;
>>>> --
>>>> --                        ll->conflict = 0;
>>>> -                 } else {
>>>> -                         r = ipv4acd_set_next_wakeup(ll, 0, PROBE_WAIT);
>>>> -                         if (r < 0)
>>>> --- 
>>>> -1.9.1
>>>> -
>>>> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>> index 8fccdb5..5f54316 100644
>>>> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
>>>> @@ -14,7 +14,6 @@ SRC_URI_append = " \
>>>>      file://30-wlan.network \
>>>>      file://60-usb.network \
>>>>      file://sync-clocks.service \
>>>> -    file://0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch \
>>>>      file://0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch \
>>>>      file://0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch \
>>>>  "
>>>>
>>>
>>> -- 
>>> Jason Reeder
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

-- 
Jason Reeder

