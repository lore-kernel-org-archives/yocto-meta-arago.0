Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 86DB0529A4
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 15:00:38 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TF0atB002688
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 09:00:37 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TF0XRQ029427
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 20:30:34 +0530
Received: from [172.24.157.85] (172.24.157.85) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 29 Jan 2015 20:30:32 +0530
Message-ID: <54CA4B0E.10503@ti.com>
Date: Thu, 29 Jan 2015 20:30:30 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <1422541885-5800-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F048A@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7F048A@DFLE08.ent.ti.com>
X-Originating-IP: [172.24.157.85]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [RFC PATCH] base-files: Increase /var/volatile size
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
X-List-Received-Date: Thu, 29 Jan 2015 15:00:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the feedback Franklin.

Starting from Weston 1.6.0, weston itself consumes about 10MB of the 
tmpfs while it initializes. You might have not seen this because this is 
observable only when you use multiple displays (usually with DRM backend).

And then on top of this when you invoke many the weston applications 
together, we quickly run out of the 16MB size that is preconfigured.

It is desirable that this size be as high as possible to allow more UI 
intensive applications, and many applications, to be able to run 
simultaneously.

This would be needed for all platforms and more so with QT applications 
coming in, I'm guessing that this will need to be set to a higher value.

Can we agree on some reasonably big size?

Regards
Karthik

On 29-Jan-15 8:20 PM, Cooper Jr., Franklin wrote:
> I think the size just determines the "maximum" amount of RAM that can be used. So your basically your allowing the tmpfs to consume upto 50MB of memory. I never seen an issue on Beaglebone Black and AM57 with the current tmpfs being too small. Are the problems your seeing related to a particular application/demo? If its specific to a particular platform maybe just create a custom fstab for that platform.
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of R, Karthik
>> Sent: Thursday, January 29, 2015 8:31 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [RFC PATCH] base-files: Increase /var/volatile size
>>
>> * Weston applications allocate memory from tmpfs, need to
>>    increase the tmpfs area to atleast 50M. Can this be
>>    increased more - what are the pros/cons?
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   .../recipes-core/base-files/base-files/fstab       |    2 +-
>>   .../base-files/base-files_3.0.14.bbappend          |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> b/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> index 9ed6f33..8ddadd9 100644
>> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> +++ b/meta-arago-distro/recipes-core/base-files/base-files/fstab
>> @@ -5,7 +5,7 @@ proc                 /proc                proc       defaults              0  0
>>   devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
>>   usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
>>   tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0
>> 0
>> -tmpfs                /var/volatile        tmpfs      defaults,size=16M     0  0
>> +tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
>>   tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
>>
>>   # uncomment this if your device has a SD/MMC/Transflash slot diff --git
>> a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
>> b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
>> index 40b7722..956a057 100644
>> --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
>> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
>> +++ nd
>> @@ -1,4 +1,4 @@
>>   # look for files in this layer first
>>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>
>> -PR_append = "-arago3"
>> +PR_append = "-arago4"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


