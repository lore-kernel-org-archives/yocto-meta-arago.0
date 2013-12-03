Return-Path: <trini@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0E03952972
	for <meta-arago@arago-project.org>;
	Tue,  3 Dec 2013 12:43:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB3ChPHS004802
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2013 06:43:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB3ChPue003196
	for <meta-arago@arago-project.org>; Tue, 3 Dec 2013 06:43:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Dec 2013 06:43:25 -0600
Received: from [172.22.137.210] (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB3ChL4S024275;
	Tue, 3 Dec 2013 06:43:22 -0600
Message-ID: <529DD200.2040500@ti.com>
Date: Tue, 3 Dec 2013 07:43:44 -0500
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
	<20131122200029.GT420@bill-the-cat>
	<8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
	<20131123021545.GV420@bill-the-cat>,
	<20131202213126.GB17528@denix.org>
	<3EDB709B-9073-4B52-A2D6-827AFBBF658A@ti.com>
	<529D23C8.2080305@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C5CB341@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5CB341@DFLE08.ent.ti.com>
X-Enigmail-Version: 1.6
X-Mailman-Approved-At: Wed, 11 Dec 2013 18:45:31 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Tue, 03 Dec 2013 12:43:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 12/02/2013 08:20 PM, Cooper Jr., Franklin wrote:
> 
> 
>> -----Original Message-----
>> From: Rini, Tom
>> Sent: Monday, December 02, 2013 6:20 PM
>> To: Cooper Jr., Franklin
>> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new udev
>> entry
>>
>> On 12/02/2013 06:23 PM, Cooper Jr., Franklin wrote:
>>>
>>>
>>>> On Dec 2, 2013, at 3:31 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>>>>
>>>>> On Fri, Nov 22, 2013 at 09:15:45PM -0500, Tom Rini wrote:
>>>>>> On Fri, Nov 22, 2013 at 10:27:06PM +0000, Cooper Jr., Franklin wrote:
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
>>>>>>> Sent: Friday, November 22, 2013 2:00 PM
>>>>>>> To: Cooper Jr., Franklin
>>>>>>> Cc: meta-arago@arago-project.org
>>>>>>> Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use
>>>>>>> new udev entry
>>>>>>>
>>>>>>>> On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr
>> wrote:
>>>>>>>>
>>>>>>>> * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a
>> udev
>>>>>>> entry to
>>>>>>>>  automatically mount sd card partition.
>>>>>>>> * For some reason that udev entry isn't automatically ran.
>>>>>>>> * As a workaround manually trigger udev to run twice (not sure
>>>>>>>> why thats
>>>>>>> needed)
>>>>>>>>  for the udev rule to run correctly.
>>>>>>>>
>>>>>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>>>>>>
>>>>>>> This issn't right.  Have you added debugging steps to the mount.sh script?
>>>>>>> We're saying, with this change "lets trigger all block devices 3
>>>>>>> times", and on the 3rd attempt we finally do mount things.  I've
>>>>>>> seen some partitions NOT be auto- mounted due to being dirty and
>>>>>>> needing an fsck prior to mounting them.  If we need to do this
>>>>>>> type of change at the end as a "we can't figure out the root cause, but we
>> need to release", OK.
>>>>>>> But I don't think we're there yet.  Thanks!
>>>>
>>>>>> [Franklin] Just to give an update it looks like fsck is required to
>>>>>> be ran to fix this problem however it wouldn't be safe to run fsck
>>>>>> and let it auto fix the problem since that could cause potential
>>>>>> issues. So if fsck is really the proper solution then I'm not sure
>>>>>> that would work for something that needs to automatically work at
>> bootup.
>>>>>
>>>>> Well, dirty cards shouldn't be auto-mounted.  Or there's some option
>>>>> to mount we should be passing to say "no, it's OK".
>>>>
>>>> So, what is the agreement here? I don't think forcing fsck for
>>>> mounting a card is a good idea. I agree with Tom that if the card is
>>>> dirty (could be corrupted), then user intervention is required anyway.
>>>>
>>>> I'm planning on skipping these 2 patches, if nobody objects.
>>> We need to figure this out but feel free to skip the patches.
>>
>> Well, lets step back.  Did we confirm that the problem is that it's dirty (in which
>> case, trying to mount it N times should give N failures, not "3rd time is the
>> charm!") or just that fsck'ing one particular card fixed that part of the card that
>> wasn't mounting (but the rest of it
>> was?) or what?
> [Franklin] I'm not sure why by forcing it to run a third time it ran without a problem when the card is dirty. However, I did determine it was an issue with the card being dirty and that is what was preventing it from mounting automatically at boot up. Running fsck revealed there were indeed problems and after fixing those issues and trying it again without my extra script the partitions successfully mounted the first time. Although the rootfs partition doesn't mount automatically but that is probably expected.

No, all partitions on the card should be mounted.

-- 
Tom

