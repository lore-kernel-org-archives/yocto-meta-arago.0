Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0322B52A19
	for <meta-arago@arago-project.org>;
	Thu,  9 Nov 2017 13:33:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA9DXraH006784
	for <meta-arago@arago-project.org>; Thu, 9 Nov 2017 07:33:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510234433;
	bh=TDkyIztUhO29dlMN5nn8/PrENgnGePqK6d4EQIsyXaQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fX/R7/j2EYBronCflq8ZqoENvbz/zIyNT1nQNsU+4NC6gPW6+w91Ld4223g8HwW9g
	Tivt32PQhJkkgcMBC2ig0qGHINgSRosEHNxgVPszAYS2ZiLHpqFyJo9yBsDRgfXZ/s
	2nXl33wplSATk9XwW1GOLH4t7dhoZFTY0ejKDEDk=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9DXqGA002257
	for <meta-arago@arago-project.org>; Thu, 9 Nov 2017 07:33:53 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9DXo9I012153
	for <meta-arago@arago-project.org>; Thu, 9 Nov 2017 19:03:51 +0530
Received: from [172.22.208.60] (172.22.208.60) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Nov 2017 19:03:47 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1510112505-15937-1-git-send-email-x0038811@ti.com>
	<4913a363-0e3b-8a93-88e3-d7187a795a2f@ti.com>
	<20171108144504.GA12918@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <48c70982-7a4a-d4ca-0388-803733879496@ti.com>
Date: Thu, 9 Nov 2017 21:33:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108144504.GA12918@edge>
X-Originating-IP: [172.22.208.60]
Cc: meta-arago@arago-project.org, Ramprasad N <x0038811@ti.com>
Subject: Re: [morty PATCH] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Thu, 09 Nov 2017 13:33:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,


On 08-Nov-17 10:45 PM, Denys Dmytriyenko wrote:
> On Wed, Nov 08, 2017 at 05:36:33PM +0800, Karthik Ramanan wrote:
>> Looks good. ACK.
> Where's the patch?
Are you referring to the patch missing in the patchwork on the 
meta-arago list? Even I was wondering why I couldn't find it.
Or is it something else?
>
>
>> On 08-Nov-17 11:41 AM, Ramprasad N wrote:
>>> Signed-off-by: Ramprasad N <x0038811@ti.com>
>>> ---
>>>   ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
>>>   .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
>>>   2 files changed, 41 insertions(+)
>>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>>> new file mode 100644
>>> index 0000000..1af90c1
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>>> @@ -0,0 +1,33 @@
>>> +From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 2001
>>> +From: Ramprasad N <x0038811@ti.com>
>>> +Date: Fri, 13 Oct 2017 15:48:06 +0530
>>> +Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
>>> +
>>> +v4l2src plugin allocates 4 buffers for the pipeline.
>>> +To capture video in realtime the pipeline without frameloss,
>>> +four buffers are not sufficient. Increase the
>>> +number of buffers by 4 more.
>>> +
>>> +Signed-off-by: Ramprasad N <x0038811@ti.com>
>>> +---
>>> + sys/v4l2/gstv4l2object.c | 4 +++-
>>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
>>> +index 549e06f..773f46d 100644
>>> +--- a/sys/v4l2/gstv4l2object.c
>>> ++++ b/sys/v4l2/gstv4l2object.c
>>> +@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>>> +      * to fill the pipeline, the minimum required to decoder according to the
>>> +      * driver and 1 more, so we don't endup up with everything downstream or
>>> +      * held by the decoder. */
>>> +-    own_min = min + obj->min_buffers + 1;
>>> ++    /* Increase the number of buffers required by 4 more to capture video in
>>> ++     * realtime. With default number of 4 buffers, frame loss is observed */
>>> ++    own_min = min + obj->min_buffers + 5;
>>> +
>>> +     /* If no allocation parameters where provided, allow for a little more
>>> +      * buffers and enable copy threshold */
>>> +--
>>> +1.9.1
>>> +
>>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
>>> new file mode 100644
>>> index 0000000..29a07b2
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
>>> @@ -0,0 +1,8 @@
>>> +PR_append = ".arago0"
>>> +
>>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>> +
>>> +SRC_URI += " \
>>> +      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
>>> +      "
>>> +
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


